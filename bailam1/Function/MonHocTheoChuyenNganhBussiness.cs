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
    public class MonHocTheoChuyenNganhBussiness
    {
        readonly DataQLSVDataContext _QLSVData = new DataQLSVDataContext();

        public List<MonHocTheoChuyenNganhForm> lstMonHocTheoChuyenNganh_TheoMaKhoa(string MaKhoa)
        {
            var MonHocTheoChuyenNganh = _QLSVData.PHANMON_THEO_CHUYENNGANHs.Where(a => a.MaKhoa == MaKhoa).ToList().OrderByDescending(a => a.MaNienKhoa);
            var lst = new List<MonHocTheoChuyenNganhForm>();
            foreach (var MHTheoCN in MonHocTheoChuyenNganh)
            {
                var MonHocTheoChuyenNganhForm = new MonHocTheoChuyenNganhForm();
                MonHocTheoChuyenNganhForm.MaMonTheoChuyenNganh = MHTheoCN.MaMonTheoChuyenNganh.ToString();
                var MonHoc = _QLSVData.DM_MONHOCs.FirstOrDefault(a => a.MaMonHoc == MHTheoCN.MaMonHoc);
                MonHocTheoChuyenNganhForm.MonHoc = MonHoc.TenMonHoc;
                var ChuyenNganh = _QLSVData.DM_CHUYENNGANH_THEO_KHOAs.FirstOrDefault(a => a.MaChuyenNganh == MHTheoCN.MaChuyenNganh);
                MonHocTheoChuyenNganhForm.ChuyenNganh = ChuyenNganh.TenChuyenNganh;
                var HocKy = _QLSVData.DM_HOCKies.FirstOrDefault(a => a.MaHK == MHTheoCN.MaHocKy);
                MonHocTheoChuyenNganhForm.HocKy = HocKy.TenHK;
                var NienKhoa = _QLSVData.DM_NIENKHOAs.FirstOrDefault(a => a.MaNienKhoa == MHTheoCN.MaNienKhoa);
                MonHocTheoChuyenNganhForm.NienKhoa = NienKhoa.ThoiGienNienKhoa;
                MonHocTheoChuyenNganhForm.DVHT = MHTheoCN.DVHT.ToString();
                lst.Add(MonHocTheoChuyenNganhForm);
            }
            return lst;
        }

        public SelectList cbxKhoa()
        {
            IEnumerable<DM_KHOA> lstKhoa = _QLSVData.DM_KHOAs;
            IList<object> selectList = new List<object> { };
            foreach (var item in lstKhoa)
            {
                selectList.Add(new { Value = item.MaKhoa, Text = item.TenKhoa });
            }

            return new SelectList(selectList, "Value", "Text");
        }

        public bool ThemMonChuyenNganh(MonHocTheoChuyenNganhForm MonHocTheoChuyenNganhForm)
        {
            bool kt = true;
            var MonChuyenNganh = new PHANMON_THEO_CHUYENNGANH();
            try
            {
                MonChuyenNganh.MaMonHoc = Convert.ToInt32(MonHocTheoChuyenNganhForm.MonHoc);
                MonChuyenNganh.MaKhoa = MonHocTheoChuyenNganhForm.Khoa;
                MonChuyenNganh.MaChuyenNganh = MonHocTheoChuyenNganhForm.ChuyenNganh;
                MonChuyenNganh.MaHocKy = MonHocTheoChuyenNganhForm.HocKy;
                MonChuyenNganh.MaNienKhoa = MonHocTheoChuyenNganhForm.NienKhoa;
                MonChuyenNganh.DVHT = Convert.ToInt32(MonHocTheoChuyenNganhForm.DVHT);

                _QLSVData.PHANMON_THEO_CHUYENNGANHs.InsertOnSubmit(MonChuyenNganh);
                _QLSVData.SubmitChanges();
            }
            catch
            {
                kt = false;
            }
            return kt;
        }

        public void ChangeTextPaging(PagerOptions pagerOptions, string PageIndexParameterName)
        {
            pagerOptions.PageIndexParameterName = string.IsNullOrEmpty(PageIndexParameterName) ? "id" : PageIndexParameterName;
            pagerOptions.NextPageText = "Tiếp";
            pagerOptions.PrevPageText = "Trước";
            pagerOptions.FirstPageText = "Đầu";
            pagerOptions.LastPageText = "Cuối";
            pagerOptions.CssClass = "pages";
            pagerOptions.CurrentPagerItemWrapperFormatString = "<span class=\"cpb\">{0}</span>";
            pagerOptions.NumericPagerItemWrapperFormatString = "<span class=\"item\">{0}</span>";
        }

    }
}