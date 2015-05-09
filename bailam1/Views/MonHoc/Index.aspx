<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<bailam1.Models.FormModel.DM_MonHocForm>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script src="../../Scripts/JSQLMH.js" type="text/javascript"></script>
    <% if( Session["Username"]==null)
           Response.Redirect("~/Admin/Index");
            %>
    <div class="modal fade" id="themmonhoc">
        <div class="modal-dialog" style="width:400px;">
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
                <strong>QUẢN LÝ MÔN HỌC</strong></h3>
        </div>
        <div class="panel-body">
                Hiển Thị:&nbsp;&nbsp;
                <select id="cbxTrangThai">
                    <option value="All"> Tất Cả </option>
                    <option value="True"> Bật </option>
                    <option value="False"> Tắt </option>
                </select>
        </div>
    <div id="LoadDM_MonHoc"></div>
        <div id="ThemMocHoc" class="text-center">
            <input class="btn btn-primary" id="Button1" type="button" value="Thêm Môn" onclick="ThemMonHoc()" />
        </div>
    </div>
</asp:Content>
