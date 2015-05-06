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
    public class PhanPhongThiController : Controller
    {
        //
        // GET: /PhanPhongThi/
        DanhMucBussiness DanhMucBussiness = new DanhMucBussiness();
        SinhVienBussiness SinhVienBussiness = new SinhVienBussiness();
        PhanPhongThiBussiness PhanPhongThiBussiness = new PhanPhongThiBussiness();
        public ActionResult Index()
        {
            var PhanPhongThiForm = new PhanPhongThiForm();
            PhanPhongThiForm.listPhongThi = DanhMucBussiness.BuildPhongThi(0);
            PhanPhongThiForm.listKhoa = DanhMucBussiness.BuildKhoa("");
            PhanPhongThiForm.listMonChuyenNganh = DanhMucBussiness.BuildMonChuyenNganh("");
            PhanPhongThiForm.listNgayThi = PhanPhongThiBussiness.BuildNgayThi("");
            return View(PhanPhongThiForm);
        }

        public ActionResult PhanPhongThi()
        {
            var PhanPhongThiForm = new PhanPhongThiForm();
            PhanPhongThiForm.listPhongThi = DanhMucBussiness.BuildPhongThi(0);
            PhanPhongThiForm.listKhoa = DanhMucBussiness.BuildKhoa("");
            PhanPhongThiForm.listMonChuyenNganh = DanhMucBussiness.BuildMonChuyenNganh("");
            return View("~/Views/PhanPhongThi/PhanPhongThi.aspx", PhanPhongThiForm);
        }
        public ActionResult LoadcbxMonChuyenNganh(string MaKhoa)
        {
            var PhanPhongThiForm = new PhanPhongThiForm();
            PhanPhongThiForm.listMonChuyenNganh = DanhMucBussiness.BuildMonChuyenNganh(MaKhoa);

            return View("~/Views/PhanPhongThi/LoadcbxMonChuyenNganh.ascx", PhanPhongThiForm);
        }


        public ActionResult LoadlstSinhVien(int? pageIndex)
        {
            var DanhSachSinhVien = new DanhSachSinhVien();
            var lstSinhVien = SinhVienBussiness.lstSinhVienAll();
            DanhSachSinhVien.PageNumber = pageIndex ?? 1;
            DanhSachSinhVien.Page_lstSV = new PagedList<SinhVienForm>(lstSinhVien, DanhSachSinhVien.PageNumber, 10);
            return PartialView("~/Views/PhanPhongThi/LoadlstSinhVien.ascx", DanhSachSinhVien);
        }

        public ActionResult SeachTheoMaSV(int? pageIndex, string MaSV)
        {
            var DanhSachSinhVien = new DanhSachSinhVien();
            var lstSinhVien = SinhVienBussiness.lstSinhVienTheoMaSV(MaSV);
            DanhSachSinhVien.PageNumber = pageIndex ?? 1;
            DanhSachSinhVien.Page_lstSV = new PagedList<SinhVienForm>(lstSinhVien, DanhSachSinhVien.PageNumber, 10);
            return PartialView("~/Views/PhanPhongThi/LoadlstSinhVien.ascx", DanhSachSinhVien);
        }

        public ActionResult SeachTheoMaLop(int? pageIndex, string MaLop)
        {
            var DanhSachSinhVien = new DanhSachSinhVien();
            var lstSinhVien = SinhVienBussiness.lstSinhVienTheoMaLop(MaLop);
            DanhSachSinhVien.PageNumber = pageIndex ?? 1;
            DanhSachSinhVien.Page_lstSV = new PagedList<SinhVienForm>(lstSinhVien, DanhSachSinhVien.PageNumber, 10);
            return PartialView("~/Views/PhanPhongThi/LoadlstSinhVien.ascx", DanhSachSinhVien);
        }
        
        public ActionResult ThemlistSV(string Chuoi)
        {
            var listSV = new List<SinhVienForm>();
            string[] Chuois = Chuoi.Split(',');

            if (TempData["ThongTinSinhVien"] != null)
            {
                listSV = (List<SinhVienForm>)TempData["ThongTinSinhVien"];
            }

            for (int i = 0; i <= Chuois.Length; i++)
            {
                listSV[(i)].MaSinhVien = Chuois[i];
            }
            TempData["ThongTinSinhVien"] = listSV;
            
            return this.Json(listSV, JsonRequestBehavior.AllowGet);
        }


        public ActionResult LoadlstSinhVienTemp(int? pageIndex,string Chuoi)
        {
            var DanhSachSinhVien = new DanhSachSinhVien();
            var lstSinhVien = PhanPhongThiBussiness.lstSinhVienTemp(Chuoi);
            DanhSachSinhVien.PageNumber = pageIndex ?? 1;
            DanhSachSinhVien.Page_lstSV = new PagedList<SinhVienForm>(lstSinhVien, DanhSachSinhVien.PageNumber, 10);
            return PartialView("~/Views/PhanPhongThi/LoadlstSinhVienTemp.ascx", DanhSachSinhVien);
        }

        public JsonResult ThemPhongThi(string Chuoi, string PhongThi, string MaMonChuyenNganh, string NgayThi)
        {
            var Them = PhanPhongThiBussiness.ThemPhongThi(Chuoi, PhongThi, MaMonChuyenNganh, NgayThi);
            return Json(Them, JsonRequestBehavior.AllowGet);
        }
    }
}
