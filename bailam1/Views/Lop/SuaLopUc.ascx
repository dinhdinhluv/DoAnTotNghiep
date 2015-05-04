<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<bailam1.Models.FormModel.KHOA_DMKhoaForm>" %>
<script src="../../Scripts/test.js" type="text/javascript"></script>
<form action="" id="form" class="form-horizontal">
<div class="form-group">
    <label for="Malop" class="col-sm-2 control-label">
        Mã lớp</label>
    <div class="col-sm-10">
        <input type="hidden" name="Id" value="<%:Model.ID %>" />
        <input type="text" style="width:200px;" readonly="readonly" class="form-control" id="Malop" name="MaLop"
            value="<%:Model.MaLop %>" />
    </div>
</div>
<div class="form-group">
    <label for="Tenlop" class="col-sm-2 control-label">
        Tên lớp</label>
    <div class="col-sm-10">
        <input type="text" style="width:200px;" class="form-control" id="Tenlop" name="TenLop" value="<%:Model.TenLop %>" />
    </div>
</div>
<div class="form-group">
    <label for="MaKhoa" class="col-sm-2 control-label">
        Khoa</label>
    <div class="col-sm-10">
        <%=Html.DropDownList("MaKhoa", Model.listKhoa, new { style = "width:200px;" })%>
    </div>
</div>
<div class="form-group">
    <label for="MaChuyenNganh" class="col-sm-2 control-label">
        Chuyên ngành</label>
    <div class="col-sm-10" id="Loadcbx">
        <%=Html.DropDownList("MaChuyenNganh", Model.listChuyenNganh, new { style = "width:200px;" })%></div>
</div>
<div class="form-group">
    <label for="MaNienKhoa" class="col-sm-2 control-label">
        Niên khóa</label>
    <div class="col-sm-10">
        <%=Html.DropDownList("MaNienKhoa", Model.listNienKhoa, new { style = "width:200px;" })%>
    </div>
</div>
</form>
