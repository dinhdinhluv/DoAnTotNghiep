using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using bailam1.Models.LinQ;
using bailam1.Function;
using bailam1.Models.FormModel;
using Webdiyer.WebControls.Mvc;

namespace bailam1.Controllers
{
    public class AdminController : Controller
    {
        CheckLoginBussiness _CHECK = new CheckLoginBussiness();
        //
        // GET: /Admin/
        public ActionResult Index()
        {
            return View("~/Views/Admin/Login.aspx");
        }

        public ActionResult DanhSachAdmin(int? pageIndex)
        {
            return View("~/Views/Admin/DanhSachAdmin.aspx");
        }
        public ActionResult DanhSachAdminAjax(int? pageIndex, string TuKhoa)
        {
            var danhsachAdmin = new LoginForm();
            var lstTK = _CHECK.getAllTK();
            danhsachAdmin.PageNumber = pageIndex ?? 1;
            if (string.IsNullOrEmpty(TuKhoa))
            {
                danhsachAdmin.PageListDanhSachAdmin = new PagedList<LoginForm>(lstTK.DSTK, danhsachAdmin.PageNumber, 10);
            }
            else
            {
                lstTK.DSTK = lstTK.DSTK.Where(p => p.TaiKhoan.Trim().ToLower().Contains(TuKhoa.ToLower())).ToList();
                danhsachAdmin.PageListDanhSachAdmin = new PagedList<LoginForm>(lstTK.DSTK, danhsachAdmin.PageNumber, 10);
            }
            return View("~/Views/Admin/DanhSachAdmin.ascx", danhsachAdmin);
        }

        /*-----------------Thêm tài khoản----------------------*/
        public ActionResult ThemTaiKhoan()
        {
            return View("~/Views/Admin/ThemTaiKhoan.aspx");
        }

        public ActionResult ThemTaiKhoanAjax()
        {
            var frmThemTK = new LoginForm();

            return View("~/Views/Admin/ThemTaiKhoanUc.ascx", frmThemTK);
        }
        [HttpPost]
        public JsonResult ThemTaiKhoan(LoginForm login)
        {
            var ThemTK = _CHECK.ThemTK(login);
            return Json(ThemTK, JsonRequestBehavior.AllowGet);
        }

        /*--------------------SỬA TÀI KHOẢN------------------*/
        public ActionResult SuaTaiKhoan(int id)
        {
            return View("~/Views/Admin/SuaTaiKhoan.aspx");
        }

        public ActionResult SuaTaiKhoanAjax(int id)
        {
            var res = _CHECK.GetTaiKhoanTheoID(id);
            return View("~/Views/Admin/SuaTaiKhoanUc.ascx", res);
        }

        [HttpPost]
        public JsonResult SuaTaiKhoan(int id, LoginForm tk)
        {
            var SuaTK = _CHECK.SuaTK(tk);
            return Json(SuaTK, JsonRequestBehavior.AllowGet);
        }

        /*--------------------XÓA TÀI KHOẢN------------------*/
        [HttpGet]
        public JsonResult XoaTaiKhoan(int id)
        {
            var XoaTK = _CHECK.XoaTK(id);
            return Json(XoaTK, JsonRequestBehavior.AllowGet);
        }


        [HttpPost]
        public JsonResult Login(string Username, string Password)
        {
            var chkLogin = _CHECK.CheckLogin(Username, Password);
            return Json(chkLogin, JsonRequestBehavior.AllowGet);
        }
    }
}
