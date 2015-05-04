<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Đăng nhập hệ thống..</title>
    <link href="../../Content/css/bootstrap-cerulean.css" rel="stylesheet" type="text/css" />
    <link href="../../Content/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="../../Content/Site.css" rel="stylesheet" type="text/css" />
    <script src="../../Content/jquery/jquery-1.11.2.min.js" type="text/javascript"></script>
    <script src="../../Content/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="../../Content/js/bootstrap.min.js" type="text/javascript"></script>
    <script type="text/javascript">

        function DoLogin() {
            $.ajax({
                url: '/Admin/Login',
                type: "post",
                data: { Username: $("#Username").val(), Password: $("#Password").val() },
                success: function (data) {
                    if (data == true) {
                        //alert("Xin chào " + $("#Username").val());
                        location.assign("/SinhVien/Index");
                    }
                    else {
                        alert("Tài khoản hoặc mật khẩu không chính xác!");
                        $("#Username").val("");
                        $("#Password").val("");
                        $("#Username").focus();
                    }
                },
                error: function () {
                    return;
                }
            });
        };
    </script>
</head>
<body class="hinhnen">
    <div class="d1" style="text-align: center">
        <div class="logosona">
            <img src="../../img/cds.png" style="height: 200px;" /></div>
    </div>
    <div class="d2 row-fluid">
        <div class="dangnhap" align="center">
            <form action="" class="form-horizontal" method="post" style="margin-top: 70px;">
            <div class="input-prepend" title="Tài khoản đăng nhập">
                <span class="add-on" style="height: 28px;"><i class="icon-user"></i></span>
                <input class="input-large span10" name="Username" id="Username" type="text" placeholder="Tài khoản đăng nhập"
                    autofocus="" />
            </div>
            <div class="clearfix">
            </div>
            <br />
            <div class="input-prepend" title="Mật khẩu">
                <span class="add-on" style="height: 28px;"><i class="icon-lock"></i></span>
                <input class="input-large span10" name="Password" id="Password" type="password" placeholder="Mật khẩu"
                    onkeypress=" if (event.keyCode == 13) { return DoLogin(); } " />
            </div>
            <div class="clearfix">
            </div>
            <br />
            <br />
            <input type="button" class="btn btn-primary" onclick="DoLogin()" value="Đăng nhập"></button>
            </form>
        </div>
    </div>
</body>
</html>
