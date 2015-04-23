<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<bailam1.Models.FormModel.MonHocTheoChuyenNganhForm>" %>
<script>
    $("#Khoa").change(function () {
        LoadcbxChuyenNganh();
    });
    function LoadcbxChuyenNganh() {
        $.ajax({
            url: '/MonHocTheoChuyenNganh/LoadcbxChuyenNganh',
            async: false,
            data: { MaKhoa: $("#Khoa").val() },
            success: function (data) {
                $("#cbxChuyenNganh").html(data);
                return;
            },
            error: function () {
                return;
            }
        });
    }
</script>
<form class="form-horizontal" action="" id="formThemMonChuyenNganh" style="width:1024px">
        <div class="row">
            <div class="col-lg-4 text-center">
               <div class="form-group">
                    <label for="MaSinhVien" class="col-sm-5 control-label">
                        Môn Học :</label>
                    <div class="col-sm-1">
                        <%=Html.DropDownList("MonHoc", Model.listMonHoc)%>
                    </div>
                </div>
                <div class="form-group">
                    <label for="MaLop" class="col-sm-5 control-label">
                        Khoa :</label>
                    <div class="col-sm-1">
                        <%=Html.DropDownList("Khoa", Model.listKhoa)%>
                    </div>
                </div>
                <div class="form-group">
                    <label for="MaLop" class="col-sm-5 control-label">
                        Chuyên Ngành :</label>
                    <div class="col-sm-1" id="cbxChuyenNganh">
                        <%=Html.DropDownList("ChuyenNganh", Model.listChuyenNganh)%>
                    </div>
                </div>
                <div class="form-group">
                    <label for="MaLop" class="col-sm-5 control-label">
                        Học Kỳ :</label>
                    <div class="col-sm-1">
                        <%=Html.DropDownList("HocKy", Model.listHocKy)%>
                    </div>
                </div>
                <div class="form-group">
                    <label for="MaLop" class="col-sm-5 control-label">
                        Niên Khóa :</label>
                    <div class="col-sm-1">
                        <%=Html.DropDownList("NienKhoa", Model.listNienKhoa)%>
                    </div>
                </div>
                <div class="form-group">
                    <label for="MaLop" class="col-sm-5 control-label">
                        DVHT :</label>
                    <div class="col-sm-1">
                        <input type="text" id="txtDVHT" name="DVHT" />
                    </div>
                </div>
            </div>
        </div>
     <div style="text-align:center">
        <input class="btn btn-primary" onclick="ThemMonChuyenNganh()" id="btThem" type="button" value="Thêm" />
        <input class="btn btn-primary" id="btTroVe" type="button" value="Trở Về" onclick="loadTroVe();" />
    </div>
    </form>

