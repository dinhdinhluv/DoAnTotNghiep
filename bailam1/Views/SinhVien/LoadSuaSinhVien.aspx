﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<bailam1.Models.FormModel.SinhVienForm>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    LoadSinhVien
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
    $(document).ready(function () {
        $("#txtMaSinhVien").attr("disabled", true);
        $("#Lop").attr("disabled", true);
        $("#NienKhoa").attr("disabled", true);
        $("#Khoa").attr("disabled", true);
    });
</script>
    <script src="../../Scripts/JSQLSV.js" type="text/javascript"></script>
    <% if( Session["Username"]==null)
           Response.Redirect("~/Admin/Index");
            %>
    <div class="modal-dialog" id="suasinhvien" style="width:1024px;">
    </div>
</asp:Content>

