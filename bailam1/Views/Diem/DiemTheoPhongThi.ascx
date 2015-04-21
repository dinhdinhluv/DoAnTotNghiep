<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<bailam1.Models.FormModel.DiemForm>" %>
<%@ Import Namespace="Webdiyer.WebControls.Mvc" %>
<table width="90%">
    <tr>
        <th>
            Mã SV
        </th>
        <th>
            Tên SV
        </th>
        <th>
            Mã Lớp
        </th>
        <th>
            Điểm Trung Bình 1
        </th>
        <th>
            Điểm Trung Bình 2
        </th>
        <th>
        </th>
    </tr>
    <% foreach (var item in Model.DSDIEM)
       { %>
    <tr>
        
        <td>
            <%: item.MaSinhVien %>
        </td>
        <td>
            <%: item.TenSinhVien %>
        </td>
        <td>
            <%: item.MaLop %>
        </td>
        <td>
            <%: item.DTB1 %>
        </td>
        <td>
            <%: item.DTB2 %>
        </td>
        <td>
            <%: Html.ActionLink("Xóa", "XoaDiem", new { id = item.ID })%>
        </td>
    </tr>
    <% } %>
</table>
