using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Elight.Utility.Model
{
    public enum ApiEnum
    {
        //
        // 摘要:
        //     请求(或处理)成功
        Status = 200,
        //
        // 摘要:
        //     请求参数不完整或不正确
        ParameterError = 400,
        //
        // 摘要:
        //     未授权标识
        Unauthorized = 401,
        //
        // 摘要:
        //     请求TOKEN失效
        TokenInvalid = 403,
        //
        // 摘要:
        //     HTTP请求类型不合法
        HttpMehtodError = 405,
        //
        // 摘要:
        //     HTTP请求不合法,请求参数可能被篡改
        HttpRequestError = 406,
        //
        // 摘要:
        //     该URL已经失效
        URLExpireError = 407,
        //
        // 摘要:
        //     内部请求出错
        Error = 500
    }
}
