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
    public class DanhMucBussiness
    {

        readonly DataQLSVDataContext _QLSVData = new DataQLSVDataContext();

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

        public SelectList BuildQueQuan(int? selectedvalue)
        {
            IEnumerable<DM_QUEQUAN> lstQueQuan = _QLSVData.DM_QUEQUANs;
            IList<object> selectList = new List<object> { new { Value = 0, Text = "-- Chọn Quê Quán --" } };
            foreach (var item in lstQueQuan)
            {
                selectList.Add(new { Value = item.MaQueQuan, Text = item.TenQueQuan });
            }

            return new SelectList(selectList, "Value", "Text", selectedvalue);
        }

        public SelectList BuildDanToc(int? selectedvalue)
        {
            IEnumerable<DM_DANTOC> lstDanToc = _QLSVData.DM_DANTOCs;
            IList<object> selectList = new List<object> { new { Value = 0, Text = "-- Chọn Dân Tộc --" } };
            foreach (var item in lstDanToc)
            {
                selectList.Add(new { Value = item.MaDanToc, Text = item.TenDanToc });
            }

            return new SelectList(selectList, "Value", "Text", selectedvalue ?? 0);
        }

        public SelectList BuildTonGiao(int? selectedvalue)
        {
            IEnumerable<DM_TONGIAO> lstTonGiao = _QLSVData.DM_TONGIAOs;
            IList<object> selectList = new List<object> { new { Value = 0, Text = "-- Chọn Tôn Giáo --" } };
            foreach (var item in lstTonGiao)
            {
                selectList.Add(new { Value = item.MaTonGiao, Text = item.TenTonGiao });
            }

            return new SelectList(selectList, "Value", "Text", selectedvalue ?? 0);
        }

        public SelectList BuildNienKhoa(string selectedvalue)
        {
            IEnumerable<DM_NIENKHOA> lstNienKhoa = _QLSVData.DM_NIENKHOAs.OrderBy(a => a.STT);
            IList<object> selectList = new List<object> { new { Value = "", Text = "-- Chọn Niên Khóa --" } };
            foreach (var item in lstNienKhoa)
            {
                selectList.Add(new { Value = item.MaNienKhoa, Text = item.ThoiGienNienKhoa });
            }

            return new SelectList(selectList, "Value", "Text", selectedvalue);
        }

        public SelectList BuildChuyenNganh(string MaKhoa)
        {
            IEnumerable<DM_CHUYENNGANH_THEO_KHOA> lstKhoa = _QLSVData.DM_CHUYENNGANH_THEO_KHOAs.Where(a => a.MaKhoa == MaKhoa);
            IList<object> selectList = new List<object> { new { Value = "", Text = "-- Chọn Chuyên Ngành --" } };
            foreach (var item in lstKhoa)
            {
                selectList.Add(new { Value = item.MaChuyenNganh, Text = item.TenChuyenNganh });
            }

            return new SelectList(selectList, "Value", "Text", "");
        }

        public SelectList BuildLop(string MaKhoa,string MaNienKhoa,string MaLop)
        {
            IEnumerable<LOP> lstLop = _QLSVData.LOPs.Where(a => a.MaKhoa == MaKhoa && a.MaNienKhoa == MaNienKhoa);
            IList<object> selectList = new List<object> { new { Value = "", Text = "-- Chọn Lớp --" } };
            foreach (var item in lstLop)
            {
                selectList.Add(new { Value = item.MaLop, Text = item.TenLop });
            }

            return new SelectList(selectList, "Value", "Text", MaLop);
        }

        public SelectList BuildGioiTinh(string GioiTinh)
        {
            IList<object> selectList = new List<object> { new { Value = "", Text = "-- Chọn Giới Tính --" } };
            selectList.Add(new { Value = "True", Text = "Nam" });
            selectList.Add(new { Value = "False", Text = "Nữ" });
            return new SelectList(selectList, "Value", "Text", GioiTinh);
        }
    }
}