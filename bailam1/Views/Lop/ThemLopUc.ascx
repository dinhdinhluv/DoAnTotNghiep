<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<bailam1.Models.FormModel.KHOA_DMKhoaForm>" %>
<script src="../../Scripts/test.js" type="text/javascript"></script>
<form id="formthem" class="form-horizontal">
<div class="form-group">
    <label for="MaLop" class="col-sm-2 control-label">
        Mã lớp</label>
    <div class="col-sm-10">
        <input type="text" class="form-control" id="Malop" placeholder="---Nhập mã lớp---"
            name="MaLop">
    </div>
</div>
<div class="form-group">
    <label for="TenLop" class="col-sm-2 control-label">
        Tên lớp</label>
    <div class="col-sm-10">
        <input type="text" class="form-control" id="Tenlop" placeholder="---Nhập tên lớp---"
            name="TenLop">
    </div>
</div>
<div class="form-group">
    <label for="MaKhoa" class="col-sm-2 control-label">
        Khoa</label>
    <div class="col-sm-10">
        <%=Html.DropDownList("MaKhoa", Model.listKhoa)%>
    </div>
</div>
<div class="form-group">
    <label for="MaChuyenNganh" class="col-sm-2 control-label">
        Chuyên ngành</label>
    <div class="col-sm-10" id="Loadcbx">
        <%=Html.DropDownList("MaChuyenNganh", Model.listChuyenNganh)%></div>
</div>
<div class="form-group">
    <label for="MaNienKhoa" class="col-sm-2 control-label">
        Niên khóa</label>
    <div class="col-sm-10">
        <%=Html.DropDownList("MaNienKhoa", Model.listNienKhoa)%>
    </div>
</div>
</form>
