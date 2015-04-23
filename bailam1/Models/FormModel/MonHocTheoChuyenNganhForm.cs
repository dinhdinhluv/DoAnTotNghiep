using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Webdiyer.WebControls.Mvc;
namespace bailam1.Models.FormModel
{
    public class MonHocTheoChuyenNganhForm
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

    public class DanhSachMonHocTheoChuyenNganh
    {
        public List<MonHocTheoChuyenNganhForm> lstMonHocTheoChuyenNganh{ get; set; }
        public int PageNumber { get; set; }
        public PagedList<MonHocTheoChuyenNganhForm> Page_lstMonHocTheoChuyenNganh { get; set; }
    }
}