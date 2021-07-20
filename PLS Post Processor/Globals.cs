using System;
using System.Collections.Generic;
using System.IO;
using System.IO.Compression;
using System.Linq;
using System.Net.Http.Headers;
using System.Text;
using System.Threading.Tasks;

namespace PLS_Post_Processor
{
    public static class Globals
    {

        /// <summary>
        /// The full path to the local PLS postproc
        /// </summary>
        public const string PlsPostProcPath = @"C:\pls\temp\postproc.xml";

        /// <summary>
        /// The full path to the local staging directory where
        /// DXF's, PNG's, and postproc will be saved.
        /// </summary>
        public const string StagingPath = @"C:\pls\temp\stage";

        /// <summary>
        /// The full path where the zip'd PLS up load file is located.
        /// </summary>
        public const string UploadFile = @"C:\pls\temp\plsupload.zip";

        /// <summary>
        /// The PLS command file containing commands to create DXF' and PNG images.
        /// </summary>
        public const string CmdFilePath = @"C:\pls\temp\postcmd.cmd";

        /// <summary>
        /// The full path to the PLS executable on the local PC.
        /// </summary>
        public const string PathToPlsExe = @"C:\PLS\pls_pole\pls_pole64.exe";

        /// <summary>
        /// The full path to the PLS executable on the local PC.
        /// </summary>
        public const string PathToPlsCmdFile = @"C:\PLS\Temp\postcmd.cmd";

        /// <summary>
        /// Create a zip file for a directory even if some of the files are
        /// being used by another process.
        /// </summary>
        /// <param name="sourceDirectoryName">The source directory being zip'd</param>
        /// <param name="zipFilePath">The zip file name containing the directory contents zip'd.</param>
        /// <param name="polFile">The current .POL file. If defined, ignore all other .POL files.</param>
        /// <remarks>
        /// See URL: https://forum.rebex.net/3392/add-a-file-into-ziparchive-if-it-used-by-another-process
        /// </remarks>
        public static void SafelyCreateZipFromDirectory(string sourceDirectoryName, string zipFilePath, string polFile, string lcaFile)
        {
            using (FileStream zipToOpen = new FileStream(zipFilePath, FileMode.Create, FileAccess.Write)) //, FileShare.ReadWrite))
            using (ZipArchive archive = new ZipArchive(zipToOpen, ZipArchiveMode.Create))
            {
                foreach (var file in Directory.GetFiles(sourceDirectoryName))
                {
                    string ext = Path.GetExtension(file);

                    // *** Only save the current .POL or .lca file.  There may be multiple
                    // *** .POL or .lca files in the source directory.
                    if (IgnoreThisFile(file, polFile, ".POL"))
                    {
                        continue;
                    }

                    if (IgnoreThisFile(file, lcaFile, ".lca"))
                    {
                        continue;
                    }

                    if (ext.Equals(".bak", StringComparison.OrdinalIgnoreCase))
                    {
                        continue;
                    }

                    // *** Skip any locked files.
                    if (file.EndsWith(".lock"))
                    {
                        continue;
                    }

                    var entryName = Path.GetFileName(file);
                    var entry = archive.CreateEntry(entryName);
                    entry.LastWriteTime = File.GetLastWriteTime(file);
                    using (var fs = new FileStream(file, FileMode.Open, FileAccess.Read, FileShare.ReadWrite))
                    using (var stream = entry.Open())
                    {
                        var numBytes = fs.Length;
                        fs.CopyTo(stream);
                    }
                }
            }
        }

        /// <summary>
        /// Ignore this file from the PLS workspace
        /// </summary>
        /// <param name="currentFileName">The current file being processed</param>
        /// <param name="chkFile">The file to check against.</param>
        /// <param name="ext">The file extension being checked.</param>
        /// <returns></returns>
        private static bool IgnoreThisFile(string currentFileName, string chkFile, string ext)
        {
            // *** Only save the current .POL.  There may be multiple .POL files
            // *** in the source directory.
            string fileName = Path.GetFileName(currentFileName);
            bool isFileExt = fileName.EndsWith(ext, StringComparison.OrdinalIgnoreCase);
            if (isFileExt)
            {
                bool ignoreThisFile = !fileName.Equals(chkFile, StringComparison.OrdinalIgnoreCase);
                if (ignoreThisFile)
                {
                    return true;
                }
            }

            return false;
        }
    }
}
