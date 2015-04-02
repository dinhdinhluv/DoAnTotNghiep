<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<bailam1.Models.FormModel.KHOA_DMKhoaForm>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    SuaLop
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="modal-dialog" id="sualop">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title text-center" id="ModalTitle">
                    Sửa thông tin lớp</h4>
            </div>
            <div class="modal-body">
                <form id="form" class="form-horizontal">
                <div class="form-group">
                    <label for="Malop" class="col-sm-2 control-label">
                        Mã lớp</label>
                    <div class="col-sm-10">
                        <input type="hidden" name="Id" value="<%:Model.ID %>" />
                        <input type="text" class="form-control" id="Malop" name="MaLop" value="<%:Model.MaLop %>">
                    </div>
                </div>
                <div class="form-group">
                    <label for="Tenlop" class="col-sm-2 control-label">
                        Tên lớp</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="Tenlop" name="TenLop" value="<%:Model.TenLop %>">
                    </div>
                </div>
                <div class="form-group">
                    <label for="Khoa" class="col-sm-2 control-label">
                        Khoa</label>
                    <div class="col-sm-10">
                        <%=Html.DropDownList("MaKhoa", Model.listKhoa)%>
                    </div>
                </div>
                <div class="form-group">
                    <label for="Chuyennganh" class="col-sm-2 control-label">
                        Chuyên ngành</label>
                    <div class="col-sm-10" id="Loadcbx">
                        <%=Html.DropDownList("MaChuyenNganh", Model.listChuyenNganh)%>
                    </div>
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
                <button type="button" class="btn btn-default" onclick="goback()">
                    Đóng</button>
                
                <script language="javascript" type="text/javascript">
// <![CDATA[
                    function goback() {
                        history.back(-1);
                    }

// ]]>
                </script>
                <button type="button" class="btn btn-primary" id="BtnUpdate" onclick="SuaLop()">
                    Sửa</button>
            </div>
        </div>
    </div>
</asp:Content>
