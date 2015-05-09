<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<bailam1.Models.FormModel.PhanPhongThiForm>" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {

    }
</script>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    PhanPhongThi
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script src="../../Scripts/JSPhanPhongThi.js" type="text/javascript"></script>
    <% if( Session["Username"]==null)
           Response.Redirect("~/Admin/Index");
            %>
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h3 class="panel-title text-center">
                <strong>PHÂN PHÒNG THI</strong></h3>
        </div>
    <form class="form-horizontal" action="" id="formThemMonChuyenNganh">
    <table style="width: 100%;">
        <tr>
            <td style="width: 500px; height: 100px; vertical-align: top; background-color: #f4f5f8">
                <input id="Button1" class="btn btn-primary"  type="button" value="Chọn Sinh Viên" onclick="LoadlstSinhVien()" />
                <div id="LoadlstSinhVienTemp">
                </div>
                <input id="temp" type="hidden" />
            </td>
            <td style="vertical-align: top;">
                <div class="modal fade" id="loadlstSV">
                    <div class="modal-dialog" style="width: 1000px;">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title text-center" id="ModalTitle1">
                                    Chọn Sinh Viên</h4>
                            </div>
                            <div class="panel-body">
                                <select name='phanloai' id="cbxPhanLoaiSeach">
                                    <option value='0'>Tìm theo mã sinh viên </option>
                                    <option value='1'>Tìm theo mã lớp </option>
                                </select>
                                <input type="text" placeholder="--Tìm kiếm--" id="txtseach" class="form-control"
                                    onkeypress="javascript:if (event.keyCode==0) { ClickPhanLoaiSeach(); }" />
                                <input id="btseach" type="button" value="Tìm" onclick="ClickPhanLoaiSeach();" />
                            </div>
                            <div class="modal-body">
                            </div>
                        </div>
                        <!-- /.modal-content -->
                    </div>
                    <!-- /.modal-dialog -->
                </div>
                <div>
                    <table style="width: 100%;">
                        <tr>
                            <td>
                                Phòng Thi
                            </td>
                            <td>
                                <%=Html.DropDownList("PhongThi", Model.listPhongThi)%>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Ngày Thi
                            </td>
                            <td>
                                <input id="txtNgayThi" type="text" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Khoa
                            </td>
                            <td>
                                <%=Html.DropDownList("Khoa", Model.listKhoa)%>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Môn Chuyên Ngành
                            </td>
                            <td id="cbxMonChuyenNganh">
                                <%=Html.DropDownList("MonChuyenNganh", Model.listMonChuyenNganh)%>
                            </td>
                        </tr>
                    </table>
                <div style="text-align:center">
                    <input id="Button2"  class="btn btn-primary" type="button" value="Thêm vào phòng thi" onclick="Them()" />
                </div>
            </td>
        </tr>
    </table>
    </form>
    </div>
</asp:Content>
