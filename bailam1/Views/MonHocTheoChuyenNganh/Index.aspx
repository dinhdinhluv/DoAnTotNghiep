<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<bailam1.Models.FormModel.MonHocTheoChuyenNganhForm>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script src="../../Scripts/JSPhanMon.js" type="text/javascript"></script>

    <div class="modal fade" id="loadthemmonchuyennganh">
        <div class="modal-dialog" style="width:600px;">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title text-center" id="ModalTitle1">
                        Thêm Môn Học</h4>
                </div>
                <div class="modal-body">
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
     <div class="panel panel-primary">
        <div class="panel-heading">
            <h3 class="panel-title text-center">
                <strong>PHÂN MÔN THEO CHUYÊN NGÀNH</strong></h3>
        </div>
        <div class="panel-body">
            <%=Html.DropDownList("cbxKhoa", Model.listKhoa, new { style = "width:200px;" })%> <input class="btn btn-primary" id="Button1" type="button" value="Phân Môn Chuyên Ngành Mới" onclick="LoadThemMonChuyenNganh()" />
        </div>
        <div id="lstPhanMon"></div>
        <input id="vothemlop" type="button" class="btn btn-primary center-block" value="Thêm mới" onclick="ThemTrenModal()" />
    </div>
    
    
</asp:Content>
