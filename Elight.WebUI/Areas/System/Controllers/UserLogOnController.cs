using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System.Web.Mvc;
using Elight.WebUI.Controllers;
using Elight.Entity.Sys;
using Elight.Logic.Sys;
using Elight.Utility.Extension;

namespace Elight.WebUI.Areas.System.Controllers
{
    public class UserLogOnController : BaseController
    {
        private SysUserLogOnLogic userLogOnLogic;

        public UserLogOnController()
        {
            userLogOnLogic = new SysUserLogOnLogic();
        }

        [HttpPost, ValidateAntiForgeryToken]
        public ActionResult Form(SysUserLogOn model)
        {
            if (model.Id.IsNullOrEmpty())
            {
                int row = userLogOnLogic.Insert(model);
                return row > 0 ? Success() : Error();
            }
            else
            {
                var row = userLogOnLogic.UpdateInfo(model);
                return row > 0 ? Success() : Error();
            }
        }

    }
}
