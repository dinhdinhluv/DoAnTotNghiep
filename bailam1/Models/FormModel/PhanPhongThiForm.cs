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
        public string ID { get; set; }
        public string MaSV { get; set; }
        public string PhongThi { get; set; }
        public string MonChuyenNganh { get; set; }
        public string NgayThi { get; set; }
        public SelectList listPhongThi { get; set; }
        public SelectList listKhoa { get; set; }
        public SelectList listMonChuyenNganh { get; set; }
        public SelectList listNgayThi { get; set; }
    }

    public class DanhSachPhanPhongThi
    {
        public List<PhanPhongThiForm> lstPhanPhongThi { get; set; }
        public int PageNumber { get; set; }
        public PagedList<PhanPhongThiForm> Page_lstPhanPhongThi{ get; set; }
    }
}