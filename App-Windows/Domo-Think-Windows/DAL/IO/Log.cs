using System;
using System.IO;
using System.Reflection;

/*--------------------------------------------------------
 * Log.cs
 * 
 * Version: 1.0
 * Author: Filipe
 * Created: 13/08/2016 18:18:01
 * 
 * Notes:
 * 
 * This system is from the Pandora Engine made by TimeKube.
 * http://timekube.net/
 * Please respect the credits.
 * -------------------------------------------------------*/

namespace DAL.IO
{
    internal enum LogEventType
    {
        Info,
        Done,
        Debug,
        Warning,
        Error,
    }

    public enum LogOutputType
    {
        None,
        Console,
        MessageBox,
    }

    public static class Log
    {
        #region CONSTANTS

        /// <summary>
        /// Default logs directory.
        /// </summary>
        private const String LOG_DIRECTORY = "Logs";

        /// <summary>
        /// Log type balise format.
        /// </summary>
        private const String LOG_TYPE_FORMAT = "\r[{0}] ";

        /// <summary>
        /// Log balise format for file text formating.
        /// </summary>
        private const String LOG_FILE_FORMAT = "[{0}] [{1}]: {2}";

        /// <summary>
        /// Log file name format.
        /// </summary>
        private const String LOG_FILE_NAME_FORMAT = "{0:yyyy-MM-dd}.log";

        /// <summary>
        /// Debug log message format.
        /// </summary>
        private const String DEBUG_LOG_FORMAT = "{0}.{1}() - {2}";

        /// <summary>
        /// New session started message format.
        /// </summary>
        private const String NEW_SESSION_LOG = "{0}============== NEW SESSION STARTED : {1} =============={0}";

        /// <summary>
        /// Title of the console (for console output type only).
        /// </summary>
        private const String CONSOLE_TITLE_FORMAT = "{0} {1}.{2} - Console";

        // Default values for the class.
        private const Boolean DEFAULT_ENABLE_FILE_LOG = false;

        private const LogOutputType DEFAULT_LOG_TYPE =
#if DEBUG
            LogOutputType.Console;
#else
            LogOutputType.None;
#endif

        #endregion

        #region FIELDS

        private static Boolean enableFileLog;
        private static StreamWriter logWriter;
        private static LogOutputType logOutput;
        private static AssemblyName currentAssembly;
        private static Object syncRoot = new Object();

        #endregion

        #region PROPERTIES

        /// <summary>
        /// Gets or sets the log save state in log file.
        /// </summary>
        public static Boolean EnableFileLog
        {
            get { return enableFileLog; }
            set
            {
                lock (syncRoot)
                {
                    enableFileLog = value;
                }
            }
        }

        /// <summary>
        /// Gets or sets the log output type
        /// </summary>
        public static LogOutputType LogOutput
        {
            get { return logOutput; }
            set
            {
                lock (syncRoot)
                {
                    logOutput = value;
                }
            }
        }

        #endregion

        #region CONSTRUCTORS

        /// <summary>
        /// Initialize the log instance.
        /// </summary>
        static Log()
        {
            if (Directory.Exists(LOG_DIRECTORY) == false)
                Directory.CreateDirectory(LOG_DIRECTORY);

            logOutput = DEFAULT_LOG_TYPE;
            enableFileLog = DEFAULT_ENABLE_FILE_LOG;
            logWriter = new StreamWriter(new FileStream(Path.Combine(LOG_DIRECTORY,
                String.Format(LOG_FILE_NAME_FORMAT, DateTime.Today)), FileMode.Append, FileAccess.Write));
            logWriter.AutoFlush = true;

            logWriter.WriteLine(String.Format(NEW_SESSION_LOG, Environment.NewLine, DateTime.Now));
        }

        #endregion

        #region STATICS METHODS

        /// <summary>
        /// Write an information message.
        /// </summary>
        /// <param name="format">Formated message</param>
        /// <param name="args">Arguments</param>
        public static void Info(String format, params Object[] args)
        {
            Write(LogEventType.Info, format, args);
        }

        /// <summary>
        /// Write a debug message.
        /// </summary>
        /// <param name="format">Formated message</param>
        /// <param name="args">Arguments</param>
        public static void Debug(String format, params Object[] args)
        {
#if DEBUG
            Write(LogEventType.Debug, String.Format(format, args));
#endif
        }

        /// <summary>
        /// Write a done message.
        /// </summary>
        /// <param name="format">Formated message</param>
        /// <param name="args">Arguments</param>
        public static void Done(String format, params Object[] args)
        {
            Write(LogEventType.Done, format, args);
        }

        /// <summary>
        /// Write a warning message.
        /// </summary>
        /// <param name="format">Formated message</param>
        /// <param name="args">Arguments</param>
        public static void Warning(String format, params Object[] args)
        {
            Write(LogEventType.Warning, String.Format(format, args));
        }

        /// <summary>
        /// Write an error message.
        /// </summary>
        /// <param name="format">Formated message</param>
        /// <param name="args">Arguments</param>
        public static void Error(String format, params Object[] args)
        {
            Write(LogEventType.Error, String.Format(format, args));
        }

        /// <summary>
        /// Write the log on the console.
        /// </summary>
        /// <param name="type">Log type</param>
        /// <param name="format">Formated message</param>
        /// <param name="args">Arguments</param>
        private static void Write(LogEventType type, String format, params Object[] args)
        {
            lock (syncRoot)
            {
                try
                {
                    // We format the text.
                    String _text = String.Format(format, args);

                    // Write in the log stream.
                    WriteToLogFile(type, _text);
                }
                catch (Exception e)
                {
                    //Debug.WriteLine("[{0}]: Log.Write(): {1}", LogEventType.Error, e.Message);
                }
            }
        }

        /// <summary>
        /// Write the text in the log file.
        /// </summary>
        /// <param name="type">Log type.</param>
        /// <param name="formatedText">Text message.</param>
        private static void WriteToLogFile(LogEventType type, String formatedText)
        {
            if (enableFileLog == true && logWriter != null)
            {
                logWriter.WriteLine(
                    String.Format(LOG_FILE_FORMAT, DateTime.Now.ToString(), type, formatedText));
            }
        }


        /// <summary>
        /// Dispose the log instance.
        /// </summary>
        public static void Dispose()
        {
            lock (syncRoot)
            {
                if (logWriter != null)
                {
                    logWriter.Dispose();
                    logWriter = null;
                }
            }
        }

        #endregion
    }
}
