<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<bailam1.Models.FormModel.SinhVienForm>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    LoadSinhVien
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script>
    $(document).ready(function () {
        $("#txtMaSinhVien").attr("disabled", true);
        $("#Lop").attr("disabled", true);
        $("#NienKhoa").attr("disabled", true);
        $("#Khoa").attr("disabled", true);
    });
    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('#blah')
                        .attr('src', e.target.result)
                        .width(160)
                        .height(240);
            };

            reader.readAsDataURL(input.files[0]);
        }
    }
</script>
    <script src="../../Scripts/JSQLSV.js" type="text/javascript"></script>
    <div class="modal-dialog" id="suasinhvien">
    </div>
</asp:Content>

