using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Elight.Utility.Model
{
    //
    // 摘要:
    //     结果
    //
    // 类型参数:
    //   T:
    public class ApiResult<T> where T : class
    {
        public ApiResult()
        {
            Msg = "";
            Status = (int)ApiEnum.Status;
            Data = null;
        }
        public ApiResult(int status, string msg = "", T data = null)
        {
            Msg = "";
            Status = status;
            Data = data;
        }

        [JsonProperty("msg")]
        public string Msg { get; set; }
        [JsonProperty("status")]
        public int Status { get; set; }
        [JsonProperty("data")]
        public T Data { get; set; }

        public static ApiResult<T> Error(string msg = "", ApiEnum status = ApiEnum.Error)
        {
            return new ApiResult<T>() { Msg = msg, Status = (int)status };
        }
        public static ApiResult<T> Success(T data = null, string msg = "")
        {
            return new ApiResult<T>() { Msg = msg, Status = (int)ApiEnum.Status, Data = data };
        }
    }
}
