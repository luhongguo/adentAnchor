using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NLog;
using NLog.Config;
using System.ComponentModel;
using Elight.Utility.Network;
using System.Reflection;
using System.IO;

namespace Elight.Utility.Log
{
    /// <summary>
    /// NLog日志框架辅助类。
    /// </summary>
    public static class LogHelper
    {
        private static Logger logger = LogManager.GetCurrentClassLogger();
        public static object logLock = new object();

        public static void WriteLog(string msg)
        {
            lock (logLock)
            {
                try
                {
                    //日期文件夹
                    string today = DateTime.Today.ToString("yyyyMMdd");
                    string filePath = "d:/QD/";
                    //日志目录
                    filePath = filePath + today + "/";
                    if (!Directory.Exists(filePath))
                    {
                        Directory.CreateDirectory(filePath);
                    }
                    StreamWriter stream = new StreamWriter(filePath + "log.txt", true, Encoding.UTF8);
                    stream.Write(DateTime.Now.ToString() + ":" + msg);
                    stream.Write("\r\n");
                    stream.Flush();
                    stream.Close();
                }
                catch
                {

                }

            }
        }


        /// <summary>
        /// 注册日志配置文件。
        /// </summary>
        public static void RegisterConfig()
        {
            string configPath = AppDomain.CurrentDomain.BaseDirectory + @"\Configs\NLog.config";
            LogManager.Configuration = new XmlLoggingConfiguration(configPath);
        }


        public static string GetEnumDescription(Enum enumValue)
        {
            string value = enumValue.ToString();
            FieldInfo field = enumValue.GetType().GetField(value);
            object[] objs = field.GetCustomAttributes(typeof(DescriptionAttribute), false);    //获取描述属性
            if (objs == null || objs.Length == 0)    //当描述属性没有时，直接返回名称
                return value;
            DescriptionAttribute descriptionAttribute = (DescriptionAttribute)objs[0];
            return descriptionAttribute.Description;
        }
        /// <summary>
        /// 记录日志。
        /// </summary>
        /// <param name="level">日志级别</param>
        /// <param name="operation">动作</param>
        /// <param name="message">消息</param>
        /// <param name="account">操作者</param>
        /// <param name="realName">真实姓名</param>
        public static void Write(Level level, string operation, string message, string account, string realName)
        {
            LogEventInfo logEvent = new LogEventInfo();
            logEvent.Message = message;
            switch (level)
            {
                case Level.Trace:
                    logEvent.Level = LogLevel.Trace;
                    break;
                case Level.Debug:
                    logEvent.Level = LogLevel.Debug;
                    break;
                case Level.Info:
                    logEvent.Level = LogLevel.Info;
                    break;
                case Level.Warn:
                    logEvent.Level = LogLevel.Warn;
                    break;
                case Level.Error:
                    logEvent.Level = LogLevel.Error;
                    break;
                case Level.Fatal:
                    logEvent.Level = LogLevel.Fatal;
                    break;
            }
            logEvent.Properties["Id"] = Guid.NewGuid().ToString().Replace("-", "");
            logEvent.Properties["Account"] = account;
            logEvent.Properties["RealName"] = realName;
            logEvent.Properties["Operation"] = operation;
            logEvent.Properties["IP"] = Net.Ip;
            logEvent.Properties["IPAddress"] = Net.GetAddress(Net.Ip);
            logEvent.Properties["Browser"] = Net.Browser;
            logger.Log(logEvent);
        }

        /// <summary>
        /// 最常见的记录信息，一般用于普通输出。
        /// </summary>
        /// <param name="message"></param>
        public static void Trace(string message)
        {
            logger.Trace(message);
        }

        /// <summary>
        /// 同样是记录信息，不过出现的频率要比Trace少一些，一般用来调试程序。
        /// </summary>
        /// <param name="message"></param>
        public static void Debug(string message)
        {
            logger.Debug(message);
        }

        /// <summary>
        /// 信息类型的消息。
        /// </summary>
        /// <param name="message"></param>
        public static void Info(string message)
        {
            logger.Info(message);
        }

        /// <summary>
        /// 警告信息，一般用于比较重要的场合。
        /// </summary>
        /// <param name="message"></param>
        public static void Warn(string message)
        {
            logger.Warn(message);
        }

        /// <summary>
        /// 错误信息。
        /// </summary>
        /// <param name="message"></param>
        public static void Error(string message)
        {
            logger.Error(message);
        }

        /// <summary>
        /// 致命异常信息。一般来讲，发生致命异常之后程序将无法继续执行。
        /// </summary>
        /// <param name="message"></param>
        public static void Fatal(string message)
        {
            logger.Fatal(message);
        }
    }

    public enum Level
    {
        [Description("普通输出")]
        Trace,
        [Description("一般调试")]
        Debug,
        [Description("普通消息")]
        Info,
        [Description("警告信息")]
        Warn,
        [Description("一般错误")]
        Error,
        [Description("致命错误")]
        Fatal
    }

}
