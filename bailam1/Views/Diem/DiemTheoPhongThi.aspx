<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<bailam1.Models.FormModel.DiemForm>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Điểm Theo Phòng Thi..
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script src="../../Scripts/JSdiem.js" type="text/javascript"></script>
    <% if( Session["Username"]==null)
           Response.Redirect("~/Admin/Index");
            %>
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h3 class="panel-title text-center">
                <strong>QUẢN LÝ ĐIỂM THEO PHÒNG THI</strong></h3>
        </div>
        <div class="panel-body">
            <label for="MaPhongThi" class="col-sm-2 control-label">
                Phòng Thi</label>
            <div class="col-sm-10">
                <%=Html.DropDownList("MaPhongThi", Model.listPhongThi, new { style = "width:240px;", autocomplete="off" })%>
            </div>
            <label for="MaKhoa" class="col-sm-2 control-label" style="padding-top:10px;">
                Khoa</label>
            <div class="col-sm-10" style="padding-top:5px;">
                <%=Html.DropDownList("MaKhoa", Model.listKhoa, new { style = "width:240px;", autocomplete="off"  })%>
            </div>
            <label for="MaMonHocChuyenNganh" class="col-sm-2 control-label" style="padding-top:15px;">
                Môn thi</label>
            <div class="col-sm-10" id="MaMonHocTheoKhoa" style="padding-top:5px;">
            </div>
            <div class="panel-body" id="LoadDiemTheoPhongMon"></div>
        </div>
    </div>
</asp:Content>
