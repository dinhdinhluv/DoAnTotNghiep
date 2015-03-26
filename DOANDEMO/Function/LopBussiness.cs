using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DOANDEMO.Models.FormModel;
using DOANDEMO.Models.LinQ;
using Webdiyer.WebControls.Mvc;
namespace DOANDEMO.Function
{
    public class LopBussiness
    {
        readonly DataQLSVDataContext _QLSVData = new DataQLSVDataContext();


        public KHOA_DMKhoaForm getAllLop()
        {
            var t = new KHOA_DMKhoaForm();
            var lstLop = _QLSVData.LOPs.Where(a => a.IsDelete == Convert.ToBoolean("False")).ToList();
            var svf = new List<KHOA_DMKhoaForm>();
            foreach (var i in lstLop)
            {
                KHOA_DMKhoaForm a = new KHOA_DMKhoaForm();
                a.ID = i.ID;
                a.MaLop = i.MaLop;
                a.TenLop = i.TenLop;

                a.MaChuyenNganh = i.MaChuyenNganh;
                var w = _QLSVData.DM_CHUYENNGANH_THEO_KHOAs.Where(h => h.MaChuyenNganh == i.MaChuyenNganh);
                foreach (var e in w)
                {
                    a.TenChuyenNganh = e.TenChuyenNganh;
                }

                a.MaKhoa = i.MaKhoa;
                var p = _QLSVData.DM_KHOAs.Where(h => h.MaKhoa == i.MaKhoa);
                foreach (var e in p)
                {
                    a.TenKhoa = e.TenKhoa;
                }

                var q = _QLSVData.DM_NIENKHOAs.Where(h => h.MaNienKhoa == i.MaNienKhoa);
                foreach (var k in q)
                {
                    a.ThoiGianNienKhoa = k.ThoiGienNienKhoa;
                }

                svf.Add(a);


            }
            t.DSLOP = svf;
            return t;
        }

        public string ThemLop(KHOA_DMKhoaForm DMLOP)
        {
            var lstLOP = new LOP();
            var lst = _QLSVData.LOPs.FirstOrDefault(a=>a.MaLop==DMLOP.MaLop);
            if(lst==null)
            {
                lstLOP.MaLop = DMLOP.MaLop;
                lstLOP.TenLop = DMLOP.TenLop;
                lstLOP.MaChuyenNganh = DMLOP.MaChuyenNganh;
                lstLOP.MaKhoa = DMLOP.MaKhoa;
                lstLOP.MaNienKhoa = DMLOP.MaNienKhoa.Trim();
                lstLOP.IsDelete = Convert.ToBoolean("False");

                _QLSVData.LOPs.InsertOnSubmit(lstLOP);
                _QLSVData.SubmitChanges();
                return "Thêm thành công";
            }
            else
            {
                return "Không thành công";
            }
        }

        public string SuaLop(KHOA_DMKhoaForm DMLOP)
        {
            var Lop = _QLSVData.LOPs.FirstOrDefault(t => t.ID == DMLOP.ID);
            if (Lop != null)
            {
                Lop.MaLop = DMLOP.MaLop;
                Lop.TenLop = DMLOP.TenLop;
                Lop.MaKhoa = DMLOP.MaKhoa;
                Lop.MaChuyenNganh = DMLOP.MaChuyenNganh;
                Lop.MaNienKhoa = DMLOP.MaNienKhoa;
                Lop.IsDelete = Convert.ToBoolean("False");
                
                try
                {
                    _QLSVData.SubmitChanges();
                    return "Cập nhật thành công";
                }
                catch
                {
                    return "Cập nhật không thành công";
                }
            }
            return "Cập nhật không thành công";
        }

        public string XoaLop(int idLop)
        {
            var sv = _QLSVData.LOPs.FirstOrDefault(t => t.ID == idLop);
            if (sv != null)
            {
                try
                {
                    sv.IsDelete = Convert.ToBoolean("True");
                    _QLSVData.SubmitChanges();
                    return "Xóa thành công";
                }
                catch (Exception)
                {
                    return "Xóa không thành công";
                }
            }
            return "Xóa thất bại";
        }

        public KHOA_DMKhoaForm GetLopTheoID(int ID)
        {
            var f = new KHOA_DMKhoaForm();
            var sv = _QLSVData.LOPs.FirstOrDefault(t => t.ID == ID);
            if (sv != null)
            {
                f.ID = sv.ID;
                f.MaLop = sv.MaLop;
                f.TenLop = sv.TenLop;
                f.MaKhoa = sv.MaKhoa;
                f.MaChuyenNganh = sv.MaChuyenNganh;
                f.MaNienKhoa = sv.MaNienKhoa;
            }
            return f;
        }

        public void ChangeTextPaging(PagerOptions pagerOptions, string PageIndexParameterName)
        {
            pagerOptions.PageIndexParameterName = string.IsNullOrEmpty(PageIndexParameterName) ? "id" : PageIndexParameterName;
            pagerOptions.NextPageText = "Tiếp";
            pagerOptions.PrevPageText = "Lùi";
            pagerOptions.FirstPageText = "Đầu";
            pagerOptions.LastPageText = "Cuối";
            pagerOptions.CurrentPageNumberFormatString = "[{0}]";
        }
    }
}