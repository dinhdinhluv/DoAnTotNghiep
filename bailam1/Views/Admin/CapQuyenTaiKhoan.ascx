<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<bailam1.Models.FormModel.LoginForm>" %>
<%@ Import Namespace="Webdiyer.WebControls.Mvc" %>
<script type="text/javascript">
    $('#myPager a').click(function () {
        if (this.href != "") {
            $.ajax({
                url: this.href,
                type: 'GET',
                cache: false,
                success: function (result) {
                    $('#divPhanTrang').html(result);
                }
            });
            return false;
        }
        return false;
    });

    function SuaTrenModal(id) {
        $.ajax({
            url: "/Admin/SuaQuyenTaiKhoanAjax",
            data: { id: id },
            type: "get",
            success: function (data) {
                $("#suatk").find(".modal-body").html(data);
                $("#suatk").modal("show");
            },
            error: function () {
                alert("Lỗi");
            }
        });
    }

    $(function () {
        //bắt đc sự kiện khi modal đóng thì chạy $('#sualop').find('.modal-body').html('')
        $("#suatk").on("hide.bs.modal", function () {
            $('#suatk').find('.modal-body').html('');
        });
    });
</script>
<center>
    <table class="table table-hover" width="100%" style="text-align:left">
        <tr>
            <th>
                ID
            </th>
            <th>
                Username
            </th>
            <th>
                Password
            </th>
            <th>
                Cấp độ tài khoản
            </th>
            <th style="width:275px;">
            </th>
        </tr>
        <% foreach (var item in Model.PageListDanhSachAdmin)
           { %>
        <tr>
            <td>
                <%: item.ID %>
            </td>
            <td>
                <%: item.TaiKhoan %>
            </td>
            <td>
                <%: item.MatKhau %>
            </td>
            <td>
                <%: item.TenLoaiTaiKhoan %>
            </td>
            <td>
                 <input type="button" class="btn btn-primary center-block" value="Sửa quyền hạn" onclick="SuaTrenModal(<%= item.ID %>)" />
            </td>
        </tr>
        <% } %>
    </table>
</center>
<div>
    <%
        var pagerOptions = new PagerOptions();
    %>
    <div id="myPager" style="text-align: center">
        <% bailam1.Function.LopBussiness class1 = new bailam1.Function.LopBussiness(); %>
        <% class1.ChangeTextPaging(pagerOptions, "pageIndex"); %>
        <%= Html.Pager(Model.PageListDanhSachAdmin, pagerOptions)%></div>
    <%= Html.Hidden("pageIndex", Model.PageNumber)%>
</div>
