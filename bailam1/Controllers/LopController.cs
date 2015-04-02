using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using bailam1.Function;
using bailam1.Models.FormModel;
using bailam1.Models.LinQ;
using Webdiyer.WebControls.Mvc;

namespace bailam1.Controllers
{
    public class LopController : Controller
    {
        //
        // GET: /Lop/

        DataQLSVDataContext _QLSVData = new DataQLSVDataContext();
        KhoaBussiness _KHOA = new KhoaBussiness();
        LopBussiness _LOP = new LopBussiness();
        public ActionResult DanhSachLop(int? pageIndex)
        {
            return View("~/Views/Lop/DanhSachLop.aspx");
        }
        public ActionResult DanhSachLopAjax(int? pageIndex, string TuKhoa)
        {
            var danhsachLop = new KHOA_DMKhoaForm();
            var lstLop = _LOP.getAllLop();
            danhsachLop.PageNumber = pageIndex ?? 1;

            //danhsachLop.listKhoa = _KHOA.BuildKhoa(danhsachLop.MaKhoa);
            //danhsachLop.listNienKhoa = _KHOA.BuildNienKhoa(danhsachLop.MaNienKhoa);
            //danhsachLop.listChuyenNganh = _KHOA.BuildChuyenNganh(danhsachLop.MaChuyenNganh);

            if (string.IsNullOrEmpty(TuKhoa))
            {
                danhsachLop.PageListDanhSachLop = new PagedList<KHOA_DMKhoaForm>(lstLop.DSLOP, danhsachLop.PageNumber, 10);
            }
            else
            {
                lstLop.DSLOP = lstLop.DSLOP.Where(p=>p.MaLop.Trim().ToLower().Contains(TuKhoa.ToLower())).ToList();
                danhsachLop.PageListDanhSachLop = new PagedList<KHOA_DMKhoaForm>(lstLop.DSLOP, danhsachLop.PageNumber, 5);
            }
            return View("~/Views/Lop/DanhSachLop.ascx", danhsachLop);
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
            frmThemLop.listNienKhoa = _KHOA.BuildNienKhoa(frmThemLop.MaNienKhoa);
            frmThemLop.listChuyenNganh = _KHOA.BuildChuyenNganh(frmThemLop.MaChuyenNganh);
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
