using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PLS_Post_Processor.Helpers
{
    public class ConsoleMessages
    {
        private List<ConsoleMessage> _consoleMessages = new List<ConsoleMessage>();

        private static ConsoleMessages instance = null;
        private static readonly object padlock = new object();

        #region Constructors
        ConsoleMessages()
        {
        }

        #endregion  // Constructors

        #region Properties

        public static ConsoleMessages Instance
        {
            get
            {
                lock (padlock)
                {
                    if (instance == null)
                    {
                        instance = new ConsoleMessages();
                    }
                    return instance;
                }
            }
        }


        public bool MessagesDefined
        {
            get
            {
                return _consoleMessages.Count > 0;
            }
        }

        #endregion

        #region Methods

        public void AddMessage(MessageType msgType, string message)
        {
            ConsoleMessage msg = new ConsoleMessage(msgType, message);
            _consoleMessages.Add(msg);
        }

        public void AddMessage(ConsoleMessage message)
        {
            _consoleMessages.Add(message);
        }

        /// <summary>
        /// Show all define messages on the Console.
        /// </summary>
        public void ShowAllMessages()
        {
            if (_consoleMessages.Count <= 0)
            {
                return;  // nothing to show
            }

            bool doReadKey = false;
            Console.SetCursorPosition(0, 2);

            for (int m = 0; m < _consoleMessages.Count; m++)
            {
                var message = _consoleMessages[m];

                var msgType = message.MessageType;
                if (m < _consoleMessages.Count)
                {
                    Console.ForegroundColor = ConsoleColor.Blue;
                    string sep = string.Concat(Enumerable.Repeat("~~~ ", 12));
                    Console.WriteLine($"\r\n{sep}");
                }

                Console.ForegroundColor = Globals.MsgTypeColors[message.MessageType];
                var myType = (msgType == MessageType.Error ? "E R R O R" : "");
                myType = (msgType == MessageType.Warning ? "W A R N I N G" : myType);
                var spc = string.Concat(Enumerable.Repeat("    ", 2));
                Console.WriteLine($"{spc}{myType}\r\n");

                Console.WriteLine(message.Message);
                if (message.MessageType == MessageType.Warning || message.MessageType == MessageType.Error)
                {
                    doReadKey = true;
                }
            }

            if (doReadKey)
            {
                Console.WriteLine();
                Console.WriteLine("Press space bar to terminate...");
                Console.ReadKey();
            }
        }

        #endregion  // Methods
    }
}
