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
    public class MonHocBussiness
    {
        readonly DataQLSVDataContext _QLSVData = new DataQLSVDataContext();

        public List<DM_MonHocForm> lstDM_MonHoc_All()
        {
            var DM_MonHoc = _QLSVData.DM_MONHOCs.ToList();
            var lst = new List<DM_MonHocForm>();
            foreach (var MonHoc in DM_MonHoc)
            {
                var DM_MonHocForm = new DM_MonHocForm();
                DM_MonHocForm.MaMonHoc = MonHoc.MaMonHoc.ToString();
                DM_MonHocForm.TenMonHoc = MonHoc.TenMonHoc;
                if (MonHoc.TrangThai == true)
                    DM_MonHocForm.TrangThai = "Bật";
                else
                    DM_MonHocForm.TrangThai = "Tắt";
                lst.Add(DM_MonHocForm);
            }
            return lst;
        }

        public List<DM_MonHocForm> lstDM_MonHocTheoTrangThai(string TrangThai)
        {
            var DM_MonHoc = _QLSVData.DM_MONHOCs.Where(a => a.TrangThai == Convert.ToBoolean(TrangThai)).ToList();
            var lst = new List<DM_MonHocForm>();
            foreach (var MonHoc in DM_MonHoc)
            {
                var DM_MonHocForm = new DM_MonHocForm();
                DM_MonHocForm.MaMonHoc = MonHoc.MaMonHoc.ToString();
                DM_MonHocForm.TenMonHoc = MonHoc.TenMonHoc;
                if (MonHoc.TrangThai == true)
                    DM_MonHocForm.TrangThai = "Bật";
                else
                    DM_MonHocForm.TrangThai = "Tắt";
                lst.Add(DM_MonHocForm);
            }
            return lst;
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

        public bool OnOff(string MaMH, string TrangThai)
        {
            bool kt = true;
            var DM_MONHOC = _QLSVData.DM_MONHOCs.FirstOrDefault(a => a.MaMonHoc == Convert.ToInt32(MaMH));
            try
            {
                if(TrangThai=="Bật")
                    DM_MONHOC.TrangThai = Convert.ToBoolean("False");
                else
                    DM_MONHOC.TrangThai = Convert.ToBoolean("True");
                _QLSVData.SubmitChanges();
            }
            catch
            {
                kt = false;
            }
            return kt;
        }

        public bool ThemMon(DM_MonHocForm DM_MonHocForm)
        {
            bool kt = true;
            var DM_MONHOC = new DM_MONHOC();
            try
            {
                DM_MONHOC.TenMonHoc = DM_MonHocForm.TenMonHoc;
                DM_MONHOC.TrangThai = Convert.ToBoolean("True");
                _QLSVData.DM_MONHOCs.InsertOnSubmit(DM_MONHOC);
                _QLSVData.SubmitChanges();
            }
            catch
            {
                kt = false;
            }
            return kt;
        }
    }
}