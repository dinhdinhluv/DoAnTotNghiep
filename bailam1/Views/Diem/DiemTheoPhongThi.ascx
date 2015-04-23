<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<bailam1.Models.FormModel.DiemForm>" %>
<%@ Import Namespace="Webdiyer.WebControls.Mvc" %>
<script type="text/javascript">
//    $(document).ready(function () {
//        $("#buttonshowhide" + $('#ID').val()).click(function () {
//            alert($('#ID').val());
//            $("#divshowhide" + $('#ID').val()).slideToggle();
//                });
//    });

    function ShowHide(id) {
//        alert(id);
        $("#DTB" + id).attr("readonly", false);
        $("#DTBa" + id).attr("readonly", false);
        $("#DTB" + id).focus();
        $("#OK" + id).show();
        $("#Cancel" + id).show();
        $("#buttonshowhide" + id).hide();       
//        $("#divshowhide" + id).slideToggle();
    }

    function HuyClick(id) {
            $("#OK" + id).hide();
            $("#Cancel" + id).hide();
            $("#buttonshowhide" + id).show();
            $("#DTB" + id).attr("readonly", true);
            $("#DTBa" + id).attr("readonly", true);
    }

    function KiemTraNhapSoTuNhien(e) {
        var keypressed = null;
        if (window.event) {
            keypressed = window.event.keyCode;
        }
        else {
            keypressed = e.which;
        }

        if (keypressed < 48 || keypressed > 57) {
            if (keypressed == 8 || keypressed == 127) {
                return;
            }
            return false;
        }
    }
</script>
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
        <input readonly="readonly" id="DTB<%: item.ID %>" type="text" style="width:40px;" value="<%: item.DTB1 %>" onkeypress="javascript:return KiemTraNhapSoTuNhien(event);"/>

            <%--<%: item.DTB1 %>
            <div id="divshowhide<%: item.ID %>" style="display: none !important">
                <input style="width:40px; text-align:left;" type="text" value="<%: item.DTB1 %>" />
                <input id="OK" type="button" value="Cập nhật" />
                <input id="Cancel" type="button" value="Hủy" onclick="ShowHide()" />
            </div>--%>
        </td>
        <td>
        <input readonly="readonly" id="DTBa<%: item.ID %>" type="text" style="width:40px;" value="<%: item.DTB1 %>" onkeypress="javascript:return KiemTraNhapSoTuNhien(event);"/>
           <%-- <%: item.DTB2 %>
            <div id="DTB2" style="display: none;">
                <%: item.DTB2 %><input id="Sub" type="button" value="Sửa" /><input id="Can" type="button"
                    value="Hủy" /></div>--%>
        </td>
        <td>
            <input type="button" value="Sửa" id="buttonshowhide<%: item.ID %>" onclick="ShowHide(<%: item.ID %>)" />
            <input style="display: none !important" id="OK<%: item.ID %>" type="button" value="Cập nhật" />
            <input style="display: none !important" id="Cancel<%: item.ID %>" type="button" value="Hủy" onclick="HuyClick(<%: item.ID %>)" /> 
            <%--<%: Html.ActionLink("Sửa", "SuaDiem", new { id = item.ID })%>--%>
        </td>
    </tr>
    <% } %>
</table>
