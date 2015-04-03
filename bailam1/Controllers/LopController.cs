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

            danhsachLop.listKhoa = _KHOA.BuildKhoa(danhsachLop.MaKhoa);
            danhsachLop.listChuyenNganh = _KHOA.BuildChuyenNganh(danhsachLop.MaKhoa,danhsachLop.MaChuyenNganh);

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
            frmKhoa.listChuyenNganh = _KHOA.BuildChuyenNganh(makhoa,"");
            return PartialView("~/Views/Lop/loadchuyennganh.ascx", frmKhoa);
        }


        /*----------------THÊM LỚP-----------------------*/
        public ActionResult ThemLop()
        {
            return View("~/Views/Lop/ThemLop.aspx");
        }

        public ActionResult ThemLopAjax()
        {
            var frmThemLop = new KHOA_DMKhoaForm();
            frmThemLop.listKhoa = _KHOA.BuildKhoa(frmThemLop.MaKhoa);
            frmThemLop.listNienKhoa = _KHOA.BuildNienKhoa(frmThemLop.MaNienKhoa);
            frmThemLop.listChuyenNganh = _KHOA.BuildChuyenNganh(frmThemLop.MaKhoa,frmThemLop.MaChuyenNganh);
            return View("~/Views/Lop/ThemLopUc.ascx",frmThemLop);
        }

        [HttpPost]
        public JsonResult ThemLop(KHOA_DMKhoaForm lop)
        {
            var Them = _LOP.ThemLop(lop);
            return Json(Them, JsonRequestBehavior.AllowGet);
        }

        /*--------------------SỬA LỚP------------------*/
        public ActionResult SuaLop(int id)
        {
            //var res = _LOP.GetLopTheoID(id);
            //res.listKhoa = _KHOA.BuildKhoa(res.MaKhoa);

            //res.listChuyenNganh = _KHOA.BuildChuyenNganh(res.MaChuyenNganh);
            //res.listNienKhoa = _KHOA.BuildNienKhoa(res.MaNienKhoa);
            return View("~/Views/Lop/SuaLop.aspx");


        }

        public ActionResult SuaLopAjax(int id)
        {
            var res = _LOP.GetLopTheoID(id);
            res.listKhoa = _KHOA.BuildKhoa(res.MaKhoa);

            res.listChuyenNganh = _KHOA.BuildChuyenNganh(res.MaKhoa,res.MaChuyenNganh);
            res.listNienKhoa = _KHOA.BuildNienKhoa(res.MaNienKhoa);
            return View("~/Views/Lop/SuaLopUc.ascx", res);


        }

        [HttpPost]
        public JsonResult SuaLop(int id, KHOA_DMKhoaForm sv)
        {
            var Sua = _LOP.SuaLop(sv);
            return Json(Sua, JsonRequestBehavior.AllowGet);
        }
        /*--------------------XÓA LỚP------------------*/
        [HttpGet]
        public JsonResult XoaLop(int id)
        {
           var Xoa = _LOP.XoaLop(id);
           return Json(Xoa, JsonRequestBehavior.AllowGet);
        }

    }
}
