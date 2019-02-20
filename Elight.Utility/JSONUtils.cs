using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Elight.Utility
{
    public class JSONUtils
    {
        /// <summary>
        /// 将JSON字符串反序列化成对象
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="baseEntity"></param>
        /// <param name="strJson"></param>
        /// <returns></returns>
        public static T Json2Obj<T>(T baseEntity, string strJson)
        {
            //var baseEntity = new { Ret = "", UserNo = "", UserId = "", Areacode = "", SecurityCode = "", UserName = "", AutoLogin = "0", OfficeName = "", Message = "", OffWorkCode = "" };
            return JsonConvert.DeserializeAnonymousType(strJson, baseEntity);
        }


        /// <summary>
        /// 将对象转换层JSON字符串
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="data"></param>
        /// <returns></returns>
        public static string obj2Json<T>(T data)
        {
            return JsonConvert.SerializeObject(data);
        }


        public static List<T> JsonToList<T>(string strJson)
        {
            T[] list = JsonConvert.DeserializeObject<T[]>(strJson);
            return list.ToList();
        }
    }
}
