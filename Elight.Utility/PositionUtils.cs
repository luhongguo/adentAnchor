using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Elight.Utility
{
    public class PositionUtils
    {
        private static double pi = 3.1415926535897932384626;
        private static double a = 6378245.0;
        private static double ee = 0.00669342162296594323;
        private static double bd_pi = 3.14159265358979324 * 3000.0 / 180.0;

        /** 
         * 火星坐标系 (GCJ-02) 与百度坐标系 (BD-09) 的转换算法 将 GCJ-02 坐标转换成 BD-09 坐标 
         *  
         * @param gg_lat 
         * @param gg_lon 
         */
        public static void gcj02_To_Bd09(ref double lat, ref double lon)
        {
            double x = lon, y = lat;
            double z = Math.Sqrt(x * x + y * y) + 0.00002 * Math.Sin(y * bd_pi);
            double theta = Math.Atan2(y, x) + 0.000003 * Math.Cos(x * bd_pi);
            lon = z * Math.Cos(theta) + 0.0065;
            lat = z * Math.Sin(theta) + 0.006;
        }

        /** 
        * * 火星坐标系 (GCJ-02) 与百度坐标系 (BD-09) 的转换算法 * * 将 BD-09 坐标转换成GCJ-02 坐标 * * @param 
        * bd_lat * @param bd_lon * @return 
        */
        public static void bd09_To_Gcj02(ref double lat, ref double lon)
        {
            double x = lon - 0.0065, y = lat - 0.006;
            double z = Math.Sqrt(x * x + y * y) - 0.00002 * Math.Sin(y * bd_pi);
            double theta = Math.Atan2(y, x) - 0.000003 * Math.Cos(x * bd_pi);
            lon = z * Math.Cos(theta);
            lat = z * Math.Sin(theta);
        }
    }


}
