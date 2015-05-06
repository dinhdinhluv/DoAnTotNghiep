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
<form class="form-horizontal" action="" id="formThemMonChuyenNganh" style="width:1024px">
        <div class="row">
            <div class="col-lg-4 text-center">
               <div class="form-group">
                    <label for="MaSinhVien" class="col-sm-5 control-label">
                        Môn Học :</label>
                    <div class="col-sm-1">
                        <%=Html.DropDownList("MonHoc", Model.listMonHoc, new { style = "width:200px;" })%>
                    </div>
                </div>
                <div class="form-group">
                    <label for="MaLop" class="col-sm-5 control-label">
                        Khoa :</label>
                    <div class="col-sm-1">
                        <%=Html.DropDownList("Khoa", Model.listKhoa, new { style = "width:200px;" })%>
                    </div>
                </div>
                <div class="form-group">
                    <label for="MaLop" class="col-sm-5 control-label">
                        Chuyên Ngành :</label>
                    <div class="col-sm-1" id="cbxChuyenNganh">
                        <%=Html.DropDownList("ChuyenNganh", Model.listChuyenNganh, new { style = "width:200px;" })%>
                    </div>
                </div>
                <div class="form-group">
                    <label for="MaLop" class="col-sm-5 control-label">
                        Học Kỳ :</label>
                    <div class="col-sm-1">
                        <%=Html.DropDownList("HocKy", Model.listHocKy, new { style = "width:200px;" })%>
                    </div>
                </div>
                <div class="form-group">
                    <label for="MaLop" class="col-sm-5 control-label">
                        Niên Khóa :</label>
                    <div class="col-sm-1">
                        <%=Html.DropDownList("NienKhoa", Model.listNienKhoa, new { style = "width:200px;" })%>
                    </div>
                </div>
                <div class="form-group">
                    <label for="MaLop" class="col-sm-5 control-label">
                        DVHT :</label>
                    <div class="col-sm-1" >
                        <input type="text" style="width:200px;" id="txtDVHT" name="DVHT" onkeypress="javascript:return KiemTraNhapSoTuNhien(event);" />
                    </div>
                </div>
            </div>
        </div>
        
    </form>

