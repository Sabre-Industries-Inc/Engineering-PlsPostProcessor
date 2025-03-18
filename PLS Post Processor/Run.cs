using NLog;
using PLS_Post_Processor.Helpers;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Drawing;
using System.IO;
using System.IO.Compression;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Text.RegularExpressions;
using System.Xml;
using WW.Cad.Drawing;
using WW.Cad.IO;
using WW.Cad.Model;
using WW.Math;

//using SixLabors.ImageSharp.PixelFormats;
//using SixLabors.ImageSharp;

namespace PLS_Post_Processor
{
    /// <summary>
    /// Define the DXF export to image format
    /// </summary>
    internal enum ImageExportFormat
    {
        Unknown,
        Png,
        Jpg,
        Bmp,
        Gif
    }

    public class Run
    {
        private static readonly Logger Logger = LogManager.GetCurrentClassLogger();

        private static decimal supportedPlsVersion = 0;
        private static bool validPlsVersion = false;
        private static string plsDxfFullPath = "";
        private static string plsDxfTopFullPath = "";
        private static string plsDxfFrontFullPath = "";
        private static string plsDxfIsoFullPath = "";

        private const int maxPlsWaitTimeMilli = 7000;  // ==> milliseconds

        private static List<string> _plsPolDependecies = new List<string>();

        private static bool _upgradeTest = false;

        public static void RunApp(bool upgradeTest)
        {
            _upgradeTest = upgradeTest;

            string version = Assembly.GetExecutingAssembly().GetName().Version.ToString();
            string upTest = (_upgradeTest ? "[*** Upgrade Test ***]" : "");
            ConsoleUtility.WriteProgressBar($"Begin (Version: {version}){upTest}", 0);

            (string path, string ver) plsInfo = ParsePolPath();
            string polPath = plsInfo.path;
            decimal plsVersion = 0m;
            string[] w = plsInfo.ver.Split(' ');
            if (w.Length == 2)
            {
                plsVersion = decimal.Parse(w[1]);
            }

            // *** Get (SFC)Quote database PLS supported version
            var (supportedVersion, isSupported) = DbReader.GetSupportedPlsVersion(plsVersion);
            supportedPlsVersion = supportedVersion;

            // *** Is the PLS version being used supported?
            var plsVersionIsSupported = isSupported || _upgradeTest;

            string stagingPath = Globals.StagingPath;   // EG: "c:\pls\temp\stage"
            string uploadFile = Globals.UploadFile;     // EG: "c:\pls\temp\plsupload.zip"
            string tempFileName = $"{Path.GetFileNameWithoutExtension(polPath)}__TEMP";
            string tempPolPath = Path.Combine(Path.GetDirectoryName(polPath), $"{tempFileName}{Path.GetExtension(polPath)}");

            if (!Directory.Exists(stagingPath))
            {
                Directory.CreateDirectory(stagingPath);

                ConsoleMessage stageDirMsg = new ConsoleMessage(MessageType.Standard,
                    $"PLS stage directory did not exists. It has been created.\r\n");
                ConsoleMessages.Instance.AddMessage(stageDirMsg);
            }

            if (File.Exists(uploadFile))
            {
                File.Delete(uploadFile);
            }

            // *** Delete the PLsUpload.zip file before checking the PLS version.
            // ***
            // *** Check the PLS XML version to make sure it matches the current supported PLS version.
            // *** The check will ensure SFC and PLS process will work correctly.
            if (!plsVersionIsSupported) // || plsVersion != supportedPlsVersion)
            {
                Console.WriteLine("");
                Console.ForegroundColor = ConsoleColor.Red;
                Console.WriteLine("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
                Console.WriteLine("!!! E R R O R                                                                   !!!");
                Console.WriteLine($"!!! The PLS file is version {plsVersion:f2}. The currently supported PLS version is {supportedPlsVersion:f2} !!!");
                Console.WriteLine($"!!! Please update to PLS version {Run.supportedPlsVersion:f2} to continue.                             !!!");
                Console.WriteLine($"!!! The PlsUpload.zip will NOT be created                                       !!!");
                Console.WriteLine($"!!! <Press any key to terminate PLS Post-Processor>                             !!!");
                Console.WriteLine("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
                Console.ReadKey();
                return;
            }

            File.Copy(polPath, tempPolPath, overwrite: true);

            (int err, string lcaPath) results = GetAllPolDependencies(polPath);
            string lcaPath = results.lcaPath;
            int err = results.err;
            if (err > 90)
            {
                ConsoleMessage errMsg = new ConsoleMessage(MessageType.Error,
                    "Error: parsing .POL for dependencies!\r\n" +
                    "PLS Post Processor terminated!\r\n" +
                    "No DXF, PNG, or zip files created.\r\n\r\n" +
                    "Please save your PLS model before you run analysis."
                );

                ConsoleMessages.Instance.AddMessage(errMsg);
                return;
            }

            // *** The .pol file has been copied to a temporary file.
            // *** PLS expects the .lca file name to be the same as the
            // *** as the .pol file.  So, make it the same with the .lca extension.
            string tempLcaPath = Path.ChangeExtension(tempPolPath, "lca");
            File.Copy(lcaPath, tempLcaPath, true);

            ConsoleUtility.WriteProgressBar("Create Command File: get DXF's from PLS", 20, update: true, wait: true);

            CreateCommandFile(tempPolPath, stagingPath);
            RunCommandFile();

            ConsoleUtility.WriteProgressBar("Generate PNG images", 40, update: true, wait: true);

            DxfImageExporter(plsDxfFrontFullPath);
            DxfImageExporter(plsDxfTopFullPath);
            DxfImageExporter(plsDxfIsoFullPath);

            // *** Delete the temporary files before zipping the workspace.
            File.Delete(tempPolPath);
            File.Delete(tempLcaPath);

            ConsoleUtility.WriteProgressBar("Zip PLS workspace files", 60, update: true, wait: true);

            // *** Create a zip file from the WorkSpace
            string workSpacePath = Path.Combine(stagingPath, Globals.WorkspaceName);
            string zipFilePath = Path.Combine(stagingPath, $"{Globals.WorkspaceName}.zip");
            ZipFile.CreateFromDirectory(workSpacePath, zipFilePath);

            // *** Zip the contents of the staging area.
            ConsoleUtility.WriteProgressBar("Zip ALL", 80, update: true, wait: true);

            ZipFile.CreateFromDirectory(stagingPath, uploadFile);

            // *** Check to make sure the PLS-Pole Schema File is up to date.
            ConsoleUtility.WriteProgressBar("Check PLS-Pole Schema File", 90, update: true, wait: true);
            bool schemaFileUpdated = CheckPlsPoleSchemaFile();

            if (schemaFileUpdated)
            {
                ConsoleUtility.WriteProgressBar("Complete ~> PLS-Pole Schema File Updated", 100, update: true, wait: true);
            }
            else
            {
                ConsoleUtility.WriteProgressBar("Complete", 100, update: true, wait: true);
            }

            ConsoleUtility.Pause(Globals.ConsolePauseWhenDone);
        }

        /// <summary>
        /// Check the PLS-Pole Schema File to make sure it is up to date.
        /// </summary>
        /// <remarks>
        /// <para>
        /// The PLS-Pole Schema File check will compare:
        ///   The schema file version between the valid and user schema files.  If the user schema file
        ///   version is less than the valid schema file versions, the valid schema file is copied to
        ///   the users %appdata%\pls.
        /// </para>
        /// <para>
        ///   Compare the records defined in the SchemaRecords list, if any of the records
        ///   are not equal, the valid schema file is copied to the users %appdata%\pls.
        /// </para>
        /// </remarks>
        private static bool CheckPlsPoleSchemaFile()
        {
            string rootPath = Path.GetDirectoryName(Assembly.GetEntryAssembly().Location);
            string validSchema = "valid-pls-pole.sma";
            string validSchemaPath = Path.Combine(rootPath, validSchema);

            if (!File.Exists(validSchemaPath))
            {
                Console.WriteLine("");
                Console.ForegroundColor = ConsoleColor.Red;
                Console.WriteLine("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
                Console.WriteLine("!!! E R R O R                                                                   !!!");
                Console.WriteLine($"!!! The Valid Schema file [{validSchemaPath}] is not defined!! !!!");
                Console.WriteLine("!!! <Press any key to terminate PLS Post-Processor>                             !!!");
                Console.WriteLine("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
                Console.ReadKey();
                return false;
            }

            string schemaFileName = @"PLS\pls-pole.sma";
            string appDataPath = Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData);
            string userSchemaPath = Path.Combine(appDataPath, schemaFileName);

            if (!File.Exists(userSchemaPath))
            {
                Console.WriteLine("");
                Console.ForegroundColor = ConsoleColor.Red;
                Console.WriteLine("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
                Console.WriteLine("!!! E R R O R                                                                   !!!");
                Console.WriteLine($"!!! The User's Schema file [{schemaFileName}] could not found!! !!!");
                Console.WriteLine($"!!! <Press any key to terminate PLS Post-Processor>                             !!!");
                Console.WriteLine("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
                Console.ReadKey();
                return false;
            }

            var validSchemaFile = File.ReadLines(validSchemaPath).ToList();
            decimal validSchemaVersion = GetVersion(validSchemaFile);

            var userSchemaFile = File.ReadLines(userSchemaPath).ToList();

            string schemaVersionStr = string.Empty;
            decimal userSchemaVersion = GetVersion(userSchemaFile);

            if (validSchemaVersion > userSchemaVersion)
            {
                File.Copy(validSchemaPath, userSchemaPath, overwrite: true);
                return true;
            }

            // *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** ***
            // *** Check the format definitions between the valid and user Schema file:
            // ***  for Steel Pole Properties
            // ***       ~ Length
            // ***       ~ Tip
            // ***       ~ Base
            // ***       ~ Taper
            // ***  For Steel Tubes Properties
            // ***       ~ Length
            // ***       ~ Thickness
            // ***       ~ Lap Length
            // ***       ~ Tube Top
            // ***       ~ Tube Bot.
            // *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** ***
            List<SchemaRecord> schemaRecords = new List<SchemaRecord>
            {
                new SchemaRecord{ SearchString = "Length\n", BlockString = "Steel Pole Properties"},
                new SchemaRecord{ SearchString = "Tip\nDiameter\n", BlockString = "Steel Pole Properties"},
                new SchemaRecord{ SearchString = "Base\nDiameter\n", BlockString = "Steel Pole Properties"},
                new SchemaRecord{ SearchString = "Taper\n", BlockString = "Steel Pole Properties"},

                new SchemaRecord{ SearchString = "Length\n", BlockString = "Steel Tubes Properties"},
                new SchemaRecord{ SearchString = "Thickness\n", BlockString = "Steel Tubes Properties"},
                new SchemaRecord{ SearchString = "Lap\nLength\n", BlockString = "Steel Tubes Properties" },
                new SchemaRecord{ SearchString = "Tube Top\nDiameter\n", BlockString = "Steel Tubes Properties"},
                new SchemaRecord{ SearchString = "Tube Bot.\nDiameter\n", BlockString = "Steel Tubes Properties" },
            };

            foreach (var record in schemaRecords)
            {
                record.AssignRecord(userSchemaFile, user: true);
                record.AssignRecord(validSchemaFile, user: false);
            }

            // *** If any record is not equal, copy in the valid schema file.
            bool copyValid = schemaRecords.Any(s => !s.IsEqual);

            if (copyValid)
            {
                var attr = File.GetAttributes(userSchemaPath);

                // *** Turn off Read-only attribute.
                var attrRead = attr & ~FileAttributes.ReadOnly;
                File.SetAttributes(userSchemaPath, attrRead);

                File.Copy(validSchemaPath, userSchemaPath, overwrite: true);

                // *** Turn Read-only attribute back on.
                attrRead = attr | FileAttributes.ReadOnly;
                File.SetAttributes(userSchemaPath, attrRead);

                return true;
            }

            return false;
        }

        /// <summary>
        /// Get the PLS-Pole Schema File version
        /// </summary>
        /// <param name="schema"></param>
        /// <returns></returns>
        private static decimal GetVersion(List<string> schema)
        {
            var header = schema[0];

            // Define the regular expression pattern
            // Find the first match
            string pattern = @"VERSION='([\d.]+)'"; // Matches digits and decimal points within single quotes
            Match match = Regex.Match(header, pattern);
            string schemaVersionStr = (match.Success ? match.Groups[1].Value : string.Empty);
            //pattern = @"SOURCE='([^']+)'"; // Matches everything between single quotes

            decimal schemaVersion = 0;
            decimal.TryParse(schemaVersionStr, out schemaVersion);

            return schemaVersion;
        }

        /// <summary>
        /// Get the .POL path which is defined in the postproc.xml file.
        /// </summary>
        /// <returns>Returns the project path defined in PLS postproc.xml</returns>
        private static (string path, string ver) ParsePolPath()
        {
            string postprocPath = Globals.PlsPostProcPath; // EG: "c:\pls\temp\postproc.xml"

            XmlDocument xdoc = new XmlDocument();
            xdoc.Load(postprocPath);

            XmlNodeList nl = xdoc.GetElementsByTagName("creator");
            string polPath = nl[0].Attributes["projectpath"].Value;
            string plsVersion = nl[0].Attributes["version"].Value;

            return (polPath, plsVersion);
        }

        /// <summary>
        /// Parse the .POL file to get all file dependencies.
        /// All file dependencies will be copied to the staging WorkSpace.
        /// </summary>
        /// <returns>Return the error status: 99 = error, 0 no errors</returns>
        private static (int err, string lcaPath) GetAllPolDependencies(string polPath)
        {
            if (!File.Exists(polPath))
            {
                ConsoleMessage errMsg = new ConsoleMessage(MessageType.Error,
                    ".POL has not been defined:!\r\n" +
                    $"{polPath}\r\n\r\n" +
                    "PLS Post Processor terminated!\r\n" +
                    "No DXF, PNG, or zip files created."
                );

                ConsoleMessages.Instance.AddMessage(errMsg);
                return (99, string.Empty);
            }

            // *** Read contents of .POL file even if it's open by another process.
            string polContent = string.Empty;
            using (var fs = new FileStream(polPath, FileMode.Open, FileAccess.Read, FileShare.ReadWrite))
            using (var sr = new StreamReader(fs, Encoding.Default))
            {
                polContent = sr.ReadToEnd();
            }

            var search = new[] { Environment.NewLine, @"\r\n" };
            string[] polLines = polContent.Split(search, StringSplitOptions.None);

            // *** Get all file dependencies from the .POL file.
            List<string> dependecies = new List<string> { polPath };

            string pattern = Globals.PlsPolRegexPattern;
            Regex regex = new Regex(pattern);
            Regex extRegex = new Regex(@"\.[0-9a-z]+$", RegexOptions.IgnoreCase);
            foreach (var polLine in polLines)
            {
                Match match = regex.Match(polLine);
                Match extMatch = extRegex.Match(polLine);
                if (match.Success && extMatch.Success)
                {
                    dependecies.Add(polLine.Trim());
                }
            }

            // *** Only copy the unique files.
            _plsPolDependecies = dependecies.Distinct().ToList();

            if (_plsPolDependecies.Count <= 1)
            {
                ConsoleMessage errMsg = new ConsoleMessage(MessageType.Error,
                    $"Paths to dependencies could not be found! \r\n" +
                    $"{polPath}\r\n\r\n" +
                    "PLS Post Processor terminated!\r\n" +
                    "No DXF, PNG, or zip files created.\r\n\r\n" +
                    "Please save your PLS model before you run analysis."
                );

                ConsoleMessages.Instance.AddMessage(errMsg);
                return (99, string.Empty);
            }

            // *** the .lca file must exist otherwise PLS will not run.
            var lcaPath = _plsPolDependecies.Find(f => f.EndsWith("lca"));
            var lcaFound = !string.IsNullOrEmpty(lcaPath);
            if (!lcaFound)
            {
                ConsoleMessage errMsg = new ConsoleMessage(MessageType.Error,
                    "LCA path could not be found!\r\n" +
                    $"{polPath}\r\n\r\n" +
                    "PLS Post Processor terminated!\r\n" +
                    "No DXF, PNG, or zip files created.\r\n\r\n" +
                    "Please save your PLS model before you run analysis."
                );
                ConsoleMessages.Instance.AddMessage(errMsg);
                return (99, string.Empty);
            }

            // *** Copy all POL dependencies to WorkSpace under Staging
            string stagingPath = Globals.StagingPath;   // EG: "c:\pls\temp\stage"
            string workSpacePath = Path.Combine(stagingPath, Globals.WorkspaceName);
            if (!Directory.Exists(workSpacePath))
            {
                Directory.CreateDirectory(workSpacePath);
            }
            else
            {
                foreach (var f in Directory.GetFiles(workSpacePath))
                {
                    File.Delete(f);
                }
            }

            // *** Copy the .pol file and all dependencies to staging/WorkSpace
            foreach (var file in _plsPolDependecies)
            {
                if (!File.Exists(file))
                {
                    ConsoleMessage errMsg = new ConsoleMessage(MessageType.Error,
                        $"{file} not found in: \r\n" +
                        $"{polPath}\r\n\r\n" +
                        "Did you save the PLS model before 'Run'?" +
                        "File skipped!\r\n"
                    );

                    ConsoleMessages.Instance.AddMessage(errMsg);
                    continue;
                }

                // *** skip the Post Processor executable.
                string ext = Path.GetExtension(file);
                if (ext.Equals(".exe", StringComparison.OrdinalIgnoreCase))
                {
                    continue;
                }

                string fileName = Path.GetFileName(file);
                string to = Path.Combine(workSpacePath, fileName);
                File.Copy(file, to, overwrite: true);
            }

            // *** Return error status: 0 = everything worked.
            return (0, lcaPath);
        }

        /// <summary>
        /// Create the PLS command file.
        /// </summary>
        /// <param name="tempPolPath"></param>
        /// <param name="stagingPath"></param>
        private static void CreateCommandFile(string tempPolPath, string stagingPath)
        {
            if (!Directory.Exists(stagingPath))
            {
                Directory.CreateDirectory(stagingPath);
            }
            else
            {
                foreach (var f in Directory.GetFiles(stagingPath))
                {
                    File.Delete(f);
                }
            }

            string cmdFilePath = Globals.CmdFilePath; // @"c:\pls\temp\postcmd.cmd";
            plsDxfFullPath = $@"{stagingPath}\peFront.dxf";
            plsDxfTopFullPath = $@"{stagingPath}\peTop.dxf";
            plsDxfFrontFullPath = plsDxfFullPath; // $@"{stagingPath}\peFront.dxf";
            plsDxfIsoFullPath = $@"{stagingPath}\peIso.dxf";

            // *** PLS API parameters for DXF.
            string code3D = "1";            // 1 = 3D, 0 = 2D
            string drawMode = "1";          // 0 = line, 1 = wire frame, 2 = rendered (before 5/22/23 = 2)
            string displayLabels = "1";     // 1 = on, 0 = off
            string longitude = "0";        // longitude of view in degrees
            string latitude = "0";         // latitude of view in degrees
            string annotation = "1";        // optional display of annotation: 1 = on, 0 = off (PLS 18.05+)

            using (StreamWriter sw = new StreamWriter(cmdFilePath, false))
            {
                sw.WriteLine(@"TYPE='PLS POSTPROC COMMAND FILE' VERSION='1' UNITS='US' SOURCE='PLS-POLE' USER='Sabre Industries, Inc.' FILENAME='c:\pls\temp\postcmd.cmd'");
                sw.WriteLine($@"49 '{tempPolPath}'");
                sw.WriteLine($@"42 '{plsDxfFullPath}' {code3D} {drawMode} {displayLabels} {longitude} {latitude} {annotation}");
                sw.WriteLine($@"42 '{plsDxfTopFullPath}' {code3D} {drawMode} 0 0 90 {annotation}");
                sw.WriteLine($@"42 '{plsDxfIsoFullPath}' {code3D} {drawMode} 0 20 30 {annotation}");
                sw.WriteLine("3 ; exit");
            }

            string pathToPostproc = Globals.PlsPostProcPath;
            File.Copy(pathToPostproc, $@"{stagingPath}\postproc.xml", true);
            //File.Copy(@"c:\pls\temp\postproc.xml", $@"{stagingPath}\postproc.xml", true);
        }

        private static void RunCommandFile()
        {
            string curPathToPls = Globals.PathToPlsExe;
            string pre17PathToPls = Globals.PathToPre17PlsExe;

            string pathToPls = string.Empty;

            if (File.Exists(curPathToPls))
            {
                pathToPls = curPathToPls;
            }
            else if (File.Exists(pre17PathToPls))
            {
                pathToPls = pre17PathToPls;
            }
            else
            {
                string errMsg = $"Path to PLS executable not found! The executable should be located in {pre17PathToPls}.\r\n{pathToPls}";
                Logger.Error(errMsg);
                throw new Exception(errMsg);
            }

            ProcessStartInfo psi = new ProcessStartInfo();
            psi.FileName = pathToPls;
            psi.Arguments = $@"COMMAND {Globals.PathToPlsCmdFile} HIDE";

            var proc = new Process { StartInfo = psi };
            proc.Start();
            proc.WaitForExit(); // maxPlsWaitTimeMilli); // 10000);
        }

        /// <summary>
        /// Read the DXF drawing and export to the specified image format (default = png)
        /// </summary>
        /// <remarks>
        /// <para>See Wout's URL: http://www.woutware.com/doc/cadlib4.0/api/WW.Cad.IO.DxfReader.html</para>
        /// <para>For Auto sized bitmap see URL: https://woutware.com/Forum/Topic/1962</para>
        /// </remarks>
        private static void DxfImageExporter(string dxfFilePath)
        {
            ImageExportFormat format = ImageExportFormat.Png;
            if (format == ImageExportFormat.Unknown)
            {
                Logger.Error("Unknown image format.");
                return;
            }

            //string dxfFilePath = plsDxfIsoFullPath; // plsDxfFullPath;
            string sFormat = format.ToString().ToLower();

            DxfModel model = null;
            try
            {
                model = CadReader.Read(dxfFilePath);
            }
            catch (Exception e)
            {
                string errMsg = $"Error opening DXF during DXF image export.\r\n{dxfFilePath}";
                Logger.Error(e, errMsg);
            }

            bool frontFace = Regex.IsMatch(dxfFilePath, "Front", RegexOptions.IgnoreCase);
            CleanupDxfDrawing(model, frontFace: frontFace);

            // *** The image output file full path with defined extension.
            string outfile = Path.ChangeExtension(dxfFilePath, sFormat);

            Stream stream;
            Size maxSize = new Size(500, 500);
            //Image<Bgra32> bitmap = ImageExporter.CreateAutoSizedBitmap<Bgra32>(
            Bitmap bitmap =
                ImageExporter.CreateAutoSizedBitmap(model, Matrix4D.Identity,
                    GraphicsConfig.AcadLikeWithWhiteBackground, maxSize);
            //GraphicsConfig.AcadLikeWithBlackBackground, maxSize);

            switch (format)
            {
                case ImageExportFormat.Bmp:
                    using (stream = File.Create(outfile))
                    {
                        ImageExporter.EncodeImageToBmp(bitmap, stream);
                    }
                    break;

                case ImageExportFormat.Gif:
                    using (stream = File.Create(outfile))
                    {
                        ImageExporter.EncodeImageToGif(bitmap, stream);
                    }
                    break;

                case ImageExportFormat.Png:
                    using (stream = File.Create(outfile))
                    {
                        ImageExporter.EncodeImageToPng(bitmap, stream);
                    }
                    break;

                case ImageExportFormat.Jpg:
                    using (stream = File.Create(outfile))
                    {
                        ImageExporter.EncodeImageToJpeg(bitmap, stream);
                    }
                    break;
            }
        }

        /// <summary>
        /// Clean up the DXF model by modifying the annotation layer.
        ///
        /// For the Front Face:
        ///     modify Annotation Layer
        ///         *) locate PLS Dimension (line, text and 3DFace)
        ///         *) create DxfDimensions to replace the PLS Dimension
        ///         *) Reduce the dimension text and arrow size.
        ///     Modify layer '1'.
        ///         *) Reduce text size
        ///         *) identify overlapping text and make them invisible
        ///
        /// For the Top and Isometric views:
        ///     Disable both the Annotation and '1' layer to make them invisible.
        /// </summary>
        /// <param name="model"></param>
        private static void CleanupDxfDrawing(DxfModel model, bool frontFace) //, string dxfFullPath)
        {
            string txtLayer = "0";
            if (model.Layers.Keys.Contains(txtLayer))
            {
                model.Layers[txtLayer].Enabled = false;
            }

            if (frontFace)
            {
                _ = new DxfDrawingModifier(model);
            }
            else
            {
                // *** Turn off the Annotation layer if it exists.
                string annoLayer = "Annotation";
                if (model.Layers.Keys.Contains(annoLayer))
                {
                    model.Layers[annoLayer].Enabled = false;
                }
            }

            string dxfFullPath = model.Filename;
            dxfFullPath = dxfFullPath.Replace(".dxf", "_0.dxf");
            DxfWriter.Write(dxfFullPath, model);
        }
    }
}