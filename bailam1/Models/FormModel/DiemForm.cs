using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace bailam1.Models.FormModel
{
    public class DiemForm
    {
        public int ID { get; set; }

        public string MaSinhVien { get; set; }
        public string TenSinhVien { get; set; }

        public string MaKhoa { get; set; }
        public string TenKhoa { get; set; }

        public int MaMonHocChuyenNganh { get; set; }
        public string TenMonHocChuyenNganh { get; set; }

        public string MaLop { get; set; }


        public int MaPhongThi { get; set; }
        public string TenPhongThi { get; set; }

        public DateTime NgayThi { get; set; }
        
        public string DTB1 { get; set; }
        public string DTB2 { get; set; }

        public List<DiemForm> DSDIEM { get; set; }

        public SelectList listKhoa { get; set; }    
        public SelectList listPhongThi { get; set; }
        public SelectList listMonChuyenNganh { get; set; }
    }
}