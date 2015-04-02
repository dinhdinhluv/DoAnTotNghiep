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

</script>
<table class="table table-hover table-responsive text-center">
            
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
                            Ngày thêm
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
                            <%: item.NgayThem.ToString("dd/MM/yyyy HH:mm") %>
                        </td>
                        <td>
                            <%: Html.ActionLink("Sửa", "SuaLop", new { id = item.ID })%>
                        </td>
                        <td>
                            <%: Html.ActionLink("Xóa", "XoaLop", new { id = item.ID })%>
                        </td>
                    </tr>
                    <% } %>
                    <tr>
                        <td colspan="8">
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
        </div>
        <script language="javascript" type="text/javascript">
// <![CDATA[
            function btnadd_onclick(lo) {
                window.location = lo;
            }
// ]]>
        </script>
    </div>
</asp:Content>
