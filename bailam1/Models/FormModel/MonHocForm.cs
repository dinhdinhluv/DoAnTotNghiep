using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Webdiyer.WebControls.Mvc;

namespace bailam1.Models.FormModel
{
    public class DM_MonHocForm
    {
        public string MaMonHoc { get; set; }
        public string TenMonHoc { get; set; }
        public string TrangThai { get; set; }
    }

    public class DanhSachDM_MonHoc
    {
        public List<DM_MonHocForm> lstDM_MonHoc { get; set; }
        public int PageNumber { get; set; }
        public PagedList<DM_MonHocForm> Page_lstDM_MonHoc { get; set; }
    }
}