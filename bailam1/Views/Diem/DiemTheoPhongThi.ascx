<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<bailam1.Models.FormModel.DiemForm>" %>
<%@ Import Namespace="Webdiyer.WebControls.Mvc" %>
<script src="../../Scripts/JSdiem.js" type="text/javascript"></script>
<script type="text/javascript">
    function SuaDiem(id) {
        if ($("#txtDTB1_" + id).val() <= 10 && $("#txtDTB2_" + id).val() <= 10) {
            $.ajax({
                url: "/Diem/SuaDiem",
                type: "post",
                data: { ID: id, DTB1: $("#txtDTB1_" + id).val(), DTB2: $("#txtDTB2_" + id).val() },
                success: function (data) {
                    if (data == true) {
                        alert("Sửa thành công..!");
                        HuyClick(id);

                    }
                    else {
                        alert("Sửa không thành công..!");
                    }
                }
            });
        }
        else { alert("Điểm nhập vào không hợp lệ..!"); }
    }


    function ShowHide(id) {
        $("input[id^='Cancel']").trigger("click");

        $("#txtDTB1_" + id).attr("readonly", false);
        $("#txtDTB2_" + id).attr("readonly", false);
        if ($("#txtDTB1_" + id).val() < 5) {
            $("#txtDTB1_" + id).focus();
        }
        else { $("#txtDTB2_" + id).focus(); }
        $("#OK" + id).show();
        $("#Cancel" + id).show();
        $("#buttonshowhide" + id).hide();
    }

    function HuyClick(id) {
        $("#OK" + id).hide();
        $("#Cancel" + id).hide();
        $("#buttonshowhide" + id).show();
        $("#txtDTB1_" + id).attr("readonly", true);
        $("#txtDTB2_" + id).attr("readonly", true);
        if ($("#txtDTB1_" + id).val() == ""){
            $("#txtDTB1_" + id).val(0);
        }
        if($("#txtDTB2_" + id).val() == ""){
        $("#txtDTB2_" + id).val(0);
        }

        LoadDiem();
    }

    function KiemTraNhapSoTuNhien(e) {
        var theEvent = e || window.event;
        var key = theEvent.keyCode || theEvent.which;
        key = String.fromCharCode(key);
        var regex = /[0-9]|\./;
        if (e.keyCode != 8)
            if (!regex.test(key)) {
                theEvent.returnValue = false;
                if (theEvent.preventDefault) theEvent.preventDefault();
            }
    }
</script>
<center>
    <table width="100%" class="text-center">
        <tr>
            <th class="giuadong">
                STT
            </th>
            <th class="giuadong">
                Mã SV
            </th>
            <th class="giuadong">
                Tên SV
            </th>
            <th class="giuadong">
                Mã Lớp
            </th>
            <th class="giuadong">
                Điểm Trung Bình 1
            </th>
            <th class="giuadong">
                Điểm Trung Bình 2
            </th>
            <th style="width: 140px">
            </th>
        </tr>
        <% int stt = 1; %>
        <% foreach (var item in Model.DSDIEM)
           { %>
        <tr>
            <td>
                <%: stt %>
                <% stt++; %>
            </td>
            <td>
                <input id="ID" type="hidden" name="ID" value="<%: item.ID%>" />
                <%: item.MaSinhVien %>
            </td>
            <td>
                <%: item.TenSinhVien %>
            </td>
            <td>
                <%: item.MaLop %>
            </td>
            <td>
                <input readonly="readonly" id="txtDTB1_<%: item.ID %>" type="text" style="width: 45px;"
                    value="<%: item.DTB1 %>" onkeypress="javascript:return KiemTraNhapSoTuNhien(event);" />
            </td>
            <td>
                <input readonly="readonly" id="txtDTB2_<%: item.ID %>" type="text" style="width: 45px;"
                    value="<%: item.DTB2 %>" onkeypress="javascript:return KiemTraNhapSoTuNhien(event);" />
            </td>
            <td>
                <input type="button" value="Sửa" id="buttonshowhide<%: item.ID %>" onclick="ShowHide(<%: item.ID %>)" />
                <input style="display: none !important" id="OK<%: item.ID %>" type="button" value="Cập nhật"
                    onclick="SuaDiem(<%: item.ID %>)" />
                <input style="display: none !important" id="Cancel<%: item.ID %>" type="button" value="Hủy"
                    onclick="HuyClick(<%: item.ID %>)" />
            </td>
        </tr>
        <% } %>
    </table>
</center>
