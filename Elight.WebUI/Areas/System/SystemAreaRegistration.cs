using System.Web.Mvc;

namespace Elight.WebUI.Areas.System
{
    public class SystemAreaRegistration : AreaRegistration 
    {
        public override string AreaName 
        {
            get 
            {
                return "System";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context) 
        {
            context.MapRoute(
                "System_default",
                "System/{controller}/{action}/{id}",
                new { action = "Index", id = UrlParameter.Optional },
                namespaces: new[] { "Elight.WebUI.Areas.System.Controllers" } //指定该路由查找控制器类的命名空间
            );
        }
    }
}