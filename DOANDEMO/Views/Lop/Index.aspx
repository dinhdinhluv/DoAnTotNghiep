<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<DOANDEMO.Models.FormModel.KHOA_DMKhoaForm>" %>
<%@ Import Namespace="Webdiyer.WebControls.Mvc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Lớp
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<center>
<table>
<tr><td><%: Html.ActionLink("Thêm mới lớp", "ThemLop") %></td></tr>
        <tr>
            <th>Mã Lớp</th>
            <th>Tên lớp</th>
            <th>Khoa</th>
            <th>Chuyên ngành</th>
            <th>Niên khóa</th>
            <th></th>
        </tr>

    <% foreach (var item in Model.PageListDanhSachLop) { %>
        <tr><td><%: item.MaLop %></td>
        <td><%: item.TenLop %></td>
        <td><%: item.TenKhoa %></td>
        <td><%: item.TenChuyenNganh %></td>
        <td><%: item.ThoiGianNienKhoa %></td>
            <td>
                <%: Html.ActionLink("Sửa", "SuaLop", new { id = item.ID })%> |
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
                    <% DOANDEMO.Function.LopBussiness class1 = new DOANDEMO.Function.LopBussiness(); %>
                    <% class1.ChangeTextPaging(pagerOptions, "pageIndex"); %>
                    <%= Html.Pager(Model.PageListDanhSachLop, pagerOptions)%></div>
                <%= Html.Hidden("pageIndex", Model.PageNumber)%>
            </td>
        </tr>
    </table>
    </center>
    <%--<%=Html.DropDownList("MaDanToc", Model.listDanToc)%>
    <%=Html.DropDownList("MaTonGiao", Model.listTonGiao)%>
    <%=Html.DropDownList("MaQueQuan", Model.listQueQuan)%>--%>
    
</asp:Content>
