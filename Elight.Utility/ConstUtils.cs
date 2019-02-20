using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Elight.Utility
{
    /// <summary>
    /// 全局配置文件
    /// </summary>
    public class ConstUtils
    {
        public static readonly string SoftwareName = ConfigurationManager.AppSettings["SoftwareName"];
            
    }
}
