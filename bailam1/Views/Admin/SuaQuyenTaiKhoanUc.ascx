<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<bailam1.Models.FormModel.LoginForm>" %>
<script src="../../Scripts/JSAdmin_Login.js" type="text/javascript"></script>
<form action="" id="formsuaquyentk" class="form-horizontal">
<div class="form-group">
    <label for="TaiKhoan" class="col-sm-2 control-label">
        Tài khoản:</label>
    <div class="col-sm-10">
        <input type="hidden" name="Id" value="<%:Model.ID %>" />
        <input type="text" readonly="readonly" class="form-control" id="TaiKhoan" name="TaiKhoan"
            value="<%:Model.TaiKhoan %>" />
    </div>
</div>
<div class="form-group">
    <label for="MatKhau" class="col-sm-2 control-label">
        Mật khẩu:</label>
    <div class="col-sm-10">
        <input type="password" readonly="readonly" class="form-control" id="MatKhau" name="MatKhau"
            value="<%:Model.MatKhau %>" />
    </div>
</div>
<div class="form-group">
    <label for="MaLoaiTaiKhoan" class="col-sm-2 control-label">
        Chuyên ngành</label>
    <div class="col-sm-10">
        <%=Html.DropDownList("MaLoaiTaiKhoan", Model.listQuyenHan, new { style = "width:200px;" })%>
    </div>
</div>
</form>
