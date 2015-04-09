using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Webdiyer.WebControls.Mvc;

namespace bailam1.Models.FormModel
{
    public class SinhVienForm
    {
        public string MaSinhVien { get; set; }
        public string TenSinhVien { get; set; }
        public string GioiTinh { get; set; }
        public string DiaChi { get; set; }
        public string NgaySinh { get; set; }
        public string SDT { get; set; }
        public string QueQuan { get; set; }
        public string DanToc { get; set; }
        public string TonGiao { get; set; }
        public string HinhAnh { get; set; }
        public string Lop { get; set; }
        public string Khoa { get; set; }
        public string NienKhoa { get; set; }
        public SelectList listKhoa { get; set; }
        public SelectList listChuyenNganh { get; set; }
        public SelectList listDanToc { get; set; }
        public SelectList listQueQuan { get; set; }
        public SelectList listTonGiao { get; set; }
        public SelectList listNienKhoa { get; set; }
        public SelectList listGioiTinh { get; set; }
        public SelectList listLop { get; set; }
    }

    public class DanhSachSinhVien
    {
        public List<SinhVienForm> lstSV { get; set; }
        public int PageNumber { get; set; }
        public PagedList<SinhVienForm> Page_lstSV { get; set; }
    }
}