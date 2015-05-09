<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<bailam1.Models.FormModel.DanhSachSinhVien>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script src="../../Scripts/JSPhanPhongThi.js" type="text/javascript"></script>
    <% if( Session["Username"]==null)
           Response.Redirect("~/Admin/Index");
            %>
<input id="Button1" type="button" value="Phân Phòng Thi Mới" onclick="ChuyenTrangPhanPhongThi()" />


</asp:Content>
