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
    public class MonHocTheoChuyenNganhController : Controller
    {
        //
        // GET: /MonHocTheoChuyenNganh/
        MonHocTheoChuyenNganhBussiness MonHocTheoChuyenNganhBussiness = new MonHocTheoChuyenNganhBussiness();
        DanhMucBussiness DanhMucBussiness = new DanhMucBussiness();

        public ActionResult Index()
        {
            var a = new MonHocTheoChuyenNganhForm();
            a.listKhoa = MonHocTheoChuyenNganhBussiness.cbxKhoa();
            return View(a);
        }

        public ActionResult LoadlstMonHocTheoChuyenNganh(int? pageIndex, string MaKhoa)
        {
            var DanhSachMonHocTheoChuyenNganh = new DanhSachMonHocTheoChuyenNganh();
            var lstMonHocTheoChuyenNganh = MonHocTheoChuyenNganhBussiness.lstMonHocTheoChuyenNganh_TheoMaKhoa(MaKhoa);
            DanhSachMonHocTheoChuyenNganh.PageNumber = pageIndex ?? 1;
            DanhSachMonHocTheoChuyenNganh.Page_lstMonHocTheoChuyenNganh = new PagedList<MonHocTheoChuyenNganhForm>(lstMonHocTheoChuyenNganh, DanhSachMonHocTheoChuyenNganh.PageNumber, 10);
            return PartialView("~/Views/MonHocTheoChuyenNganh/LoadlstMonHocTheoChuyenNganh.ascx", DanhSachMonHocTheoChuyenNganh);
        }

        public ActionResult LoadThemMonChuyenNganh()
        {
            var MonHocTheoChuyenNganhForm = new MonHocTheoChuyenNganhForm();
            MonHocTheoChuyenNganhForm.listMonHoc = DanhMucBussiness.BuildMonHoc(0);
            MonHocTheoChuyenNganhForm.listKhoa = DanhMucBussiness.BuildKhoa("");
            MonHocTheoChuyenNganhForm.listChuyenNganh = DanhMucBussiness.BuildChuyenNganh("");
            MonHocTheoChuyenNganhForm.listHocKy = DanhMucBussiness.BuildHocky(0);
            MonHocTheoChuyenNganhForm.listNienKhoa = DanhMucBussiness.BuildNienKhoa("");
            return PartialView("~/Views/MonHocTheoChuyenNganh/LoadThemMonChuyenNganh.ascx", MonHocTheoChuyenNganhForm);
        }
        public ActionResult LoadcbxChuyenNganh(string MaKhoa)
        {
            var MonHocTheoChuyenNganhForm = new MonHocTheoChuyenNganhForm();
            MonHocTheoChuyenNganhForm.listChuyenNganh = DanhMucBussiness.BuildChuyenNganh(MaKhoa);
            return PartialView("~/Views/MonHocTheoChuyenNganh/LoadcbxChuyenNganh.ascx", MonHocTheoChuyenNganhForm);
        }
        public JsonResult ThemMonChuyenNganh(MonHocTheoChuyenNganhForm MonHocTheoChuyenNganhForm)
        {
            var Them = MonHocTheoChuyenNganhBussiness.ThemMonChuyenNganh(MonHocTheoChuyenNganhForm);
            return Json(Them, JsonRequestBehavior.AllowGet);
        }
    }
}
