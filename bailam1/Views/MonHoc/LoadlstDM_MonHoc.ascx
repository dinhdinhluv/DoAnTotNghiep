<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<bailam1.Models.FormModel.DanhSachDM_MonHoc>" %>
<%@ Import Namespace="Webdiyer.WebControls.Mvc" %>

<script>
    $('#Pager a').click(function () {
        if (this.href != "") {
            $.ajax({
                url: this.href,
                type: 'GET',
                cache: false,
                success: function (result) {
                    $('#LoadDM_MonHoc').html(result);
                }
            });
            return false;
        }
        return false;
    });

    function OnOff(MaMH,TrangThai) {
    $.ajax({
        url: '/MonHoc/OnOff',
        async: false,
        data: { MaMH: MaMH, TrangThai: TrangThai },
        success: function (result) {
            if (result == true) {

                alert("Thành công");
                LoadlstDM_MonHoc();
            }
            else {
                alert("Thất bại! ");
            }
        },
        error: function (jqXhr, status, err) {
            alert("Có lỗi trong quá trình xử lý, vui lòng tải lại trang và thực hiện lại !");
        }
    });
    };
</script>
<form id="formsua" class="form-horizontal">
<table width="100%" class="table table-hover">
        <tr>
            <th>
                Mã Môn Học
            </th>
            <th>
                Tên Môn Học
            </th>
            <th>
                Trạng Thái
            </th>
        </tr>
    <% foreach (var item in Model.Page_lstDM_MonHoc) { %>
    
        <tr>
            <td style="width:200px;text-align:center">
                <%: item.MaMonHoc %>
            </td>
            <td>
                <%: item.TenMonHoc %>
            </td>
            <td style="width:100px;text-align:center">
              <a href="#" onclick="OnOff('<%= item.MaMonHoc %>','<%= item.TrangThai %>')"> <%: item.TrangThai %> </a> 
            </td>
        </tr>  
    
    <% } %>

    </table>
    <div style="text-align:center">
        <%
                    var pagerOptions = new PagerOptions();
                %>
                <div id="Pager">
                <% bailam1.Function.MonHocBussiness MonHocBussiness = new bailam1.Function.MonHocBussiness(); %>
                    <% MonHocBussiness.ChangeTextPaging(pagerOptions, "pageIndex"); %>
                    <%= Html.Pager(Model.Page_lstDM_MonHoc, pagerOptions)%></div>
                <%= Html.Hidden("pageIndex", Model.PageNumber)%>
    </div>
    </form>