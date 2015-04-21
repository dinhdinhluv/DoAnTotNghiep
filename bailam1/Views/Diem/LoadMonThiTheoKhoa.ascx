<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<bailam1.Models.FormModel.DiemForm>" %>
<script type="text/javascript">
    $("#MaMonHocChuyenNganh").change(function () {
        if ($("#MaPhongThi").val() == "") {
            alert("Chọn phòng thi");
        }
        else {
            LoadDiem($("#MaPhongThi").val(), $("#MaMonHocChuyenNganh").val());
        }
    });

</script>
<%=Html.DropDownList("MaMonHocChuyenNganh", Model.listMonChuyenNganh)%>