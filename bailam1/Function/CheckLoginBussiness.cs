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
    public class CheckLoginBussiness
    {
        readonly DataQLSVDataContext _QLSVData = new DataQLSVDataContext();
        
        public LoginForm getAllTK()
        {
            var tk = new LoginForm();
            var lstTK = _QLSVData.TAIKHOANs.ToList();
            var tkf = new List<LoginForm>();
            foreach (var i in lstTK)
            {
                LoginForm a = new LoginForm();
                a.ID = i.ID;
                a.TaiKhoan = i.TaiKhoan1;
                a.MatKhau = i.MatKhau;
                a.MaLoaiTaiKhoan = i.MaLoaiTK;
                var c = _QLSVData.DM_LOAITAIKHOANs.FirstOrDefault(b => b.MaLoaiTK == i.MaLoaiTK);
                if (c != null)
                {
                    a.TenLoaiTaiKhoan = c.TenLoaiTK;
                }
                else { a.TenLoaiTaiKhoan = ""; }

                tkf.Add(a);
            }
            tk.DSTK = tkf;
            return tk;
        }

        public bool ThemTK(LoginForm DMTK)
        {
            var lstTK = new TAIKHOAN();
            if (DMTK.TaiKhoan != "")
            {
                var lst = _QLSVData.TAIKHOANs.FirstOrDefault(a => a.TaiKhoan1.ToLower() == DMTK.TaiKhoan.ToLower());
                if (lst == null)
                {
                    lstTK.TaiKhoan1 = DMTK.TaiKhoan;
                    lstTK.MatKhau = DMTK.MatKhau;
                    

                    _QLSVData.TAIKHOANs.InsertOnSubmit(lstTK);
                    _QLSVData.SubmitChanges();
                    return true;
                }
                else
                {
                    return false;
                }
            }
            return false;
        }

        public bool SuaTK(LoginForm DMTK)
        {
            var Tk = _QLSVData.TAIKHOANs.FirstOrDefault(t => t.ID == DMTK.ID);
            if (Tk != null)
            {
                Tk.TaiKhoan1 = DMTK.TaiKhoan;
                Tk.MatKhau = DMTK.MatKhauMoi;
                

                try
                {
                    _QLSVData.SubmitChanges();
                    return true;
                }
                catch
                {
                    return false;
                }
            }
            return false;
        }

        public bool XoaTK(int idTK)
        {
            var tk = _QLSVData.TAIKHOANs.FirstOrDefault(t => t.ID == idTK);
            if (tk != null)
            {
                try
                {
                    _QLSVData.TAIKHOANs.DeleteOnSubmit(tk);
                    _QLSVData.SubmitChanges();
                    return true;
                }
                catch (Exception)
                {
                    return false;
                }
            }
            return false;
        }



        public LoginForm GetTaiKhoanTheoID(int ID)
        {
            var f = new LoginForm();
            var tk = _QLSVData.TAIKHOANs.FirstOrDefault(t => t.ID == ID);
            if (tk != null)
            {
                f.ID = tk.ID;
                f.TaiKhoan = tk.TaiKhoan1;
                f.MatKhau = tk.MatKhau;
                f.MaLoaiTaiKhoan = tk.MaLoaiTK ;
                var e = _QLSVData.DM_LOAITAIKHOANs.FirstOrDefault(n=>n.MaLoaiTK==tk.MaLoaiTK);
                if (e != null)
                {
                    f.TenLoaiTaiKhoan = e.TenLoaiTK;
                }
                else { f.TenLoaiTaiKhoan = ""; }
            }
            return f;
        }

        public bool CheckLogin(string Username, string Password)
        {
            var lstTK = _QLSVData.TAIKHOANs.ToList();
            if (Username != null && Password != null)
            {
                foreach (var i in lstTK)
                {
                    if (i.TaiKhoan1.Trim() == Username.Trim() && i.MatKhau.Trim() == Password.Trim())
                    {
                        return true;
                    }
                    else
                    {
                        return false;
                    }
                }
            }
            else if (Username == null || Password == null)
            {
                return false;
            }
            else
                return false;
            return false;
        }
    }
}