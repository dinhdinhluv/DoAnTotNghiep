using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Webdiyer.WebControls.Mvc;

namespace bailam1.Models.FormModel
{
    public class LoginForm
    {
        public int ID { get; set; }
        public string TaiKhoan { get; set; }
        public string MatKhau { get; set; }
        public string MatKhauMoi { get; set; }
        public string MaLoaiTaiKhoan { get; set; }
        public string TenLoaiTaiKhoan { get; set; }

        public int PageNumber { get; set; }
        public PagedList<LoginForm> PageListDanhSachAdmin { get; set; }
        public List<LoginForm> DSTK { get; set; }

        public SelectList listQuyenHan { get; set; }
    }
}