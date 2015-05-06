<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<bailam1.Models.FormModel.DanhSachSinhVien>" %>

<%@ Import Namespace="Webdiyer.WebControls.Mvc" %>
<script>
    $('#Pager a').click(function () {
        if (this.href != "") {
            $.ajax({
                url: this.href,
                type: 'GET',
                cache: false,
                success: function (result) {
                    $('#LoadlstSinhVien').html(result);
                }
            });
            return false;
        }
        return false;
    });
</script>
<table width="100%" class="table table-hover" style="background-color:#fff">
        <tr>
            <th>
                Mã Sinh Viên
            </th>
            <th>
                Tên Sinh Viên
            </th>
            <th>
                Ngày Sinh
            </th>
            <th>
                Lớp
            </th>
        </tr>
    <% foreach (var item in Model.Page_lstSV) { %>
    
        <tr>
            <td>
                <%: item.MaSinhVien %>
            </td>
            <td>
                <%: item.TenSinhVien %>
            </td>
            <td>
                <%: item.NgaySinh %>
            </td>
            <td>
                <%: item.Lop%>
            </td>
        </tr>  
    
    <% } %>

    </table>
    <div style="text-align:center">
        <%
                    var pagerOptions = new PagerOptions();
                %>
                <div id="Pager">
                <% bailam1.Function.SinhVienBussiness sv = new bailam1.Function.SinhVienBussiness(); %>
                    <% sv.ChangeTextPaging(pagerOptions, "pageIndex"); %>
                    <%= Html.Pager(Model.Page_lstSV, pagerOptions)%></div>
                <%= Html.Hidden("pageIndex", Model.PageNumber)%>
    </div>