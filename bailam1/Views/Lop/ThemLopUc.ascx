<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<bailam1.Models.FormModel.KHOA_DMKhoaForm>" %>
<script src="../../Scripts/test.js" type="text/javascript"></script>
<form id="formthem" class="form-horizontal">
<div class="form-group">
    <label for="MaLop" class="col-sm-2 control-label">
        Mã lớp</label>
    <div class="col-sm-10">
        <input type="text" class="form-control" id="Malop" placeholder="---Nhập mã lớp---"
            name="MaLop" style="width:200px;">
    </div>
</div>
<div class="form-group">
    <label for="TenLop" class="col-sm-2 control-label">
        Tên lớp</label>
    <div class="col-sm-10">
        <input type="text" class="form-control" id="Tenlop" placeholder="---Nhập tên lớp---"
            name="TenLop" style="width:200px;">
    </div>
</div>
<div class="form-group">
    <label for="MaKhoa" class="col-sm-2 control-label">
        Khoa</label>
    <div class="col-sm-10" id="makhoa">
         <%=Html.DropDownList("MaKhoa", Model.listKhoa, new { style = "width:200px;" })%>
    </div>
</div>
<div class="form-group">
    <label for="MaChuyenNganh" class="col-sm-2 control-label">
        Chuyên ngành</label>
    <div class="col-sm-10" id="Loadcbx" style="width:200px;">
    </div>
</div>
<div class="form-group">
    <label for="MaNienKhoa" class="col-sm-2 control-label">
        Niên khóa</label>
    <div class="col-sm-10" id="nienkhoa" style="width:200px;">
        <%=Html.DropDownList("MaNienKhoa", Model.listNienKhoa, new { style = "width:200px;" })%>
    </div>
</div>
</form>
