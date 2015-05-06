<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<bailam1.Models.FormModel.KHOA_DMKhoaForm>" %>

<%@ Import Namespace="Webdiyer.WebControls.Mvc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Danh sách lớp..
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script src="../../Scripts/test.js" type="text/javascript"></script>
    <% if( Session["Username"]==null)
           Response.Redirect("~/Admin/Index");
            %>
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h3 class="panel-title text-center">
                <strong>QUẢN LÝ LỚP</strong></h3>
        </div>
        <div class="panel-body">
            <input id="txtTimKiem" onkeypress="javascript:if (event.keyCode==13) { PhanTrang(); }"
                placeholder="Nhập từ khóa.." type="text" />
        </div>
        <div class="panel-body" id="tdPhanTrang">
        </div>
        <input id="vothemlop" type="button" class="btn btn-primary center-block" value="Thêm mới" onclick="ThemTrenModal()" />
    </div>
    <div class="modal fade" id="sualop">
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
                    <button type="button" class="btn btn-primary" id="BtnUpdate" onclick="SuaLop()">
                        Sửa</button>
                    <button type="button" class="btn btn-default"  onclick="$('#sualop').modal('hide');">
                        Đóng</button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->
    <div class="modal fade" id="themlop">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title text-center" id="ModalTitle1">
                        Thêm lớp</h4>
                </div>
                <div class="modal-body">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" id="BtnAdd" onclick="ThemLop()">
                        Thêm</button>
                    <button type="button" class="btn btn-default" id="BtnDong" onclick="$('#themlop').modal('hide');">
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
            PhanTrang();
        });

        function ThemTrenModal() {
            $.ajax({
                url: "/Lop/ThemLopAjax",
                type: "get",
                success: function (data) {
                    $("#themlop").find(".modal-body").html(data);
                    $("#themlop").modal("show");
                },
                error: function () {
                    alert("Lỗi");
                }
            });
        }
    </script>
</asp:Content>
