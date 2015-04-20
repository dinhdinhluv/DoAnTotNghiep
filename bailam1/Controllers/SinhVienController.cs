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
    public class SinhVienController : Controller
    {
        SinhVienBussiness SinhVienBussiness = new SinhVienBussiness();
        DanhMucBussiness DanhMucBussiness = new DanhMucBussiness();
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult LoadlstSinhVien(int? pageIndex)
        {
            var DanhSachSinhVien = new DanhSachSinhVien();
            var lstSinhVien = SinhVienBussiness.lstSinhVienAll();
            DanhSachSinhVien.PageNumber = pageIndex ?? 1;
            DanhSachSinhVien.Page_lstSV = new PagedList<SinhVienForm>(lstSinhVien, DanhSachSinhVien.PageNumber,10);
            return PartialView("~/Views/SinhVien/LoadlstSinhVien.ascx", DanhSachSinhVien);
        }

        public ActionResult SeachTheoMaSV(int? pageIndex, string MaSV)
        {
            var DanhSachSinhVien = new DanhSachSinhVien();
            var lstSinhVien = SinhVienBussiness.lstSinhVienTheoMaSV(MaSV);
            DanhSachSinhVien.PageNumber = pageIndex ?? 1;
            DanhSachSinhVien.Page_lstSV = new PagedList<SinhVienForm>(lstSinhVien, DanhSachSinhVien.PageNumber, 5);
            return PartialView("~/Views/SinhVien/LoadlstSinhVien.ascx", DanhSachSinhVien);
        }

        public ActionResult SeachTheoMaLop(int? pageIndex, string MaLop)
        {
            var DanhSachSinhVien = new DanhSachSinhVien();
            var lstSinhVien = SinhVienBussiness.lstSinhVienTheoMaLop(MaLop);
            DanhSachSinhVien.PageNumber = pageIndex ?? 1;
            DanhSachSinhVien.Page_lstSV = new PagedList<SinhVienForm>(lstSinhVien, DanhSachSinhVien.PageNumber,5);
            return PartialView("~/Views/SinhVien/LoadlstSinhVien.ascx", DanhSachSinhVien);
        }

        public ActionResult LoadSuaSinhVien(string MaSV)
        {
            var SV = SinhVienBussiness.SinhVienTheoMaSV(MaSV);
            SV.listGioiTinh = DanhMucBussiness.BuildGioiTinh(SV.GioiTinh);
            SV.listQueQuan = DanhMucBussiness.BuildQueQuan(Convert.ToInt32(SV.QueQuan));
            SV.listDanToc = DanhMucBussiness.BuildDanToc(Convert.ToInt32(SV.DanToc));
            SV.listTonGiao = DanhMucBussiness.BuildTonGiao(Convert.ToInt32(SV.TonGiao));
            SV.listKhoa = DanhMucBussiness.BuildKhoa(SV.Khoa);
            SV.listNienKhoa = DanhMucBussiness.BuildNienKhoa(SV.NienKhoa);
            SV.listLop = DanhMucBussiness.BuildLop(SV.Khoa,SV.NienKhoa,SV.Lop);

            return View("~/Views/SinhVien/LoadSuaSinhVienUc.ascx",SV);
        }
        //public ActionResult ThucHienThemSV()
        //{
        //    return View("~/Views/SinhVien/LoadThemSinhVien.aspx");
        //}
        public ActionResult LoadThemSinhVien()
        {
            var SV = new SinhVienForm();
            SV.listGioiTinh = DanhMucBussiness.BuildGioiTinh("");
            SV.listQueQuan = DanhMucBussiness.BuildQueQuan(0);
            SV.listDanToc = DanhMucBussiness.BuildDanToc(0);
            SV.listTonGiao = DanhMucBussiness.BuildTonGiao(0);
            SV.listKhoa = DanhMucBussiness.BuildKhoa("");
            SV.listNienKhoa = DanhMucBussiness.BuildNienKhoa("");
            SV.listLop = DanhMucBussiness.BuildLop("","", "");

            return View("~/Views/SinhVien/LoadThemSinhVienUc.ascx",SV);
        }
        public ActionResult loadcbxLop(string Khoa,string NienKhoa)
        {
            SinhVienForm SinhVienForm = new SinhVienForm();
            SinhVienForm.listLop = DanhMucBussiness.BuildLop(Khoa, NienKhoa, "");
            return PartialView("~/Views/SinhVien/loadcbxLop.ascx", SinhVienForm);
        }
        
        [HttpPost]
        public JsonResult ThucHienThemSV(SinhVienForm SinhVienForm, HttpPostedFileBase HinhSV)
        {
            var Them = SinhVienBussiness.ThucHienThemSV(SinhVienForm, HinhSV);
            return Json(Them, JsonRequestBehavior.AllowGet);
        }

        public JsonResult ThucHienSuaSV(SinhVienForm SinhVienForm, HttpPostedFileBase HinhSV)
        {
            var Sua = SinhVienBussiness.ThucHienSuaSV(SinhVienForm,HinhSV);
            return Json(Sua, JsonRequestBehavior.AllowGet);
        }
    }
}
