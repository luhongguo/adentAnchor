using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Elight.WebUI.Controllers;
using Elight.WebUI.Filters;
using Elight.Logic.Sys;
using Elight.Utility.ResponseModels;
using Elight.Utility.Format;
using Elight.Utility.Extension;

namespace Elight.WebUI.Areas.System.Controllers
{
    [LoginChecked]
    public class RoleAuthorizeController : BaseController
    {
        private SysRoleAuthorizeLogic roleAuthorizeLogic;
        private SysPermissionLogic permissionLogic;

        public RoleAuthorizeController()
        {
            roleAuthorizeLogic = new SysRoleAuthorizeLogic();
            permissionLogic = new SysPermissionLogic();
        }

        [HttpGet]
        public ActionResult Index()
        {
            return View();
        }
        /// <summary>
        /// 角色授权页面
        /// </summary>
        /// <param name="roleId"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult Index(string roleId)
        {
            var listPerIds = roleAuthorizeLogic.GetList(roleId).Select(c => c.ModuleId).ToList();
            var listAllPers = permissionLogic.GetList();//获取商户权限
            List<ZTreeNode> result = new List<ZTreeNode>();
            foreach (var item in listAllPers)
            {
                ZTreeNode model = new ZTreeNode();
                model.@checked = listPerIds.Contains(item.Id) ? model.@checked = true : model.@checked = false;
                model.id = item.Id;
                model.pId = item.ParentId;
                model.name = item.Name;
                model.open = true;
                result.Add(model);
            }
            return Content(result.ToJson());
        }

        [HttpPost]
        public ActionResult Form(string roleId, string perIds)
        {
            roleAuthorizeLogic.Authorize(roleId, perIds.ToStrArray());
            return Success("授权成功");
        }

    }
}
