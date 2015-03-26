<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<DOANDEMO.Models.FormModel.KHOA_DMKhoaForm>" %>

<%=Html.DropDownList("MaChuyenNganh", Model.listChuyenNganh, new Dictionary<string, object> { { "onchange", "clickcbx()" } })%>