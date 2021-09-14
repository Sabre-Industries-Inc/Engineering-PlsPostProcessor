using System;
using System.IO;
using System.Xml;
using System.Diagnostics;
using System.IO.Compression;

using WW.Cad.Model;
using WW.Cad.IO;
using System.Drawing;
using WW.Cad.Drawing;
using WW.Math;

using NLog;
using WW.Cad.Model.Entities;
using System.Collections.Generic;
using System.Text;
using PLS_Post_Processor.Helpers;
using System.Text.RegularExpressions;

//using SixLabors.ImageSharp.PixelFormats;
//using SixLabors.ImageSharp;

namespace PLS_Post_Processor
{
    /// <summary>
    /// Define the DXF export to image format
    /// </summary>
    enum ImageExportFormat
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

        private static string plsDxfFullPath = "";
        private static string plsDxfTopFullPath = "";
        private static string plsDxfFrontFullPath = "";
        private static string plsDxfIsoFullPath = "";

        private const int maxPlsWaitTimeMilli = 5000;  // ==> milliseconds

        private static List<string> _plsPolDependecies = new List<string>();

        public static void RunApp()
        {
            ConsoleUtility.WriteProgressBar("Begin", 0);

            string polPath = ParsePolPath();
            string polFile = Path.GetFileName(polPath);

            string wrkSpacePath = Path.GetDirectoryName(polPath);
            string stagingPath = Globals.StagingPath;   // EG: "c:\pls\temp\stage"
            string uploadFile = Globals.UploadFile;     // EG: "c:\pls\temp\plsupload.zip"
            string tempFileName = $"{Path.GetFileNameWithoutExtension(polPath)}__TEMP";
            string tempPolPath = Path.Combine(Path.GetDirectoryName(polPath),$"{tempFileName}{Path.GetExtension(polPath)}");

             if (File.Exists(uploadFile))
            {
                File.Delete(uploadFile);
            }

            File.Copy(polPath, tempPolPath, true);

            int err = GetAllPolDependencies(polPath);
            if (err > 90)
            {
                ConsoleMessage errMsg = new ConsoleMessage(MessageType.Error,
                    $"Error: parsing .POL for dependencies!\r\n" +
                    "PLS Post Processor terminated!\r\n" +
                    "No DXF, PNG, or zip files created."
                );

                ConsoleMessages.Instance.AddMessage(errMsg);
                return;
            }

            //// *** Get the .lca file name used by PLS .POLE file.
            //string lcaPath = ParseLcaPath(polPath);

            //if (!File.Exists(lcaPath))
            //{
            //    ConsoleMessage errMsg = new ConsoleMessage(MessageType.Error,
            //        "LCA path does not exist!\r\n" +
            //            $@"{lcaPath}" +
            //            "\r\n\r\n" +
            //            "PLS Post Processor terminated!\r\n" +
            //            "No DXF, PNG, or zip files created."
            //        );

            //    ConsoleMessages.Instance.AddMessage(errMsg);
            //    return;
            //}

            // !!! Why is the .lca file copied to a temporary file??
            // !!! As long as the .lca file defined in the .POL file exists
            // !!! There is no need to rename the .lca file.
            //string tempLcaPath = Path.ChangeExtension(tempPolPath, "lca");
            //File.Copy(lcaPath, tempLcaPath, true);

            ConsoleUtility.WriteProgressBar("Create Command File: get DXF's from PLS", 20, update: true, wait: true);

            CreateCommandFile(tempPolPath, stagingPath);
            RunCommandFile();

            ConsoleUtility.WriteProgressBar("Generate PNG's", 40, update: true, wait: true);

            DxfImageExporter(plsDxfFrontFullPath);
            DxfImageExporter(plsDxfTopFullPath);
            DxfImageExporter(plsDxfIsoFullPath);

            File.Delete(tempPolPath);
            //File.Delete(tempLcaPath);

            // *** Delete the temporary files before zipping the workspace.
            ConsoleUtility.WriteProgressBar("Zip PLS workspace files", 60, update: true, wait: true);

            //string wrkSpaceZip = Path.Combine(stagingPath, "WorkSpace.zip");
            //string lcaFile = "test.lca"; // Path.GetFileName(lcaPath);
            //Globals.SafelyCreateZipFromDirectory(wrkSpacePath, wrkSpaceZip, polFile, lcaFile);
            //Globals.SafelyCreateZipFromStaging(stagingPath, wrkSpaceZip);

            // *** Zip the contents of the staging area into a zip'd file.
            ConsoleUtility.WriteProgressBar("Zip ALL", 80, update: true, wait: true);

            ZipFile.CreateFromDirectory(stagingPath, uploadFile);

            ConsoleUtility.WriteProgressBar("Complete", 100, update: true, wait: true);
        }

        /// <summary>
        /// Get the .POL path which is defined in the postproc.xml file.
        /// </summary>
        /// <returns>Returns the project path defined in PLS postproc.xml</returns>
        private static string ParsePolPath()
        {
            string postprocPath = Globals.PlsPostProcPath; // EG: "c:\pls\temp\postproc.xml"

            XmlDocument xdoc = new XmlDocument();
            xdoc.Load(postprocPath);

            XmlNodeList nl = xdoc.GetElementsByTagName("creator");
            string polPath = nl[0].Attributes["projectpath"].Value;

            return polPath;
        }

        /// <summary>
        /// Parse the .lca path found in the .POL file.
        /// Used to determine if the .lca file exists.
        /// </summary>
        /// <returns>Return the error status: 99 = error, 0 no errors</returns>
        private static int GetAllPolDependencies(string polPath)
        {
            if (!File.Exists(polPath))
            {
                ConsoleMessage errMsg = new ConsoleMessage(MessageType.Error,
                    $".POL has not been defined: {polPath}!\r\n" +
                    $"{polPath}\r\n\r\n" +
                    "PLS Post Processor terminated!\r\n" +
                    "No DXF, PNG, or zip files created."
                );

                ConsoleMessages.Instance.AddMessage(errMsg);
                return 99;
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
            //List<string> lcaLines = new List<string>();

            _plsPolDependecies = new List<string> { polPath };

            string inclDrives = Globals.PlsPolSearchDrives;
            string pattern = $@"^[{inclDrives}]:\\";
            Regex regex = new Regex(pattern);
            foreach (var polLine in polLines)
            {
                Match match = regex.Match(polLine);
                if (match.Success)
                {
                    _plsPolDependecies.Add(polLine.Trim());
                }
            }

            if (_plsPolDependecies.Count <= 0)
            {
                ConsoleMessage errMsg = new ConsoleMessage(MessageType.Error,
                    $"Paths to dependencies could not be found! r\n" +
                    $"{polPath}\r\n\r\n" +
                    "PLS Post Processor terminated!\r\n" +
                    "No DXF, PNG, or zip files created."
                );

                ConsoleMessages.Instance.AddMessage(errMsg);
                return 99;
            }

            // *** the .lca file must exist otherwise PLS will not run.
            var lca = _plsPolDependecies.Find(f => f.EndsWith("lca"));
            var lcaFound = !string.IsNullOrEmpty(lca);
            if (!lcaFound)
            {
                ConsoleMessage errMsg = new ConsoleMessage(MessageType.Error,
                    "LCA path could not be found!\r\n" +
                    $"{polPath}\r\n\r\n" +
                    "PLS Post Processor terminated!\r\n" +
                    "No DXF, PNG, or zip files created."
                );
                ConsoleMessages.Instance.AddMessage(errMsg);
                return 99;
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

            // *** Copy the .pol file and all dependencies
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
            return 0;
        }

        /// <summary>
        /// Parse the .lca path found in the .POL file.
        /// Used to determine if the .lca file exists.
        /// </summary>
        /// <returns></returns>
        private static string ParseLcaPath(string polPath)
        {
            if (!File.Exists(polPath))
            {
                return string.Empty;
            }

            // *** Read contents of .POL file even if it's open by another process.
            string polContent = string.Empty;
            using (var fs = new FileStream(polPath, FileMode.Open, FileAccess.Read, FileShare.ReadWrite))
            using (var sr = new StreamReader(fs, Encoding.Default))
            {
                polContent = sr.ReadToEnd();
            }

            var search = new[] {Environment.NewLine, @"\r\n"};
            string[] polLines = polContent.Split(search, StringSplitOptions.None);
            List<string> lcaLines = new List<string>();

            foreach (var polLine in polLines)
            {
                int idxSkip = polLine.IndexOf(".lca,");
                int idx = polLine.IndexOf(".lca");
                if (idx >= 0 && idxSkip < 0)
                {
                    lcaLines.Add(polLine);
                }
            }

            if (lcaLines.Count <= 0 || lcaLines.Count > 1)
            {
                ConsoleMessage errMsg = new ConsoleMessage(MessageType.Error,
                    "LCA path could not be found!\r\n" +
                    $@"{polPath}" +
                    "\r\n\r\n" +
                    "PLS Post Processor terminated!\r\n" +
                    "No DXF, PNG, or zip files created."
                );

                ConsoleMessages.Instance.AddMessage(errMsg);
                return string.Empty;
            }

            // *** The first line will be the path to the .lca file.
            return lcaLines[0];
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
                foreach(var f in Directory.GetFiles(stagingPath))
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
            string drawMode = "2";          // 0 = line, 1 = wire frame, 2 = rendered
            string displayLabels = "1";     // 1 = on, 0 = off
            //string longitude = "20";        // longitude of view in degrees
            //string latitude = "30";         // latitude of view in degrees
            string longitude = "0";        // longitude of view in degrees
            string latitude = "0";         // latitude of view in degrees

            using(StreamWriter sw = new StreamWriter(cmdFilePath, false))
            {
                sw.WriteLine(@"TYPE='PLS POSTPROC COMMAND FILE' VERSION='1' UNITS='US' SOURCE='PLS-POLE' USER='Sabre Industries, Inc.' FILENAME='c:\pls\temp\postcmd.cmd'");
                sw.WriteLine($@"49 '{tempPolPath}'");
                sw.WriteLine($@"42 '{plsDxfFullPath}' {code3D} {drawMode} {displayLabels} {longitude} {latitude}");
                //sw.WriteLine($@"42 '{plsDxfFullPath}' 1 2 1 60 30");
                //sw.WriteLine($@"42 '{stagingPath}\peIso.dxf' 1 2 0 20 30");
                sw.WriteLine($@"42 '{plsDxfTopFullPath}' 1 2 0 0 90");
                sw.WriteLine($@"42 '{plsDxfIsoFullPath}' 1 2 0 20 30");
                sw.WriteLine("3 ; exit");
            }

            string pathToPostproc = Globals.PlsPostProcPath;
            File.Copy(pathToPostproc, $@"{stagingPath}\postproc.xml", true);
            //File.Copy(@"c:\pls\temp\postproc.xml", $@"{stagingPath}\postproc.xml", true);
        }

        private static void RunCommandFile()
        {
            string pathToPls = Globals.PathToPlsExe; // @"C:\pls\pls_pole\pls_pole64.exe";

                ProcessStartInfo psi = new ProcessStartInfo();
                psi.FileName = pathToPls;
                //psi.Arguments = @"COMMAND c:\pls\temp\postcmd.cmd HIDE";
                psi.Arguments = $@"COMMAND {Globals.PathToPlsCmdFile} HIDE";

                var proc = new Process { StartInfo = psi };
                proc.Start();
                proc.WaitForExit(maxPlsWaitTimeMilli); // 10000);
        }

        /// <summary>
        /// Read the DXF drawing and export to the specified image format (default = png)
        /// </summary>
        /// <remarks>
        /// See Wout's URL: http://www.woutware.com/doc/cadlib4.0/api/WW.Cad.IO.DxfReader.html
        ///
        /// For Auto sized bitmap see URL: https://woutware.com/Forum/Topic/1962
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
            try {
                model = CadReader.Read(dxfFilePath);
            }
            catch (Exception e)
            {
                string errMsg = $"Error opening DXF during DXF image export.\r\n{dxfFilePath}";
                Logger.Error(e, errMsg);
            }

            //CleanupDxfDrawing(model);

            // *** The image output file full path with defined extension.
            string outfile = Path.ChangeExtension(dxfFilePath, sFormat);

            Stream stream;
            Size maxSize = new Size(500, 500);
            //Image<Bgra32> bitmap = ImageExporter.CreateAutoSizedBitmap<Bgra32>(
            Bitmap bitmap =
                ImageExporter.CreateAutoSizedBitmap(model, Matrix4D.Identity,
                    GraphicsConfig.AcadLikeWithWhiteBackground, maxSize);
                    //GraphicsConfig.AcadLikeWithBlackBackground, maxSize);

            switch (format) {
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
        /// Clean up the DXF model by removing Annotation layer (if present) and
        /// make the text smaller (9/8/20 -- not working yet!!)
        /// </summary>
        /// <param name="model"></param>
        private static void CleanupDxfDrawing(DxfModel model) //, string dxfFullPath)
        {
            // *** Turn off the Annotation layer if it exists.
            string annoLayer = "Annotation";
            if (model.Layers.Keys.Contains(annoLayer))
            {
                model.Layers[annoLayer].Enabled = false;
            }

            //BoundsCalculator boundsCalculator = new BoundsCalculator();

            foreach (var entity in model.Entities)
            {
                string eType = entity.EntityType;
                if (!eType.Equals("TEXT", StringComparison.OrdinalIgnoreCase))
                {
                    continue;
                }

                DxfText txtEntity = entity as DxfText;
                double txtHt = txtEntity.Height / 2.0;
                string txt = txtEntity.Text;
                var txtPt1 = txtEntity.AlignmentPoint1;
                var txtPt2 = txtEntity.AlignmentPoint2;
                var horizAlign = txtEntity.HorizontalAlignment;
                var vertAlign = txtEntity.VerticalAlignment;

                DxfText newTxt = new DxfText()
                {
                    Text = txt,
                    Height = txtHt,
                    AlignmentPoint1 = txtPt1,
                    AlignmentPoint2 = txtPt2,
                    HorizontalAlignment = horizAlign,
                    VerticalAlignment = vertAlign
                };
                model.Entities.Add(newTxt);

                // *** Make original text invisible since I can't change the size.
                txtEntity.Visible = false;
            }

            string dxfFullPath = model.Filename;
            DxfWriter.Write(dxfFullPath, model);
        }
    }
}
