<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<bailam1.Models.FormModel.LoginForm>" %>
<script src="../../Scripts/JSAdmin_Login.js" type="text/javascript"></script>
<form action="" id="formsuatk" class="form-horizontal">
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
        <input type="password" readonly="readonly" class="form-control" id="MatKhau" name="MatKhau" value="<%:Model.MatKhau %>" />
    </div>
</div>
<div class="form-group">
    <label for="MatKhau" class="col-sm-2 control-label">
        Mật khẩu mới:</label>
    <div class="col-sm-10">
        <input type="password" class="form-control" id="MatKhauMoi" name="MatKhauMoi" value="" />
    </div>
</div>
<div class="form-group">
    <label for="MatKhau" class="col-sm-2 control-label">
        Nhập lại mật khẩu mới:</label>
    <div class="col-sm-10">
        <input type="password" class="form-control" id="reMatKhauMoi" name="reMatKhauMoi" value="" />
    </div>
</div>
</form>
