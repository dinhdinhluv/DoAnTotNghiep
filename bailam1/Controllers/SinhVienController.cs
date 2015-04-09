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
        SinhVienFunction SinhVienFunction = new SinhVienFunction();
        DanhMucFunction DanhMucFunction = new DanhMucFunction();
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult LoadlstSinhVien(int? pageIndex)
        {
            var DanhSachSinhVien = new DanhSachSinhVien();
            var lstSinhVien = SinhVienFunction.lstSinhVienAll();
            DanhSachSinhVien.PageNumber = pageIndex ?? 1;
            DanhSachSinhVien.Page_lstSV = new PagedList<SinhVienForm>(lstSinhVien, DanhSachSinhVien.PageNumber,10);
            return PartialView("~/Views/SinhVien/LoadlstSinhVien.ascx", DanhSachSinhVien);
        }

        public ActionResult SeachTheoMaSV(int? pageIndex, string MaSV)
        {
            var DanhSachSinhVien = new DanhSachSinhVien();
            var lstSinhVien = SinhVienFunction.lstSinhVienTheoMaSV(MaSV);
            DanhSachSinhVien.PageNumber = pageIndex ?? 1;
            DanhSachSinhVien.Page_lstSV = new PagedList<SinhVienForm>(lstSinhVien, DanhSachSinhVien.PageNumber, 5);
            return PartialView("~/Views/SinhVien/LoadlstSinhVien.ascx", DanhSachSinhVien);
        }

        public ActionResult SeachTheoMaLop(int? pageIndex, string MaLop)
        {
            var DanhSachSinhVien = new DanhSachSinhVien();
            var lstSinhVien = SinhVienFunction.lstSinhVienTheoMaLop(MaLop);
            DanhSachSinhVien.PageNumber = pageIndex ?? 1;
            DanhSachSinhVien.Page_lstSV = new PagedList<SinhVienForm>(lstSinhVien, DanhSachSinhVien.PageNumber,5);
            return PartialView("~/Views/SinhVien/LoadlstSinhVien.ascx", DanhSachSinhVien);
        }

        public ActionResult LoadSuaSinhVien(string MaSV)
        {
            var SV = SinhVienFunction.SinhVienTheoMaSV(MaSV);
            SV.listGioiTinh = DanhMucFunction.BuildGioiTinh(SV.GioiTinh);
            SV.listQueQuan = DanhMucFunction.BuildQueQuan(Convert.ToInt32(SV.QueQuan));
            SV.listDanToc = DanhMucFunction.BuildDanToc(Convert.ToInt32(SV.DanToc));
            SV.listTonGiao = DanhMucFunction.BuildTonGiao(Convert.ToInt32(SV.TonGiao));
            SV.listKhoa = DanhMucFunction.BuildKhoa(SV.Khoa);
            SV.listNienKhoa = DanhMucFunction.BuildNienKhoa(SV.NienKhoa);
            SV.listLop = DanhMucFunction.BuildLop(SV.Khoa,SV.NienKhoa,SV.Lop);

            return View("~/Views/SinhVien/LoadSuaSinhVienUc.ascx",SV);
        }
        //public ActionResult ThucHienThemSV()
        //{
        //    return View("~/Views/SinhVien/LoadThemSinhVien.aspx");
        //}
        public ActionResult LoadThemSinhVien()
        {
            var SV = new SinhVienForm();
            SV.listGioiTinh = DanhMucFunction.BuildGioiTinh("");
            SV.listQueQuan = DanhMucFunction.BuildQueQuan(0);
            SV.listDanToc = DanhMucFunction.BuildDanToc(0);
            SV.listTonGiao = DanhMucFunction.BuildTonGiao(0);
            SV.listKhoa = DanhMucFunction.BuildKhoa("");
            SV.listNienKhoa = DanhMucFunction.BuildNienKhoa("");
            SV.listLop = DanhMucFunction.BuildLop("","", "");

            return View("~/Views/SinhVien/LoadThemSinhVienUc.ascx",SV);
        }
        public ActionResult loadcbxLop(string Khoa,string NienKhoa)
        {
            SinhVienForm SinhVienForm = new SinhVienForm();
            SinhVienForm.listLop = DanhMucFunction.BuildLop(Khoa, NienKhoa, "");
            return PartialView("~/Views/SinhVien/loadcbxLop.ascx", SinhVienForm);
        }


        public JsonResult ThucHienThemSV(SinhVienForm SinhVienForm, HttpPostedFileBase HinhSV)
        {
            var Them = SinhVienFunction.ThucHienThemSV(SinhVienForm, HinhSV);
            return Json(Them, JsonRequestBehavior.AllowGet);
        }

        public JsonResult ThucHienSuaSV(SinhVienForm SinhVienForm, HttpPostedFileBase HinhSV)
        {
            var Sua = SinhVienFunction.ThucHienSuaSV(SinhVienForm,HinhSV);
            return Json(Sua, JsonRequestBehavior.AllowGet);
        }
    }
}
