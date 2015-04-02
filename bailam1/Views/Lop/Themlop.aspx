<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<bailam1.Models.FormModel.KHOA_DMKhoaForm>" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Themlop
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<<<<<<< HEAD
    <div class="modal-dialog" id="themlop">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title text-center" id="ModalTitle">
                    Thêm lớp</h4>
            </div>
            <div class="modal-body">
                <form id="form" class="form-horizontal">
                <div class="form-group">
                    <label for="Malop" class="col-sm-2 control-label">
                        Mã lớp</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="Malop" placeholder="---Nhập mã lớp---"
                            name="MaLop">
                    </div>
                </div>
                <div class="form-group">
                    <label for="Tenlop" class="col-sm-2 control-label">
                        Tên lớp</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="Tenlop" placeholder="---Nhập tên lớp---"
                            name="TenLop">
                    </div>
                </div>
                <div class="form-group">
                    <label for="Khoa" class="col-sm-2 control-label">
                        Khoa</label>
                    <div class="col-sm-10">
                        <%=Html.DropDownList("MaKhoa", Model.listKhoa)%>
=======

<div class="modal-dialog" id="themlop" >
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                            <h4 class="modal-title text-center" id="ModalTitle">Thêm lớp</h4>
>>>>>>> origin/master
                    </div>
                </div>
                <div class="form-group">
                    <label for="Chuyennganh" class="col-sm-2 control-label">
                        Chuyên ngành</label>
                    <div class="col-sm-10" id="Loadcbx">
                    </div>
<<<<<<< HEAD
=======
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal" onclick="goback()">Đóng</button>
                    <script language="javascript" type="text/javascript">
// <![CDATA[
                        function goback() {
                            history.back(-1);
                        }

// ]]>
        </script>
                    <button type="button" class="btn btn-primary" id="BtnAdd" onclick="Themlop()">Thêm</button>
>>>>>>> origin/master
                </div>
                <div class="form-group">
                    <label for="Name" class="col-sm-2 control-label">
                        Niên khóa</label>
                    <div class="col-sm-10">
                        <%=Html.DropDownList("MaNienKhoa", Model.listNienKhoa)%>
                    </div>
                </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" onclick="goback()">Đóng</button>
                <script language="javascript" type="text/javascript">
// <![CDATA[
                    function goback() {
                        history.back(-1);
                    }

// ]]>
                </script>
                <button type="button" class="btn btn-primary" id="BtnAdd" onclick="Themlop()">
                    Thêm</button>
            </div>
        </div>
    </div>
</asp:Content>
