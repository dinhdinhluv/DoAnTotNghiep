<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<bailam1.Models.FormModel.SinhVienForm>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    LoadSinhVien
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
    $(document).ready(function () {
        $("#txtMaSinhVien").attr("disabled", true);
        $("#Lop").attr("disabled", true);
        $("#NienKhoa").attr("disabled", true);
        $("#Khoa").attr("disabled", true);
    });
</script>
    <script src="../../Scripts/JSQLSV.js" type="text/javascript"></script>
    <div class="modal-dialog" id="suasinhvien">
    </div>
</asp:Content>

