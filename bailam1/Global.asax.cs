using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace bailam1
{
    // Note: For instructions on enabling IIS6 or IIS7 classic mode, 
    // visit http://go.microsoft.com/?LinkId=9394801

    public class MvcApplication : System.Web.HttpApplication
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            /// http://sever/SinhVien
            routes.MapRoute(
                "SinhVien Route", // Route name
                "SinhVien/{action}/{id}", // URL with parameters
                new { controller = "SinhVien", action = "Index", id = UrlParameter.Optional } // Parameter defaults
            );

            /// http://sever/Diem
            routes.MapRoute(
                "Diem Route", // Route name
                "Diem/{action}/{id}", // URL with parameters
                new { controller = "Diem", action = "DiemTheoPhongThi", id = UrlParameter.Optional } // Parameter defaults
            );

      
            ///http://sever/Lop
            routes.MapRoute(
                "Lop Route", // Route name
                "Lop/{action}/{id}", // URL with parameters
                new { controller = "Lop", action = "DanhSachLop", id = UrlParameter.Optional } // Parameter defaults
            );

            //http://sever/Account
            routes.MapRoute(
                "Admin Route", // Route name
                "Account/{action}/{id}", // URL with parameters
                new { controller = "Admin", action = "DanhSachAdmin", id = UrlParameter.Optional } // Parameter defaults
            );

            //http://sever/Level
            routes.MapRoute(
                "Level Route", // Route name
                "Level/{action}/{id}", // URL with parameters
                new { controller = "Admin", action = "CapQuyenTaiKhoan", id = UrlParameter.Optional } // Parameter defaults
            );

            /// http://sever/Login
            routes.MapRoute(
                "Default", // Route name
                "{controller}/{action}/{id}", // URL with parameters
                new { controller = "Admin", action = "Index", id = UrlParameter.Optional } // Parameter defaults
            );

        }

        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();

            RegisterRoutes(RouteTable.Routes);
        }
    }
}