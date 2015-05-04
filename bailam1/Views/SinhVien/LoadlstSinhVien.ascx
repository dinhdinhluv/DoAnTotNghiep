<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<bailam1.Models.FormModel.DanhSachSinhVien>" %>
<%@ Import Namespace="Webdiyer.WebControls.Mvc" %>

<script type="text/javascript">
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

    function SuaModal(MaSV) {
        $.ajax({
            url: "/SinhVien/LoadSuaSinhVien",
            data: { MaSV: MaSV },
            type: "get",
            success: function (data) {
                $("#suasinhvien").find(".modal-body").html(data);
                $("#suasinhvien").modal("show");
            },
            error: function () {
                alert("Lỗi");
            }
        });
    }
    $(function () {
        //bắt đc sự kiện khi modal đóng thì chạy $('#sualop').find('.modal-body').html('')
        $("#themsinhvien").on("hide.bs.modal", function () {
            $('#themsinhvien').find('.modal-body').html('');
        });
        $("#suasinhvien").on("hide.bs.modal", function () {
            $('#suasinhvien').find('.modal-body').html('');
        });
    });
</script>
<center>
<table width="100%" id="hienthisinhvien" class="giuadong">
        <tr>
            <th class="giuadong">
                STT
            </th>
            <th class="giuadong">
                Mã Sinh Viên
            </th>
            <th class="giuadong">
                Tên Sinh Viên
            </th>
            <th class="giuadong">
                Giới Tính
            </th>
            <th class="giuadong">
                Ngày Sinh
            </th>
            <th class="giuadong">
                Nơi Sinh
            </th>
            <th class="giuadong">
                Lớp
            </th>
            <th class="giuadong">
            </th>

        </tr>
        <% int stt = 1; %>
    <% foreach (var item in Model.Page_lstSV) { %>
    
        <tr align="left">
            <td>
                
                <%: stt %>
                <% stt++; %>
            </td>
            <td>
                <%: item.MaSinhVien %>
            </td>
            <td>
                <%: item.TenSinhVien %>
            </td>
            <td>
                <%: item.GioiTinh %>
            </td>
            <td>
                <%: item.NgaySinh %>
            </td>
            <td>
                <%: item.QueQuan %>
            </td>
            <td>
                <%: item.Lop %>
            </td>
            <td>
                <input type="button" class="btn btn-primary" id="suathongtinsinhvien" value="Sửa thông tin" onclick="SuaModal('<%= item.MaSinhVien %>')" />
            </td>
        </tr>  
    
    <% } %>

    </table>
    </center>
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