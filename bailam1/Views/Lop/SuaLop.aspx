﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<bailam1.Models.FormModel.KHOA_DMKhoaForm>" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Sửa lớp..
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<% if( Session["Username"]==null)
           Response.Redirect("~/Admin/Index");
            %>
    <div class="modal-dialog" id="sualop">
    </div>
</asp:Content>
