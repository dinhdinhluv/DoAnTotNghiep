<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<DOANDEMO.Models.FormModel.KHOA_DMKhoaForm>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Sửa lớp
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <center>
        <h2>
            Sửa Thông Tin Lớp</h2>
        <form action="" method="post">
        <input type="hidden" name="Id" value="<%:Model.ID %>" />
        <table>
            <tr>
                <td>
                    Mã lớp:
                </td>
                <td>
                    <input type="text" name="MaLop" value="<%:Model.MaLop %>" />
                </td>
            </tr>
            <tr>
                <td>
                    Tên lớp:
                </td>
                <td>
                    <input type="text" name="TenLop" value="<%:Model.TenLop %>" />
                </td>
            </tr>
            <tr>
                <td>
                    Khoa:
                </td>
                <td>
                    <%=Html.DropDownList("MaKhoa", Model.listKhoa)%>
                </td>
            </tr>
            <tr>
                <td>
                    Chuyên ngành:
                </td>
                <td>
                    <%=Html.DropDownList("MaChuyenNganh", Model.listChuyenNganh)%>
                </td>
            </tr>
            <tr>
                <td>
                    Niên khóa:
                </td>
                <td>
                    <%=Html.DropDownList("MaNienKhoa", Model.listNienKhoa)%>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="button" onclick="SuaLop()" value="Lưu" />
                </td>
            </tr>
        </table>
        </form>
    </center>
</asp:Content>
