using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace bailam1.Controllers
{
    public class AdminController : Controller
    {
        //
        // GET: /Admin/

        public ActionResult ViewPage1()
        {
            return View("~/Views/Admin/ViewPage1.aspx");
        }

    }
}
