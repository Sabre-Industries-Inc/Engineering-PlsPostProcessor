using System;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;
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

        /// <summary>
        /// Retrieve the pole label from the PLS label where the label
        /// contains ':'.  The value before the ':' is the pole label.
        /// </summary>
        /// <param name="input"></param>
        /// <returns>Pole label as a string</returns>
        public static string GetPoleLabel(this string input)
        {
            string result = input;
            string pattern = @"^([^:]+)(?=:)";

            Match match = Regex.Match(input, pattern);
            if (match.Success)
            {
                result = match.Groups[1].Value;
            }

            return result;
        }

        /// <summary>
        /// Extract the numeric value from the input string when the format of 
        /// the input is for example '20.00 Embedment', where 20.00 is the 
        /// embedment depth.
        /// Otherwise, return the input value.
        /// </summary>
        /// <param name="input"></param>
        /// <returns></returns>
        public static string ExtractEmbedmentValue(this string input)
        {
            string result = input;

            string pattern = @"^(\d+\.\d+)\s+Embedment";
            Match match = Regex.Match(input, pattern);

            if (match.Success)
            {
                result = match.Groups[1].Value;
            }

            return result;
        }
    }
}