<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<bailam1.Models.FormModel.DM_MonHocForm>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script src="../../Scripts/JSQLMH.js" type="text/javascript"></script>
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
    <table style="width: 100%">
        <tr>
            <td id="ThemMonHoc">
                <input id="Button1" type="button" value="Thêm Môn" onclick="ThemMonHoc()" />
            </td>
            <td align=right>
                Hiển Thị:&nbsp;&nbsp;
                <select id="cbxTrangThai">
                    <option value="All"> Tất Cả </option>
                    <option value="True"> Bật </option>
                    <option value="False"> Tắt </option>
                </select>
            </td>
        </tr>
        </table>
    <div id="LoadDM_MonHoc"></div>
</asp:Content>
