<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<bailam1.Models.FormModel.LoginForm>" %>
<script src="../../Scripts/test.js" type="text/javascript"></script>
<form action="" id="formthemtk" class="form-horizontal">
<div class="form-group">
    <label for="MaLop" class="col-sm-2 control-label">
        Tài khoản: </label>
    <div class="col-sm-10">
        <input type="text" class="form-control" id="TaiKhoan" placeholder="--Nhập tài khoản--"
            name="TaiKhoan" />
    </div>
</div>
<div class="form-group">
    <label for="TenLop" class="col-sm-2 control-label">
        Mật khẩu:</label>
    <div class="col-sm-10">
        <input type="password" class="form-control" id="MatKhau" placeholder="--Nhập mật khẩu--"
            name="MatKhau" />
    </div>
</div>
<div class="form-group">
    <label for="TenLop" class="col-sm-2 control-label">
        Nhập lại mật khẩu:</label>
    <div class="col-sm-10">
        <input type="password" class="form-control" id="reMatKhau" placeholder="--Nhập lại mật khẩu--"
            name="reMatKhau" />
    </div>
</div>
</form>
