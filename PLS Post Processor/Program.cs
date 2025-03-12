using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using PLS_Post_Processor.Helpers;

namespace PLS_Post_Processor
{
    class Program
    {
        static void Main(string[] args)
        {
            //TestConsoleUtility();

            string arg0 = args[0];
            bool upgradeTest = (arg0.Equals("~upgradeTest~", StringComparison.OrdinalIgnoreCase));
            //Console.WriteLine($"There are {args.Count()}");

            Run.RunApp(upgradeTest);

            ConsoleMessages.Instance.ShowAllMessages();
        }

        static void TestConsoleUtility()
        {
            ConsoleUtility.WriteProgressBar(0);
            for (var i = 0; i <= 100; ++i)
            {
                ConsoleUtility.WriteProgressBar($"Msg #{i}", i, true);
                Thread.Sleep(50);
            }
            Console.WriteLine();
            ConsoleUtility.WriteProgress(0);
            for (var i = 0; i <= 100; ++i)
            {
                ConsoleUtility.WriteProgress(i, true);
                Thread.Sleep(50);
            }

            Console.WriteLine();
            ConsoleUtility.WriteProgress(0);
            Console.WriteLine("ERROR:  this is an error message!!!");

            Console.ReadKey();
        }
    }
}
