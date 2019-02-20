using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Elight.Utility.WePay
{
    public static class WxPayHelper
    {

        /// <summary>
        /// 字符串MD5加密。
        /// </summary>
        /// <param name="strOri">需要加密的字符串</param>
        /// <returns></returns>
        private static string MD5Encrypt(this string text, Encoding encoder)
        {
            System.Security.Cryptography.MD5 md5Hasher = System.Security.Cryptography.MD5.Create();
            byte[] data = md5Hasher.ComputeHash(encoder.GetBytes(text));
            StringBuilder sBuilder = new StringBuilder();
            for (int i = 0; i < data.Length; i++)
            {
                sBuilder.Append(data[i].ToString("x2"));
            }
            return sBuilder.ToString();
        }


        public static string GetSign(Dictionary<string, string> dict, string key)
        {
            //字典排序
            string str = "";
            var dicSort = from objDic in dict orderby objDic.Key select objDic;
            foreach (KeyValuePair<string, string> kvp in dicSort)
            {
                str = str + kvp.Key + "=" + kvp.Value + "&";
            }
            str = str + "key=" + key;
            return MD5Encrypt(str, Encoding.UTF8).ToUpper();
        }

        public static string GetXml(Dictionary<string, string> dict)
        {
            //字典排序
            string str = "<xml>";
            //var dicSort = from objDic in dict orderby objDic.Value descending select objDic;
            var dicSort = from objDic in dict orderby objDic.Key select objDic;
            foreach (KeyValuePair<string, string> kvp in dicSort)
            {
                str = str + "<" + kvp.Key + ">" + kvp.Value + "</" + kvp.Key + ">";
            }
            str = str + "</xml>";
            return str;
        }


    }
}
