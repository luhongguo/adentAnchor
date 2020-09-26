using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Elight.WebUI.Controllers;
using Elight.WebUI.Filters;
using Elight.Logic.Sys;
using Elight.Entity.Sys;
using Elight.Utility.ResponseModels;
using Elight.Utility.Extension;
using Elight.Utility.Format;
using Elight.Utility.Model;

namespace Elight.WebUI.Areas.System.Controllers
{
    [LoginChecked]
    public class AnchorController : BaseController
    {
        private SysAnchorLogic sysAnchorLogic;
       

        public AnchorController()
        {
            sysAnchorLogic = new SysAnchorLogic();
        }

        // GET: System/Anchor
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult IndexS()
        {
            return View();
        }
        [HttpPost, AuthorizeChecked]
        public ActionResult Index(PageParm parm)
        {
            int totalCount = 0;
            var pageData = sysAnchorLogic.GetList(parm,ref totalCount);
            var result = new
            {
                code = 0,
                msg = "success",
                data = pageData,
                count = totalCount// pageData.Count
            };
            return Content(result.ToJson());
        }
    }
}