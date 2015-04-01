using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Webdiyer.WebControls.Mvc;

namespace bailam1.Models.FormModel
{
    public class KHOA_DMKhoaForm
    {
        public int ID { get; set; }

        public string MaLop { get; set; }
        public string TenLop { get; set; }

        public string MaChuyenNganh { get; set; }
        public string TenChuyenNganh { get; set; }

        public string MaNienKhoa { get; set; }
        public string ThoiGianNienKhoa { get; set; }

        public string MaKhoa { get; set; }
        public string TenKhoa { get; set; }

        public int PageNumber { get; set; }
        public PagedList<KHOA_DMKhoaForm> PageListDanhSachLop { get; set; }
        public List<KHOA_DMKhoaForm> DSLOP { get; set; }

        public SelectList listKhoa { get; set; }
        public SelectList listChuyenNganh { get; set; }
        public SelectList listDanToc { get; set; }
        public SelectList listQueQuan { get; set; }
        public SelectList listTonGiao { get; set; }
        public SelectList listNienKhoa { get; set; }
    }
}