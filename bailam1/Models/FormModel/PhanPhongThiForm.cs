using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Webdiyer.WebControls.Mvc;

namespace bailam1.Models.FormModel
{
    public class PhanPhongThiForm
    {
        public string MaMonTheoChuyenNganh { get; set; }
        public string MonHoc { get; set; }
        public string Khoa { get; set; }
        public string ChuyenNganh { get; set; }
        public string HocKy { get; set; }
        public string NienKhoa { get; set; }
        public string DVHT { get; set; }
        public SelectList listMonHoc { get; set; }
        public SelectList listKhoa { get; set; }
        public SelectList listChuyenNganh { get; set; }
        public SelectList listHocKy { get; set; }
        public SelectList listNienKhoa { get; set; }
    }

    public class DanhSachPhanPhongThi
    {
        public List<PhanPhongThiForm> lstPhanPhongThi { get; set; }
        public int PageNumber { get; set; }
        public PagedList<PhanPhongThiForm> Page_lstPhanPhongThi{ get; set; }
    }
}