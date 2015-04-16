<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<bailam1.Models.FormModel.SinhVienForm>" %>
<%@ Import Namespace="Webdiyer.WebControls.Mvc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Thêm sinh viên
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script src="../../Content/js/bootstrap-datepicker.js" type="text/javascript"></script>
    <%--<script>
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
    <script src="../../Scripts/JSQLSV.js" type="text/javascript"></script>--%>
    <div class="modal-dialog" id="themsinhvien" style="width:1024px;">
    </div>

</asp:Content>
