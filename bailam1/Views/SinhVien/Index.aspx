<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<bailam1.Models.FormModel.SinhVienForm>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Danh sách sinh viên..
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script src="../../Scripts/JSQLSV.js" type="text/javascript"></script>
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h3 class="panel-title text-center"><strong>DANH MỤC SINH VIÊN</strong></h3>
        </div>
        <div class="panel-body">
            <select name='phanloai' id="cbxPhanLoaiSeach">
                <option value='0'>
                    Tìm theo mã sinh viên
                </option>
                <option value='1'>
                   Tìm theo mã lớp
                </option>
            </select>
            <input type="text" placeholder="--Tìm kiếm--" id="txtseach" class="form-control"onkeypress="javascript:if (event.keyCode==13) { ClickPhanLoaiSeach(); }"/>
            <%--<input id="btseach" type="button" value="Tìm" onclick="ClickPhanLoaiSeach();" />--%>
            <div id="LoadlstSinhVien"></div>
            
        </div>
        <center><input class="btn btn-primary" id="Button1" onclick="ThemModal();" type="button" value="Thêm Mới" /></center>
    </div>
    <div class="modal fade" id="themsinhvien">
        <div class="modal-dialog" style="width:1024px;">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title text-center" id="ModalTitle1">
                        Thêm sinh viên</h4>
                </div>
                <div class="modal-body">
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <div class="modal fade" id="suasinhvien">
        <div class="modal-dialog" style="width:1024px">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title text-center" id="ModalTitle">
                        Sửa sinh viên</h4>
                </div>
                <div class="modal-body">
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <script type="text/javascript" language="javascript">
        function ThemModal() {
            $.ajax({
                url: "/SinhVien/LoadThemSinhVien",
                type: "post",
                success: function (data) {
                    $("#themsinhvien").find(".modal-body").html(data);
                    $("#themsinhvien").modal("show");
                },
                error: function () {
                    alert("Lỗi");
                }
            });
        }
    </script>
</asp:Content>
