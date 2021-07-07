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

        public static void RunApp()
        {
            string polPath = ParsePolPath();
            string stagingPath = Globals.StagingPath; // @"c:\pls\temp\stage";
            string uploadFile = Globals.UploadFile; // @"c:\pls\temp\plsupload.zip";
            string tempFileName = $"{Path.GetFileNameWithoutExtension(polPath)}__TEMP";
            string tempPolPath = Path.Combine(Path.GetDirectoryName(polPath),$"{tempFileName}{Path.GetExtension(polPath)}");

            if (File.Exists(uploadFile))
            {
                File.Delete(uploadFile);
            }

            File.Copy(polPath, tempPolPath, true);

            string lcaPath = Path.ChangeExtension(polPath, "lca");
            string tempLcaPath = Path.ChangeExtension(tempPolPath, "lca");
            if (!File.Exists(lcaPath))
            {
                Console.WriteLine("LCA path does not exist!");
                Console.WriteLine($@"{lcaPath}");
                Console.WriteLine("");
                Console.WriteLine("PLS Post Processor terminated! No DXF or PNG files created.");
                Console.WriteLine("Press any key to exit...");
                Console.ReadKey();
                return;
            }

            File.Copy(lcaPath, tempLcaPath, true);

            CreateCommandFile(tempPolPath, stagingPath);
            RunCommandFile();

            DxfImageExporter(plsDxfFrontFullPath);
            DxfImageExporter(plsDxfTopFullPath);
            DxfImageExporter(plsDxfIsoFullPath);

            File.Delete(tempPolPath);
            File.Delete(tempLcaPath);
            ZipFile.CreateFromDirectory(stagingPath, uploadFile);
        }

        private static string ParsePolPath()
        {
            string postprocPath = Globals.PlsPostProcPath; // @"c:\pls\temp\postproc.xml";

            XmlDocument xdoc = new XmlDocument();
            xdoc.Load(postprocPath);

            XmlNodeList nl = xdoc.GetElementsByTagName("creator");
            string polPath = nl[0].Attributes["projectpath"].Value;

            return polPath;
        }

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
            string drawMode = "2";          // 0 = line, 1 = wireframe, 2 = rendered
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
