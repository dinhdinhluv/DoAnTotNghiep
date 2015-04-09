<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<bailam1.Models.FormModel.SinhVienForm>" %>

<%=Html.DropDownList("Lop", Model.listLop, new { style = "width:220px;" })%>