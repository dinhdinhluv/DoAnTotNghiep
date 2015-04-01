using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DOANDEMO.Models.FormModel;
using DOANDEMO.Models.LinQ;
using System.Web.Mvc;
namespace DOANDEMO.Function
{
    public class KhoaBussiness
    {
        readonly DataQLSVDataContext _QLSVData = new DataQLSVDataContext();

        public SelectList BuildKhoa(string selectedvalue)
        {
            IEnumerable<DM_KHOA> lstKhoa = _QLSVData.DM_KHOAs;
            IList<object> selectList = new List<object> { new { Value = "", Text = "-- Chọn khoa --" } };
            foreach (var item in lstKhoa)
            {
                selectList.Add(new { Value = item.MaKhoa, Text = item.TenKhoa });
            }

            return new SelectList(selectList, "Value", "Text", selectedvalue);
        }

        public SelectList BuildQueQuan(int? selectedvalue)
        {
            IEnumerable<DM_QUEQUAN> lstQueQuan = _QLSVData.DM_QUEQUANs;
            IList<object> selectList = new List<object> { new { Value = 0, Text = "-- Chọn quê quán --" } };
            foreach (var item in lstQueQuan)
            {
                selectList.Add(new { Value = item.MaQueQuan, Text = item.TenQueQuan });
            }

            return new SelectList(selectList, "Value", "Text", selectedvalue ?? 0);
        }

        public SelectList BuildDanToc(int? selectedvalue)
        {
            IEnumerable<DM_DANTOC> lstDanToc = _QLSVData.DM_DANTOCs;
            IList<object> selectList = new List<object> { new { Value = 0, Text = "-- Chọn dân tộc --" } };
            foreach (var item in lstDanToc)
            {
                selectList.Add(new { Value = item.MaDanToc, Text = item.TenDanToc });
            }

            return new SelectList(selectList, "Value", "Text", selectedvalue ?? 0);
        }

        public SelectList BuildTonGiao(int? selectedvalue)
        {
            IEnumerable<DM_TONGIAO> lstTonGiao = _QLSVData.DM_TONGIAOs;
            IList<object> selectList = new List<object> { new { Value = 0, Text = "-- Chọn tôn giáo --" } };
            foreach (var item in lstTonGiao)
            {
                selectList.Add(new { Value = item.MaTonGiao, Text = item.TenTonGiao });
            }

            return new SelectList(selectList, "Value", "Text", selectedvalue ?? 0);
        }

        public SelectList BuildNienKhoa(string selectedvalue)
        {
            IEnumerable<DM_NIENKHOA> lstNienKhoa = _QLSVData.DM_NIENKHOAs.OrderBy(a=>a.STT);
            IList<object> selectList = new List<object> { new { Value = "", Text = "-- Chọn niên khóa --" } };
            foreach (var item in lstNienKhoa)
            {
                selectList.Add(new { Value = item.MaNienKhoa, Text = item.ThoiGienNienKhoa });
            }

            return new SelectList(selectList, "Value", "Text", selectedvalue);
        }

        public SelectList BuildChuyenNganh(string MaKhoa)
        {
            IEnumerable<DM_CHUYENNGANH_THEO_KHOA> lstKhoa = _QLSVData.DM_CHUYENNGANH_THEO_KHOAs.Where(a=>a.MaKhoa==MaKhoa);
            IList<object> selectList = new List<object> { new { Value = "", Text = "-- Chọn chuyên ngành --" } };
            foreach (var item in lstKhoa)
            {
                selectList.Add(new { Value = item.MaChuyenNganh, Text = item.TenChuyenNganh });
            }

            return new SelectList(selectList, "Value", "Text", "");
        }
    }
}