using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DOANDEMO.Function;
using DOANDEMO.Models.FormModel;
using DOANDEMO.Models.LinQ;
using Webdiyer.WebControls.Mvc;

namespace DOANDEMO.Controllers
{
    public class LopController : Controller
    {
        //
        // GET: /Lop/
        DataQLSVDataContext _QLSVData = new DataQLSVDataContext();
        KhoaBussiness _KHOA = new KhoaBussiness();
        LopBussiness _LOP = new LopBussiness();
        public ActionResult Index(int? pageIndex)
        {
            var ws = new vn.dongnai.hotich.LienThongMotCuaWS();
            var json = Json(new
            {
                MaDonVi = 750, MaLoaiHoSo = "01.DangKyKhaiSinhTrongNuoc", MaHoSo = 750, NgayNhanHoSo = "03-06-1990",
                ChuHoSo = "Quang Tri",
                ChuHoSo_DienThoai = "123456",
                ChuHoSo_DiDong = "654321",
                ChuHoSo_Email="new@gmail.com",
                ChuHoSo_DiaChi = "Hoa An",
                NguoiNopHoSo = "Tran Vinh",
                NguoiNopHoSo_DienThoai = "789456",
                NguoiNopHoSo_DiaChi="Tan Hiep",
                NguoiNopHoSo_SoGiayChungThucCaNhan="453",
                NguoiNopHoSo_QuanHe = "Ban",
                NguoiNopHoSo_DanToc="Kinh",
                NguoiNopHoSo_QuocTich="VietNam",
                CanBoNhanHoSo="Phuoc",
                CanBoNhanHoSo_TenDangNhap = "nthphuoc"

            });
            var result1 = ws.SendHoSoMotCua(json.ToString(), "lt.tohotro", "abc123@");
            var result2 = ws.SendHoSoMotCua("{MaDonVi:750,MaLoaiHoSo:01.DangKyKhaiSinhTrongNuoc," +
                              "MaHoSo:750,NgayNhanHoSo:03-06-1990,ChuHoSo:Quang Tri," +
                              "ChuHoSo_DienThoai:123456,ChuHoSo_DiDong:654321," +
                              "ChuHoSo_Email:new@gmail.com,ChuHoSo_DiaChi:Hoa An," +
                              "NguoiNopHoSo:Tran Vinh,NguoiNopHoSo_DienThoai:789," +
                              "NguoiNopHoSo_DiaChi:Tan Hiep," +
                              "NguoiNopHoSo_SoGiayChungThucCaNhan:271,NguoiNopHoSo_QuanHe:Ban," +
                              "NguoiNopHoSo_DanToc:Kinh,NguoiNopHoSo_QuocTich:Viet Nam," +
                              "CanBoNhanHoSo:Phuoc,CanBoNhanHoSo_TenDangNhap:nthphuoc}", "lt.tohotro", "abc123@");

            var lstLop = _LOP.getAllLop();
            
            KHOA_DMKhoaForm frmKhoa = new KHOA_DMKhoaForm();
            frmKhoa.PageNumber = pageIndex ?? 1;
            frmKhoa.PageListDanhSachLop = new PagedList<KHOA_DMKhoaForm>(lstLop.DSLOP, frmKhoa.PageNumber, 10);
            return View("~/Views/Lop/Index.aspx", frmKhoa);
        }
        public ActionResult loadchuyennganh(string makhoa)
        {
            KHOA_DMKhoaForm frmKhoa = new KHOA_DMKhoaForm();
            frmKhoa.listChuyenNganh = _KHOA.BuildChuyenNganh(makhoa);
            return PartialView("~/Views/Lop/loadchuyennganh.ascx", frmKhoa);
        }


        /*----------------THÊM LỚP-----------------------*/
        public ActionResult Themlop()
        {
            var frmThemLop = new KHOA_DMKhoaForm();
            frmThemLop.listKhoa = _KHOA.BuildKhoa(frmThemLop.MaKhoa);
            frmThemLop.listChuyenNganh = _KHOA.BuildChuyenNganh(frmThemLop.MaChuyenNganh);
            frmThemLop.listNienKhoa = _KHOA.BuildNienKhoa(frmThemLop.MaNienKhoa);
            return View(frmThemLop);
        }

        [HttpPost]
        public ActionResult ThemLop(KHOA_DMKhoaForm lop)
        {
            _LOP.ThemLop(lop);
            return RedirectToAction("Index");
        }

        /*--------------------SỬA LỚP------------------*/
        public ActionResult SuaLop(int id)
        {
            var res = _LOP.GetLopTheoID(id);
            res.listKhoa = _KHOA.BuildKhoa(res.MaKhoa);
            
            res.listChuyenNganh = _KHOA.BuildChuyenNganh(res.MaChuyenNganh);
            res.listNienKhoa = _KHOA.BuildNienKhoa(res.MaNienKhoa);
            return View("~/Views/Lop/SuaLop.aspx", res);


        }

        [HttpPost]
        public ActionResult SuaLop(int id, KHOA_DMKhoaForm sv)
        {
            _LOP.SuaLop(sv);
            return RedirectToAction("Index");
        }
        /*--------------------XÓA LỚP------------------*/
        [HttpGet]
        public ActionResult XoaLop(int id)
        {
            _LOP.XoaLop(id);
            return RedirectToAction("Index");
        }
    }
}
