using System;
using System.IO;
using System.Linq;
using WW.Math;

namespace PLS_Post_Processor.Helpers
{
    public static class MyExtensions
    {

        /// <summary>
        /// Check to make sure Q: exists, if not use the Qdrive URL
        /// </summary>
        /// <param name="qPath">Path to check for Q: drive.</param>
        /// <returns>Returns the path using the Q drive URL instead of Q:</returns>
        public static string CheckForQdrive(this string qPath)
        {
            if (!qPath.StartsWith("Q:", StringComparison.CurrentCultureIgnoreCase))
            {
                return qPath;
            }

            string qDrive = @"Q:\";
            var drives = DriveInfo.GetDrives();
            bool qDriveExists = drives.Any(d => d.Name.Equals(qDrive, StringComparison.CurrentCultureIgnoreCase));

            if (!qDriveExists)
            {
                qPath = qPath.Replace(qDrive, Globals.QdriveUrl + @"\");
            }

            return qPath;
        }
    }
}