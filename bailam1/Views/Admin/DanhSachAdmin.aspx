<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<bailam1.Models.FormModel.LoginForm>" %>

<%@ Import Namespace="Webdiyer.WebControls.Mvc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Danh sách tài khoản..
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script src="../../Scripts/JSAdmin_Login.js" type="text/javascript"></script>
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h3 class="panel-title text-center">
                <strong>QUẢN LÝ TÀI KHOẢN</strong></h3>
        </div>
        <div class="panel-body">
            <input id="txtTimKiemTK" onkeypress="javascript:if (event.keyCode==13) { PhanTrangAdmin(); }"
                placeholder="Nhập tài khoản.." type="text" />
        </div>

        <div class="panel-body" id="divPhanTrang">
        </div>
        <input type="button" class="btn btn-primary center-block" value="Thêm tài khoản" onclick="ThemTrenModal()" />
    </div>

    <!-- /.modal -->
    <div class="modal fade" id="themtk">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title text-center" id="ModalTitle1">
                        Thêm tài khoản</h4>
                </div>
                <div class="modal-body">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" id="BtnAdd" onclick="ThemTaiKhoan()">
                        Thêm</button>
                    <button type="button" class="btn btn-default" onclick="$('#themtk').modal('hide');">
                        Đóng</button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->
        <div class="modal fade" id="suatk">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title text-center" id="ModalTitle">
                        Sửa thông tin lớp</h4>
                </div>
                <div class="modal-body">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" id="BtnUpdate" onclick="SuaTaiKhoan()">
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
            PhanTrangAdmin();
        });

        function ThemTrenModal() {
            $.ajax({
                url: "/Admin/ThemTaiKhoanAjax",
                type: "post",
                success: function (data) {
                    $("#themtk").find(".modal-body").html(data);
                    $("#themtk").modal("show");
                },
                error: function () {
                    alert("Lỗi");
                }
            });
        }
        </script>
</asp:Content>
