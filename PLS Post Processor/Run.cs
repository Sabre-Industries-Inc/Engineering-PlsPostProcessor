using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;
using System.Xml;
using System.Diagnostics;
using System.IO.Compression;

namespace PLS_Post_Processor
{
    public class Run
    {
        public static void RunApp()
        {
            string polPath = ParsePolPath();
            string stagingPath = @"c:\pls\temp\stage";
            string uploadFile = @"c:\pls\temp\upload.zip";
            string tempFileName = $"{Path.GetFileNameWithoutExtension(polPath)}__TEMP";
            string tempPolPath = Path.Combine(Path.GetDirectoryName(polPath),$"{tempFileName}{Path.GetExtension(polPath)}");

            if (File.Exists(uploadFile))
            {
                File.Delete(uploadFile);
            }

            File.Copy(polPath, tempPolPath, true);
            CreateCommandFile(tempPolPath, stagingPath);
            RunCommandFile();
            File.Delete(tempPolPath);
            ZipFile.CreateFromDirectory(stagingPath, uploadFile);
        }

        private static string ParsePolPath()
        {
            string postprocPath = @"c:\pls\temp\postproc.xml";
            
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
            
            string cmdFilePath = @"c:\pls\temp\postcmd.cmd";

            using(StreamWriter sw = new StreamWriter(cmdFilePath, false))
            {
                sw.WriteLine(@"TYPE='PLS POSTPROC COMMAND FILE' VERSION='1' UNITS='US' SOURCE='PLS-POLE' USER='Sabre Industries, Inc.' FILENAME='c:\pls\temp\postcmd.cmd'");
                sw.WriteLine($@"49 '{tempPolPath}'");
                sw.WriteLine($@"42 '{stagingPath}\pe.dxf' 1 2 2 60 30");
                sw.WriteLine("3 ; exit");
            }

            File.Copy(@"c:\pls\temp\postproc.xml", $@"{stagingPath}\postproc.xml", true);
        }

        private static void RunCommandFile()
        {
                string pathToPls = @"C:\pls\pls_pole\pls_pole64.exe";

                ProcessStartInfo psi = new ProcessStartInfo();
                psi.FileName = pathToPls;
                psi.Arguments = @"COMMAND c:\pls\temp\postcmd.cmd HIDE";

                var proc = new Process { StartInfo = psi };
                proc.Start();
                proc.WaitForExit(10000);
        }
    }
}
