<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<bailam1.Models.FormModel.KHOA_DMKhoaForm>" %>
<%@ Import Namespace="Webdiyer.WebControls.Mvc" %>
<script>
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


</script>
<table class="table table-hover table-responsive">
    <thead>
        <tr>
            <th>
                Mã Lớp
            </th>
            <th>
                Tên lớp
            </th>
            <th>
                Khoa
            </th>
            <th>
                Chuyên ngành
            </th>
            <th>
                Niên khóa
            </th>
            <th>
            </th>
            <th>
            </th>
        </tr>
        <% foreach (var item in Model.PageListDanhSachLop)
           { %>
        <tr>
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
                <input type="button" class="btn btn-primary" value="Sửa" onclick="SuaTrenModal(<%= item.ID %>)" />
            </td>
            <td>
                <input type="button" class="btn btn-primary" value="Xóa" onclick="XoaLop(<%= item.ID %>)" />
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
    </thead>
    <tbody>
    </tbody>
</table>
</div> </div> </asp:Content> 