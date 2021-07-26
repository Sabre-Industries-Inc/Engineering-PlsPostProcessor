using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PLS_Post_Processor.Helpers
{
    /// <summary>
    /// Message type used to determine Std, warning, or error message.
    /// </summary>
    public enum MessageType
    {
        Unknown,
        Standard,
        Warning,
        Error
    }


    public class ConsoleMessage
    {

        #region Constructors

        public ConsoleMessage()
        {
            MessageType = MessageType.Standard;
        }

        public ConsoleMessage(MessageType messageType, string message)
        {
            MessageType = messageType;
            Message = message;
        }

        #endregion   // Constructors

        #region Properties

        public MessageType MessageType { get; set; }

        public string Message { get; set; }

        #endregion
    }
}
