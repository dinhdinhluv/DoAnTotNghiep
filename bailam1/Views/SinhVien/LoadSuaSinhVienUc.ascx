<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<bailam1.Models.FormModel.SinhVienForm>" %>
<script src="../../Scripts/JSQLSV.js" type="text/javascript"></script>
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
<form id="formsuasinhvien" class="form-horizontal">
        <div class="row">
            <div class="col-lg-4 text-center">
               <div class="form-group">
                    <label for="MaSinhVien" class="col-sm-5 control-label">
                        Mã sinh viên :</label>
                    <div class="col-sm-1">
                        <input type="text" id="txtMaSinhVien" name="MaSinhVien" value="<%: Model.MaSinhVien %>" size="20" />
                    <input id="Hidden1" type="hidden" name="MaSinhVien" value="<%: Model.MaSinhVien %>"/>
                    </div>
                </div>
                <div class="form-group">
                    <label for="TenSinhVien" class="col-sm-5 control-label">
                        Tên sinh viên :</label>
                    <div class="col-sm-1">
                        <input type="text" id="txtTenSinhVien" name="TenSinhVien" value="<%: Model.TenSinhVien %>" />
                    </div>
                </div>
                <div class="form-group">
                    <label for="NgaySinh" class="col-sm-5 control-label">
                        Ngày sinh :</label>
                    <div class="col-sm-1">
                        <input type="text" id="txtNgaySinh" name="NgaySinh" value="<%: Model.NgaySinh %>" />
                    </div>
                </div>
                <div class="form-group">
                    <label for="GioiTinh" class="col-sm-5 control-label">
                        Giới tính :</label>
                    <div class="col-sm-1">
                        <%=Html.DropDownList("GioiTinh", Model.listGioiTinh)%>
                    </div>
                </div>
                <div class="form-group">
                    <label for="SoDienThoai" class="col-sm-5 control-label">
                        Số điện thoại :</label>
                    <div class="col-sm-1">
                        <input type="text" id="SDT" name="SDT" value="<%: Model.SDT %>" />
                    </div>
                </div>
                <div class="form-group">
                    <label for="DiaChi" class="col-sm-5 control-label">
                       Địa chỉ :</label>
                    <div class="col-sm-1">
                        <input type="text" id="txtDiaChi" name="DiaChi" value="<%: Model.DiaChi %>" />
                    </div>
                </div>
            </div>
            <div class="col-lg-4 text-center">
                <div class="form-group">
                    <label for="QueQuan" class="col-sm-5 control-label">
                        Quê quán :</label>
                    <div class="col-sm-1">
                        <%=Html.DropDownList("QueQuan", Model.listQueQuan)%>
                    </div>
                </div>
                <div class="form-group">
                    <label for="DanToc" class="col-sm-5 control-label">
                        Dân tộc :</label>
                    <div class="col-sm-1">
                        <%=Html.DropDownList("DanToc", Model.listDanToc)%>
                    </div>
                </div>
                <div class="form-group">
                    <label for="TonGiao" class="col-sm-5 control-label">
                       Tôn Giáo :</label>
                    <div class="col-sm-1">
                        <%=Html.DropDownList("TonGiao", Model.listTonGiao)%>
                    </div>
                </div>
                <div class="form-group">
                    <label for="MaKhoa" class="col-sm-5 control-label">
                        Khoa :</label>
                    <div class="col-sm-1">
                        <%=Html.DropDownList("Khoa", Model.listKhoa)%>
                    <input id="Hidden2" type="hidden" name="Khoa" value="<%: Model.Khoa %>"/>
                    </div>
                </div>
                <div class="form-group">
                    <label for="MaNienKhoa" class="col-sm-5 control-label">
                        Khóa :</label>
                    <div class="col-sm-1">
                        <%=Html.DropDownList("NienKhoa", Model.listNienKhoa)%>
                    </div>
                </div>
                <div class="form-group">
                    <label for="Lop" class="col-sm-5 control-label">
                        Lớp :</label>
                    <div class="col-sm-1" id="loadcbxLop">
                       <%=Html.DropDownList("Lop", Model.listLop, new { style = "width:220px;" })%>
                    <input id="Hidden3" type="hidden" name="Lop" value="<%: Model.Lop %>"/>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 text-center">
                <div class="form-group">
                    <% if (Model.HinhAnh == null)
                   { %>
                    <img id="blah" alt="" width=160px height=240px src="/Content/HinhAnh/photo.jpg" />
                <% } %>
                <% else
                    { %>
                    <img id="blah" alt="" width=160px height=240px src="/HinhSV/<%: Model.Khoa %>/<%: Model.Lop %>/<%: Model.HinhAnh %>" />
                    <% } %>
                    <br /><input onchange="readURL(this);" id="HinhSV" name="HinhSV" accept="image/*" data-input="false" type="file" /></td>
                </div>
            </div>
        </div>
    <div style="text-align:center">
        <input class="btn btn-primary" id="btSua" onclick="ThucHienSuaSV();" type="button" value="Sửa" />
        <input class="btn btn-primary" id="btTroVe" type="button" value="Trở Về" onclick="loadTroVe();" />
    </div>
    </form>

