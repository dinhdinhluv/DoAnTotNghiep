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
    public class SinhVienFunction
    {
        readonly DataQLSVDataContext _QLSVData = new DataQLSVDataContext();

        //lstSinhVienAll
        public List<SinhVienForm> lstSinhVienAll()
        {
            var SinhVien = _QLSVData.SINHVIENs.ToList();
            var lst = new List<SinhVienForm>();
            foreach (var SV in SinhVien)
            {
                var SinhVienForm = new SinhVienForm();
                SinhVienForm.MaSinhVien = SV.MaSinhVien;
                SinhVienForm.TenSinhVien = SV.TenSinhVien;
                if (SV.GioiTinh == true)
                    SinhVienForm.GioiTinh = "Nam";
                else
                    SinhVienForm.GioiTinh = "Nữ";
                SinhVienForm.NgaySinh = SV.NgaySinh;
                var QueQuan = _QLSVData.DM_QUEQUANs.FirstOrDefault(a => a.MaQueQuan == SV.MaQueQuan);
                SinhVienForm.QueQuan = QueQuan.TenQueQuan;
                var Lop = _QLSVData.LOPs.FirstOrDefault(a => a.MaLop == SV.MaLop);
                SinhVienForm.Lop = Lop.TenLop;
                lst.Add(SinhVienForm);
            }
            return lst;
        }
        //lstSinhVienTheoMaSVHoacMaLop
        public List<SinhVienForm> lstSinhVienTheoMaSV(string MaSV)
        {
            var SinhVien = _QLSVData.SINHVIENs.Where(a => a.MaSinhVien.Trim().ToLower().Contains(MaSV.Trim().ToLower())).ToList();
            var lst = new List<SinhVienForm>();
            foreach (var SV in SinhVien)
            {
                var SinhVienForm = new SinhVienForm();
                SinhVienForm.MaSinhVien = SV.MaSinhVien;
                SinhVienForm.TenSinhVien = SV.TenSinhVien;
                if (SV.GioiTinh == true)
                    SinhVienForm.GioiTinh = "Nam";
                else
                    SinhVienForm.GioiTinh = "Nữ";
                SinhVienForm.NgaySinh = SV.NgaySinh;
                var QueQuan = _QLSVData.DM_QUEQUANs.FirstOrDefault(a => a.MaQueQuan == SV.MaQueQuan);
                SinhVienForm.QueQuan = QueQuan.TenQueQuan;
                var Lop = _QLSVData.LOPs.FirstOrDefault(a => a.MaLop == SV.MaLop);
                SinhVienForm.Lop = Lop.TenLop;
                lst.Add(SinhVienForm);
            }
            return lst;
        }

        public List<SinhVienForm> lstSinhVienTheoMaLop(string MaLop)
        {
            var lst = new List<SinhVienForm>();
                var SinhVien = _QLSVData.SINHVIENs.Where(a => a.MaLop.Contains(MaLop)).ToList();
                
                foreach (var SV in SinhVien)
                {
                    var SinhVienForm = new SinhVienForm();
                    SinhVienForm.MaSinhVien = SV.MaSinhVien;
                    SinhVienForm.TenSinhVien = SV.TenSinhVien;
                    if (SV.GioiTinh == true)
                        SinhVienForm.GioiTinh = "Nam";
                    else
                        SinhVienForm.GioiTinh = "Nữ";
                    SinhVienForm.NgaySinh = SV.NgaySinh;
                    var QueQuan = _QLSVData.DM_QUEQUANs.FirstOrDefault(a => a.MaQueQuan == SV.MaQueQuan);
                    SinhVienForm.QueQuan = QueQuan.TenQueQuan;
                    var Lop = _QLSVData.LOPs.FirstOrDefault(a => a.MaLop == SV.MaLop);
                    SinhVienForm.Lop = Lop.TenLop;
                    lst.Add(SinhVienForm);
                }
            return lst;
        }

        public SinhVienForm SinhVienTheoMaSV(string MaSV)
        {
            var SinhVien = _QLSVData.SINHVIENs.FirstOrDefault(a => a.MaSinhVien == MaSV);
            var SinhVienForm = new SinhVienForm();
            SinhVienForm.MaSinhVien = SinhVien.MaSinhVien;
            SinhVienForm.TenSinhVien = SinhVien.TenSinhVien;
            SinhVienForm.GioiTinh = SinhVien.GioiTinh.ToString();
            SinhVienForm.DiaChi = SinhVien.DiaChi;
            SinhVienForm.NgaySinh = SinhVien.NgaySinh;
            SinhVienForm.SDT = SinhVien.SDT;
            SinhVienForm.QueQuan = SinhVien.MaQueQuan.ToString();
            SinhVienForm.DanToc = SinhVien.MaDanToc.ToString();
            SinhVienForm.TonGiao = SinhVien.MaTonGiao.ToString();
            SinhVienForm.HinhAnh = SinhVien.HinhAnh;
            SinhVienForm.Lop = SinhVien.MaLop.ToString();
            SinhVienForm.Khoa = SinhVien.MaKhoa.ToString();
            SinhVienForm.NienKhoa = SinhVien.MaNienKhoa.ToString();
            return SinhVienForm;
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
        /*----------------------------------------------------------*/
        public bool ThucHienThemSV(SinhVienForm SinhVienForm, HttpPostedFileBase HinhSV)
        {
            bool kt = true;
            string duoihinh = Path.GetExtension(HinhSV.FileName);
            SinhVienForm.HinhAnh = SinhVienForm.MaSinhVien + duoihinh;
            var SV = new SINHVIEN();
            try
            {
                SV.MaSinhVien = SinhVienForm.MaSinhVien;
                SV.TenSinhVien = SinhVienForm.TenSinhVien;
                SV.NgaySinh = SinhVienForm.NgaySinh;
                SV.GioiTinh = Convert.ToBoolean(SinhVienForm.GioiTinh);
                SV.SDT = SinhVienForm.SDT;
                SV.DiaChi = SinhVienForm.DiaChi;
                SV.MaQueQuan = Convert.ToInt32(SinhVienForm.QueQuan);
                SV.MaDanToc = Convert.ToInt32(SinhVienForm.DanToc);
                SV.MaTonGiao = Convert.ToInt32(SinhVienForm.TonGiao);
                SV.MaKhoa = SinhVienForm.Khoa;
                SV.MaNienKhoa = SinhVienForm.NienKhoa;
                SV.MaLop = SinhVienForm.Lop;
                SV.HinhAnh = SinhVienForm.HinhAnh;
                _QLSVData.SINHVIENs.InsertOnSubmit(SV);
                _QLSVData.SubmitChanges();
            }
            catch
            {
                kt = false;
            }
            if (!Directory.Exists(HttpContext.Current.Server.MapPath("~/HinhSV/" + SinhVienForm.Khoa)))
            {
                Directory.CreateDirectory(HttpContext.Current.Server.MapPath("~/HinhSV/" + SinhVienForm.Khoa));
            }
            if (!Directory.Exists(HttpContext.Current.Server.MapPath("~/HinhSV/" + SinhVienForm.Khoa + "/" + SinhVienForm.Lop)))
            {
                Directory.CreateDirectory(HttpContext.Current.Server.MapPath("~/HinhSV/" + SinhVienForm.Khoa + "/" + SinhVienForm.Lop));
            }
            HinhSV.SaveAs(HttpContext.Current.Server.MapPath("~/HinhSV/" + SinhVienForm.Khoa + "/" + SinhVienForm.Lop + "/" + SinhVienForm.MaSinhVien + duoihinh));
            return kt;
        }
        public bool ThucHienSuaSV(SinhVienForm SinhVienForm, HttpPostedFileBase HinhSV)
        {
            bool kt = true;
            var SV = _QLSVData.SINHVIENs.FirstOrDefault(a => a.MaSinhVien == SinhVienForm.MaSinhVien);
            if (HinhSV != null)
            {
                string duoihinh = Path.GetExtension(HinhSV.FileName);
                HinhSV.SaveAs(HttpContext.Current.Server.MapPath("~/HinhSV/" + SinhVienForm.Khoa + "/" + SinhVienForm.Lop + "/" + SinhVienForm.MaSinhVien + duoihinh));
                SinhVienForm.HinhAnh = SinhVienForm.MaSinhVien + duoihinh;
            }
            try
            {
                SV.TenSinhVien = SinhVienForm.TenSinhVien;
                SV.NgaySinh = SinhVienForm.NgaySinh;
                SV.GioiTinh = Convert.ToBoolean(SinhVienForm.GioiTinh);
                SV.SDT = SinhVienForm.SDT;
                SV.DiaChi = SinhVienForm.DiaChi;
                SV.MaQueQuan = Convert.ToInt32(SinhVienForm.QueQuan);
                SV.MaDanToc = Convert.ToInt32(SinhVienForm.DanToc);
                SV.MaTonGiao = Convert.ToInt32(SinhVienForm.TonGiao);
                if (HinhSV != null)
                {
                    SV.HinhAnh = SinhVienForm.HinhAnh;
                }
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

