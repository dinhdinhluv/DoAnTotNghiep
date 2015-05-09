<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<bailam1.Models.FormModel.LoginForm>" %>

<%@ Import Namespace="Webdiyer.WebControls.Mvc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Danh sách tài khoản..
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script src="../../Scripts/JSAdmin_Login.js" type="text/javascript"></script>
    <% if( Session["Username"]==null)
           Response.Redirect("~/Admin/Index");
            %>
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h3 class="panel-title text-center">
                <strong>CẤP QUYỀN TÀI KHOẢN</strong></h3>
        </div>
        <div class="panel-body">
            <input id="txtTimKiemTK" onkeypress="javascript:if (event.keyCode==13) { PhanTrangQuyenAdmin(); }"
                placeholder="Nhập tài khoản.." type="text" />
        </div>

        <div class="panel-body" id="divPhanTrangQH">
        </div>
    </div>

        <div class="modal fade" id="suatk">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title text-center" id="ModalTitle">
                        Thay đổi quyền hạn</h4>
                </div>
                <div class="modal-body">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" id="BtnUpdate" onclick="SuaQuyenHanTaiKhoan()">
                        Sửa</button>
                    <button type="button" class="btn btn-default" onclick="$('#suatk').modal('hide');">
                        Đóng</button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->
    <script language="javascript" type="text/javascript">
        $(function () {
            PhanTrangQuyenAdmin();
        });
        </script>
</asp:Content>
