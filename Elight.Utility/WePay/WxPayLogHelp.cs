using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace Elight.Utility.WePay
{

    public class WxPayLogHelp
    {
        private static string logPath = string.Empty;

        /// <summary>
        /// 保存日志的文件夹
        /// </summary>
        public static string LogPath
        {
            get
            {
                if (logPath == string.Empty)
                {
                    if (System.Web.HttpContext.Current == null)
                        // Windows Forms 应用
                        logPath = AppDomain.CurrentDomain.BaseDirectory;
                    else
                        // Web 应用
                        logPath = HttpContext.Current.Request.PhysicalApplicationPath + "WxPayLogs";
                }
                return logPath;
            }
            set { logPath = value; }
        }

        private static string logFielPrefix = string.Empty;

        /// <summary>
        /// 日志文件前缀
        /// </summary>
        public static string LogFielPrefix
        {
            get { return logFielPrefix; }
            set { logFielPrefix = "WxPay"; }
        }

        /// <summary>
        /// 写日志
        /// </summary>
        public static void WriteLog(string logFile, string msg)
        {
            try
            {
                if (!Directory.Exists(LogPath))//如果日志目录不存在就创建
                {
                    Directory.CreateDirectory(LogPath);
                }
                System.IO.StreamWriter sw = System.IO.File.AppendText(
                    LogPath + "/" + LogFielPrefix + " " +
                    DateTime.Now.ToString("yyyyMMdd") + ".Log"
                    );
                sw.WriteLine(DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss( " + logFile + "):") + msg);
                sw.Close();
            }
            catch (Exception ex)
            {

            }
        }

        /// <summary>
        /// 写日志
        /// </summary>
        public static void WriteLog(LogFile logFile, string msg)
        {
            WriteLog(logFile.ToString(), msg);
        }

        public static void Error(string logFile, string msg)
        {
            WriteLog(LogFile.Error.ToString() + "  logFile", msg);
        }
    }
    /// <summary>
    /// 日志类型
    /// </summary>
    public enum LogFile
    {
        Trace,
        Warning,
        Error
    }
}
