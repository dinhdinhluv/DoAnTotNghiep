﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using bailam1.Models.FormModel;
using bailam1.Models.LinQ;
using Webdiyer.WebControls.Mvc;
namespace bailam1.Function
{
    public class DiemBussiness
    {
        readonly DataQLSVDataContext _QLSVData = new DataQLSVDataContext(); 

        public DiemForm getDiemTheoMaPhongvMaMon(int MaPhongThi, int MaMonTheoChuyenNganh)
        {
            var t = new DiemForm();
            var lstDiem = _QLSVData.PHANPHONGTHIs.ToList().Where(f=>f.MaMonHocTheoChuyenNganh==MaMonTheoChuyenNganh && f.MaPhongThi==MaPhongThi);
            var df = new List<DiemForm>();
            foreach (var i in lstDiem)
            {
                DiemForm d = new DiemForm();
                d.MaSinhVien = i.MaSV;   //mã sv
                var w = _QLSVData.SINHVIENs.FirstOrDefault(m => m.MaSinhVien == i.MaSV);
                d.TenSinhVien = w.TenSinhVien; //tên sv
                d.MaLop = w.MaLop; //ma lop


                var ss = _QLSVData.DIEM_TBMONs.FirstOrDefault(a => a.MaSinhVien == i.MaSV);
                d.DTB1 = ss.DiemTBLan1.ToString(); //diem lan 1
                d.DTB2 = ss.DiemTBLan2.ToString(); //diem lan 2

                var p = _QLSVData.DM_KHOAs.FirstOrDefault(h => h.MaKhoa == w.MaKhoa);
                d.MaKhoa = w.MaKhoa; //ma khoa
                d.TenKhoa = p.TenKhoa; // ten khoa

                var n = _QLSVData.PHANMON_THEO_CHUYENNGANHs.FirstOrDefault(s => s.MaMonTheoChuyenNganh == i.MaMonHocTheoChuyenNganh);
                var monhoc = _QLSVData.DM_MONHOCs.FirstOrDefault(mh => mh.MaMonHoc == n.MaMonHoc);
                d.MaMonHocChuyenNganh=n.MaMonTheoChuyenNganh;
                d.TenMonHocChuyenNganh = monhoc.TenMonHoc;

                df.Add(d);
            }
            t.DSDIEM = df;
            return t;
        }
    }
}