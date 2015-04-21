<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<bailam1.Models.FormModel.DiemForm>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Điểm Theo Phòng Thi..
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script src="../../Scripts/JSdiem.js" type="text/javascript"></script>
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h3 class="panel-title text-center">
                <strong>QUẢN LÝ ĐIỂM THEO PHÒNG THI</strong></h3>
        </div>
        <div class="panel-body">
            <label for="MaPhongThi" class="col-sm-2 control-label">
                Phòng Thi</label>
            <div class="col-sm-10">
                <%=Html.DropDownList("MaPhongThi", Model.listPhongThi)%>
            </div>
            <label for="MaKhoa" class="col-sm-2 control-label">
                Khoa</label>
            <div class="col-sm-10">
                <%=Html.DropDownList("MaKhoa", Model.listKhoa)%>
            </div>
            <label for="MaMonHocChuyenNganh" class="col-sm-2 control-label">
                Môn thi</label>
            <div class="col-sm-10" id="MaMonHocTheoKhoa">
            </div>
            <div class="panel-body" id="LoadDiemTheoPhongMon"></div>
        </div>
    </div>
</asp:Content>
