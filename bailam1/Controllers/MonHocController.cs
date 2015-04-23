using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.IO;
using Webdiyer.WebControls.Mvc;
using bailam1.Function;
using bailam1.Models.FormModel;
using bailam1.Models.LinQ;

namespace bailam1.Controllers
{
    public class MonHocController : Controller
    {
        //
        // GET: /MonHoc/

        MonHocBussiness MonHocBussiness = new MonHocBussiness();

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult LoadlstDM_MonHoc(string TrangThai, int? pageIndex)
        {
            var DanhSachDM_MonHoc = new DanhSachDM_MonHoc();
            var lst = new List<DM_MonHocForm>();
            if(TrangThai=="All")
                lst = MonHocBussiness.lstDM_MonHoc_All();
            else if (TrangThai=="True")
                lst = MonHocBussiness.lstDM_MonHocTheoTrangThai("True");
            else
                lst = MonHocBussiness.lstDM_MonHocTheoTrangThai("False");
            DanhSachDM_MonHoc.PageNumber = pageIndex ?? 1;
            DanhSachDM_MonHoc.Page_lstDM_MonHoc = new PagedList<DM_MonHocForm>(lst, DanhSachDM_MonHoc.PageNumber, 10);
            return PartialView("~/Views/MonHoc/LoadlstDM_MonHoc.ascx", DanhSachDM_MonHoc);
        }

        public JsonResult OnOff(string MaMH,string TrangThai)
        {
            var Sua = MonHocBussiness.OnOff(MaMH,TrangThai);
            return Json(Sua, JsonRequestBehavior.AllowGet);
        }

        public ActionResult LoadThemMon()
        {
            return PartialView("~/Views/MonHoc/ThemMon.ascx");
        }
        public JsonResult ThemMon(DM_MonHocForm DM_MonHocForm)
        {
            var Them = MonHocBussiness.ThemMon(DM_MonHocForm);
            return Json(Them, JsonRequestBehavior.AllowGet);
        }
    }
}
