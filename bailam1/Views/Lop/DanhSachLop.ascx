<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<bailam1.Models.FormModel.KHOA_DMKhoaForm>" %>
<%@ Import Namespace="Webdiyer.WebControls.Mvc" %>
<script type="text/javascript">
    $('#myPager a').click(function () {
        if (this.href != "") {
            $.ajax({
                url: this.href,
                type: 'GET',
                cache: false,
                success: function (result) {
                    $('#tdPhanTrang').html(result);
                }
            });
            return false;
        }
        return false;
    });

    function SuaTrenModal(id) {
        $.ajax({
            url: "/Lop/SuaLopAjax",
            data: { id: id },
            type: "get",
            success: function (data) {
                $("#sualop").find(".modal-body").html(data);
                $("#sualop").modal("show");
            },
            error: function () {
                alert("Lỗi");
            }
        });
    }

    $(function () {
        //bắt đc sự kiện khi modal đóng thì chạy $('#sualop').find('.modal-body').html('')
        $("#themlop").on("hide.bs.modal", function () {
            $('#themlop').find('.modal-body').html('');
        });
        $("#sualop").on("hide.bs.modal", function () {
            $('#sualop').find('.modal-body').html('');
        });
    });

</script>
<center>
<table class="table table-hover table-responsive giuadong" id="tbhienthilop">
   
        <tr>
            <th class="giuadong">
                Mã Lớp
            </th>
            <th class="giuadong">
                Tên lớp
            </th>
            <th class="giuadong">
                Khoa
            </th>
            <th class="giuadong">
                Chuyên ngành
            </th>
            <th class="giuadong">
                Niên khóa
            </th>
            <th class="giuadong">
            </th>
            <th class="giuadong">
            </th>
        </tr>
        <% foreach (var item in Model.PageListDanhSachLop)
           { %>
        <tr align="left">
            <td>
                <%: item.MaLop %>
            </td>
            <td>
                <%: item.TenLop %>
            </td>
            <td>
                <%: item.TenKhoa %>
            </td>
            <td>
                <%: item.TenChuyenNganh %>
            </td>
            <td>
                <%: item.ThoiGianNienKhoa %>
            </td>
            <td>
                <input id="vosualop" type="button" class="btn btn-primary" value="Sửa" onclick="SuaTrenModal(<%= item.ID %>)" />
            </td>
            <td>
                <input id="xoalop" type="button" class="btn btn-primary" value="Xóa" onclick="XoaLop(<%= item.ID %>)" />
            </td>
        </tr>
        <% } %>
        <tr>
            <td colspan="7">
                <%
                    var pagerOptions = new PagerOptions();
                %>
                <div id="myPager" style="text-align: center">
                    <% bailam1.Function.LopBussiness class1 = new bailam1.Function.LopBussiness(); %>
                    <% class1.ChangeTextPaging(pagerOptions, "pageIndex"); %>
                    <%= Html.Pager(Model.PageListDanhSachLop, pagerOptions)%></div>
                <%= Html.Hidden("pageIndex", Model.PageNumber)%>
            </td>
        </tr>
   

</table>
</center>