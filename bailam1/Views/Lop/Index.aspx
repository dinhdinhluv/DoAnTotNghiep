<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<bailam1.Models.FormModel.KHOA_DMKhoaForm>" %>

<%@ Import Namespace="Webdiyer.WebControls.Mvc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Quanlylop
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h3 class="panel-title text-center">
                QUẢN LÝ LỚP</h3>
        </div>
        <div class="panel-body">
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
                        <td>aksjgdaiugdaiuhdaiuwhd
                            <%: item.NgayThem.ToString("dd/MM/yyyy HH:ss") %>
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
        </div>
        <input class="btn btn-primary center-block" value="Thêm mới" id="btnadd" onclick="return btnadd_onclick('Lop/Themlop')" />
        <script language="javascript" type="text/javascript">
// <![CDATA[
            function btnadd_onclick(lo) {
                window.location = lo;
            }

// ]]>
        </script>
    </div>
</asp:Content>
