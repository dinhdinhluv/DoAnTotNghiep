using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System.Web.Mvc;
using Webdiyer.WebControls.Mvc;
using bailam1.Models.LinQ;
using bailam1.Models.FormModel;

namespace bailam1.Function
{
    public class PhanPhongThiBussiness
    {
        readonly DataQLSVDataContext _QLSVData = new DataQLSVDataContext();

        //public List<PhanPhongThiForm> lstPhanPhongThi()
        //{
        //    var PHANPHONGTHI = _QLSVData.PHANPHONGTHIs.ToList();
        //    var lst = new List<PhanPhongThiForm>();
        //    foreach (var PHANPHONG in PHANPHONGTHI)
        //    {
        //        var PhanPhongThiForm = new PhanPhongThiForm();
        //        var QueQuan = _QLSVData.DM_QUEQUANs.FirstOrDefault(a => a.MaQueQuan == PHANPHONG.NgayThi);
        //        SinhVienForm.QueQuan = QueQuan.TenQueQuan;
                
        //        lst.Add(DM_MonHocForm);
        //    }
        //    return lst;
        //}

        public List<SinhVienForm> lstSinhVienTemp(string Chuoi)
        {
            string[] Chuois = Chuoi.Split(',');
            var lst = new List<SinhVienForm>();
            var SinhVien = _QLSVData.SINHVIENs.ToList();
            int DoDaiChuoi = Chuois.Length - 1;
            for (int i = 1; i <= DoDaiChuoi; i++)
            {
                var SinhVienForm = new SinhVienForm();
                SinhVienForm.MaSinhVien = Chuois[i - 1];
                var SVien = _QLSVData.SINHVIENs.FirstOrDefault(a => a.MaSinhVien == Chuois[i - 1]);
                SinhVienForm.TenSinhVien = SVien.TenSinhVien;
                SinhVienForm.NgaySinh = SVien.NgaySinh;
                SinhVienForm.Lop = SVien.MaLop;
                lst.Add(SinhVienForm);
            }
            return lst;
        }

        public bool ThemPhongThi(string Chuoi,string PhongThi,string MaMonChuyenNganh,string NgayThi)
        {
            bool kt = true;
            var lst = new List<PHANPHONGTHI>();
            string[] Chuois = Chuoi.Split(',');
            int DoDaiChuoi = Chuois.Length - 1;
            try
            {

                for (int i = 1; i <= DoDaiChuoi; i++)
                {
                    var PHANPHONGTHI = new PHANPHONGTHI();
                    PHANPHONGTHI.MaSV = Chuois[i-1];
                    PHANPHONGTHI.MaPhongThi = Convert.ToInt32(PhongThi);
                    PHANPHONGTHI.MaMonHocTheoChuyenNganh = Convert.ToInt32(MaMonChuyenNganh);
                    PHANPHONGTHI.NgayThi = NgayThi;
                    lst.Add(PHANPHONGTHI);
                        
                }
                _QLSVData.PHANPHONGTHIs.InsertAllOnSubmit(lst);
                _QLSVData.SubmitChanges();
            }
            catch
            {
                kt = false;
            }
            return kt;
        }

        public SelectList BuildNgayThi(string selectedvalue)
        {
            IEnumerable<PHANPHONGTHI> lstNgayThi = _QLSVData.PHANPHONGTHIs.OrderByDescending(a => a.ID);
            IList<object> selectList = new List<object> { new { Value = "", Text = "-- Chọn Ngày Thi --" } };
            foreach (var item in lstNgayThi)
            {
                selectList.Add(new { Value = item.NgayThi, Text = item.NgayThi });
            }

            return new SelectList(selectList, "Value", "Text", selectedvalue);
        }
    }
}