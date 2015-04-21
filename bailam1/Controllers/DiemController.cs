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
    public class DiemController : Controller
    {
        //
        // GET: /Diem/
        DataQLSVDataContext _QLSVData = new DataQLSVDataContext();
        cbxDiemBussiness _cbxDiem = new cbxDiemBussiness();
        DiemBussiness _DIEM = new DiemBussiness();

        public ActionResult DiemTheoPhongThi()
        {
            var danhsachDiem = new DiemForm();
            
            danhsachDiem.listKhoa = _cbxDiem.BuildKhoa(danhsachDiem.MaKhoa);
            danhsachDiem.listPhongThi = _cbxDiem.BuildPhongThi(danhsachDiem.MaPhongThi);
            return View("~/Views/Diem/DiemTheoPhongThi.aspx",danhsachDiem);
        }
        public ActionResult DiemTheoPhongThijs(int MaPhongThi, int MaMonHocChuyenNganh)
        {
            var danhsachDiem = new DiemForm();
            var lstDiem = _DIEM.getDiemTheoMaPhongvMaMon(MaPhongThi, MaMonHocChuyenNganh);
            danhsachDiem.listKhoa = _cbxDiem.BuildKhoa(danhsachDiem.MaKhoa);
            danhsachDiem.listPhongThi = _cbxDiem.BuildPhongThi(danhsachDiem.MaPhongThi);
            danhsachDiem.listMonChuyenNganh = _cbxDiem.BuildMonChuyenNganh(danhsachDiem.MaKhoa);
            danhsachDiem.DSDIEM = lstDiem.DSDIEM;
            return PartialView("~/Views/Diem/DiemTheoPhongThi.ascx", danhsachDiem);
        }

        public ActionResult LoadMonTheoKhoa(string makhoa)
        {
            DiemForm frmDiem = new DiemForm();
            frmDiem.listMonChuyenNganh = _cbxDiem.BuildMonChuyenNganh(makhoa);
            return PartialView("~/Views/Diem/LoadMonThiTheoKhoa.ascx", frmDiem);
        }

    }
}
