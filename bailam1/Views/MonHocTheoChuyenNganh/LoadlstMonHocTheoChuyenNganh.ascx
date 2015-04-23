<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<bailam1.Models.FormModel.DanhSachMonHocTheoChuyenNganh>" %>
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
<table width="100%" class="table table-hover" >
        <tr>
            <th>
                Mã Môn Chuyên Ngành
            </th>
            <th>
                Tên Môn Chuyên Ngành
            </th>
            <th>
                Chuyên Ngành
            </th>
            <th>
                Học Kỳ
            </th>
            <th>
                Niên Khóa
            </th>
            <th>
                DVHT
            </th>
        </tr>
    <% foreach (var item in Model.Page_lstMonHocTheoChuyenNganh)
       { %>
    
        <tr>
            <td>
                <%: item.MaMonTheoChuyenNganh %>
            </td>
            <td>
                <%: item.MonHoc %>
            </td>
            <td>
                <%: item.ChuyenNganh %>
            </td>
            <td>
                <%: item.HocKy %>
            </td>
            <td>
                <%: item.NienKhoa %>
            </td>
            <td>
                <%: item.DVHT %>
            </td>
        </tr>  
    
    <% } %>

    </table>
    <div style="text-align:center">
        <%
                    var pagerOptions = new PagerOptions();
                %>
                <div id="Pager">
                <% bailam1.Function.MonHocTheoChuyenNganhBussiness MonHocTheoChuyenNganh = new bailam1.Function.MonHocTheoChuyenNganhBussiness(); %>
                    <% MonHocTheoChuyenNganh.ChangeTextPaging(pagerOptions, "pageIndex"); %>
                    <%= Html.Pager(Model.Page_lstMonHocTheoChuyenNganh, pagerOptions)%></div>
                <%= Html.Hidden("pageIndex", Model.PageNumber)%>
    </div>