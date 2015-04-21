using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System.Web.Mvc;
using bailam1.Models.LinQ;
using bailam1.Models.FormModel;
namespace bailam1.Function
{
    public class cbxDiemBussiness
    {
        readonly DataQLSVDataContext _QLSVData = new DataQLSVDataContext();

        public SelectList BuildPhongThi(int? selectedvalue)
        {
            IEnumerable<DM_PHONGTHI> lstPhongThi = _QLSVData.DM_PHONGTHIs;
            IList<object> selectList = new List<object> { new { Value = "", Text = "-- Chọn Phòng --" } };
            foreach (var item in lstPhongThi)
            {
                selectList.Add(new { Value = item.MaPhongThi, Text = item.TenPhong });
            }

            return new SelectList(selectList, "Value", "Text", selectedvalue);
        }

        public SelectList BuildKhoa(string selectedvalue)
        {
            IEnumerable<DM_KHOA> lstKhoa = _QLSVData.DM_KHOAs;
            IList<object> selectList = new List<object> { new { Value = "", Text = "-- Chọn Khoa --" } };
            foreach (var item in lstKhoa)
            {
                selectList.Add(new { Value = item.MaKhoa, Text = item.TenKhoa });
            }

            return new SelectList(selectList, "Value", "Text", selectedvalue);
        }

        public SelectList BuildMonChuyenNganh(string MaKhoa)
        {
            IEnumerable<PHANMON_THEO_CHUYENNGANH> lstMonChuyenNganh = _QLSVData.PHANMON_THEO_CHUYENNGANHs.Where(a => a.MaKhoa == MaKhoa);
            IList<object> selectList = new List<object> { new { Value = "", Text = "-- Chọn Môn Chuyên Ngành --" } };
            foreach (var item in lstMonChuyenNganh)
            {
                var lst = _QLSVData.DM_MONHOCs.FirstOrDefault(a => a.MaMonHoc == item.MaMonHoc);
                selectList.Add(new { Value = item.MaMonTheoChuyenNganh, Text = lst.TenMonHoc+"("+item.MaNienKhoa+")"});
            }

            return new SelectList(selectList, "Value", "Text", "");
        }
    }
}