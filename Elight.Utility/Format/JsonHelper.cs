using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Newtonsoft.Json;
using Newtonsoft.Json.Converters;
using Newtonsoft.Json.Linq;
using Newtonsoft.Json.Serialization;

namespace Elight.Utility.Format
{

    /// <summary>
    /// JSON序列化、反序列化扩展类。
    /// </summary>
    public static class JsonHelper
    {
        /// <summary>
        /// 将JSON字符串反序列化成对象
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="baseEntity"></param>
        /// <param name="strJson"></param>
        /// <returns></returns>
        public static T ToObject<T>(T baseEntity, string strJson)
        {
            return JsonConvert.DeserializeAnonymousType(strJson, baseEntity);
        }
     

        /// <summary>
        /// 将Json反序列化成对象
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="strJson"></param>
        /// <returns></returns>
        public static T ToObject<T>(this string strJson)
        {
            return JsonConvert.DeserializeObject<T>(strJson);
        }


        /// <summary>
        /// 将对象转换层JSON字符串
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="data"></param>
        /// <returns></returns>
        public static string ToJson<T>(this T data)
        {
            return JsonConvert.SerializeObject(data);
        }


        public static List<T> JsonToList<T>(this string strJson)
        {
            T[] list = JsonConvert.DeserializeObject<T[]>(strJson);
            return list.ToList();
        }
    }
}
