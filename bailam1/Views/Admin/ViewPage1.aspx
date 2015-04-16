<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {

    }
</script>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title></title>
        <link href="../../Content/css/bootstrap-cerulean.css" rel="stylesheet" type="text/css" />
    <link href="../../Content/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="../../Content/Site.css" rel="stylesheet" type="text/css" />
    <script src="../../Content/jquery/jquery-1.11.2.min.js" type="text/javascript"></script>
    <script src="../../Content/js/bootstrap.min.js" type="text/javascript"></script>
   <%-- <script src="../../Content/js/bootstrap.min.js" type="text/javascript"></script>--%>
</head>
<body class="hinhnen">
    <div class="d1" style="text-align:center">
        <div class="logosona"><img src="../../img/cds.png" style="padding-top:10px"></div>
    </div>
    <div class="d2 row-fluid">
    <div class="dangnhap" align="center">
        <form class="form-horizontal" method="post" style="margin-top:100px;">
                <div class="input-prepend" title="Tài khoản đăng nhập" >
                    <span class="add-on" style="height:27px;">
                        <i class="icon-user"></i>
                    </span>
                    <input class="input-large span10" name="Username" id="Username" type="text" placeholder="Tài Khoản Đăng Nhập" />
                </div>
                <br />
                <div class="clearfix"></div>
                <div class="input-prepend" title="Mật khẩu">
                    <span class="add-on" style="height:27px;">
                        <i class="icon-lock"></i>
                    </span>
                    <input class="input-large span10" name="Password" id="Password" type="password" placeholder="Mật khẩu" />
                </div>
                <div class="clearfix"></div>
                <br />
                <div class="input-prepend">
                    <p class="span5" align="center">
                        <button class="btn btn-primary">Đăng nhập</button>
                    </p> 
                </div>
        </form>
    </div>
    </div>
</body>
</html>

