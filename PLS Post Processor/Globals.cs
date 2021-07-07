using System;
using System.Collections.Generic;
using System.Linq;
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

    }
}
