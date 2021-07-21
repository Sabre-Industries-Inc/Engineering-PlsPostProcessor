using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace PLS_Post_Processor.Helpers
{
    /// <summary>
    /// Console utility tools
    /// </summary>
    /// <remarks>
    /// See URL: https://www.codeproject.com/Tips/5255878/A-Console-Progress-Bar-in-Csharp
    ///
    /// Here is another possible console progress bar
    /// see URL: https://dev.to/brandonmweaver/console-application-progress-bar-3hhi
    /// </remarks>
    public static class ConsoleUtility
    {
        const char _block = '■';
        const string _back = "\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b";
        //const string _back = "\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b";
        const string _twirl = "-\\|/";

        private static List<ConsoleColor> _variousColors = new List<ConsoleColor>
        {
            ConsoleColor.Cyan,
            ConsoleColor.Green,
            ConsoleColor.Magenta,
            ConsoleColor.Red,
            ConsoleColor.Blue,
            ConsoleColor.White,
            ConsoleColor.Yellow
        };

        public static void WriteProgressBar(int percent, bool update = false)
        {
            Console.Clear();

            if(update)
                Console.Write(_back);

            Console.ForegroundColor = ConsoleColor.Yellow;

            Console.Write("[");
            var p = (int)((percent / 10f)+.5f);
            for (var i = 0; i < 30; ++i)
            {
                if (i >= p)
                    Console.Write(' ');
                else
                    Console.Write(_block);
            }

            Console.Write("] {0,3:##0}%", percent);
        }

        public static void WriteProgressBar(string msg, int percent, bool update = false, bool wait = false)
        {
            int L = _back.Length;

            Console.Clear();

            //if(update)
            //    Console.Write(_back);

            if (update)
            {
                //Console.Write(_back);
                Console.SetCursorPosition(0, 0); // - 2);
            }

            Random rand = new Random(percent);
            int j = _variousColors.Count - 1;
            int k = rand.Next(0, j);

            Console.ForegroundColor = _variousColors[k]; // ConsoleColor.Yellow;

            Console.Write("[");
            //var p = (int)((percent / 10f)+.5f);
            var per = (percent / 100f) * L;
            var p = (int) per;

            for (var i = 0; i < L; ++i)
            {
                if (i >= p)
                    Console.Write(' ');
                else
                    Console.Write(_block);
            }

            Console.Write($"] {percent,3:##0}% ==> {msg}");
            if (wait)
            {
                Thread.Sleep(50);
            }
        }

        public static void WriteProgress(int progress, bool update = false)
        {
            if (update)
                Console.Write("\b");
            Console.Write(_twirl[progress % _twirl.Length]);
        }
    }
}
