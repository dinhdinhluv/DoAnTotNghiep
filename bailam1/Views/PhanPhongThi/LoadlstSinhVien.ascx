<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<bailam1.Models.FormModel.DanhSachSinhVien>" %>
<%@ Import Namespace="Webdiyer.WebControls.Mvc" %>
<script src="../../Scripts/JSPhanPhongThi.js" type="text/javascript"></script>
<script>
    $('#Pager a').click(function () {
        if (this.href != "") {
            $.ajax({
                url: this.href,
                type: 'GET',
                cache: false,
                success: function (result) {
                    $('#LoadlstSinhVien').html(result);
                }
            });
            return false;
        }
        return false;
    });


    function ThucHienThemListSV() {
        var c_value = "";
        var i;
        for (i = 0; i < document.form_ChonSV.coffee.length; i++) {
            if(document.form_ChonSV.coffee[i].checked)
            {
                c_value += (c_value ? ',' : '') + document.form_ChonSV.coffee[i].value;
            }
        }
        alert(c_value);
        $.ajax({
            url: '/PhanPhongThi/ThemlistSV/',
            data: { Chuoi: c_value },
            success: function (result) {
            },
            error: function (jqXhr, status, err) {
                alert("Có lỗi trong quá trình xử lý, vui lòng tải lại trang và thực hiện lại !");
            }

        });
    };

    $("#tblSV :checkbox").click(function () {
        var chon = $(this).is(':checked');
        var idSV = $(this).parent().attr("id");
        var lstDanhSachSV = $("#lstDanhSachSV").val();
        if (!chon) {
            lstDanhSachSV = lstDanhSachSV.replace(idSV + ",", '');
            $("#lstDanhSachSV").val(lstDanhSachSV);
        } else {
            lstDanhSachSV = lstDanhSachSV + idSV + ",";
            $("#lstDanhSachSV").val(lstDanhSachSV);
        }
    });

    function ThucHienThemListSV() {
        $("#temp").val($("#lstDanhSachSV").val());
    };
</script>
<form id="form_ChonSV" name="form_ChonSV" method="post" action="">
<input id="lstDanhSachSV" type="hidden" />
<table width="100%" class="table table-hover" id="tblSV">
        <tr>
            <th>
                Chọn
            </th>
            <th>
                Mã Sinh Viên
            </th>
            <th>
                Tên Sinh Viên
            </th>
            <th>
                Giới Tính
            </th>
            <th>
                Ngày Sinh
            </th>
            <th>
                Nơi Sinh
            </th>
            <th>
                Lớp
            </th>
        </tr>
    <% foreach (var item in Model.Page_lstSV) { %>
    
        <tr>
            <td align="center" id="<%: item.MaSinhVien %>">
                <input id="CheckMaSV<%: item.MaSinhVien %>" name="SV" type="checkbox" value="<%: item.MaSinhVien %>" />
            </td>
            <td>
                <%: item.MaSinhVien %>
            </td>
            <td>
                <%: item.TenSinhVien %><input id="hdTenSV" type="hidden" value="<%: item.TenSinhVien %>" />
            </td>
            <td>
                <%: item.GioiTinh %>
            </td>
            <td>
                <%: item.NgaySinh %><input id="hdNgaySinh" type="hidden" value="<%: item.NgaySinh %>" />
            </td>
            <td>
                <%: item.QueQuan %>
            </td>
            <td>
                <%: item.Lop%><input id="hdLop" type="hidden" value="<%: item.Lop %>" />
            </td>
        </tr>  
    
    <% } %>

    </table>
    <div style="text-align:center">
        <%
                    var pagerOptions = new PagerOptions();
                %>
                <div id="Pager">
                <% bailam1.Function.SinhVienBussiness sv = new bailam1.Function.SinhVienBussiness(); %>
                    <% sv.ChangeTextPaging(pagerOptions, "pageIndex"); %>
                    <%= Html.Pager(Model.Page_lstSV, pagerOptions)%></div>
                <%= Html.Hidden("pageIndex", Model.PageNumber)%>
    </div>
    <div style="text-align:right"><input id="Button1" type="button" value="Chọn" onclick="LoadlstSVtemp();"/></div>
    </form>