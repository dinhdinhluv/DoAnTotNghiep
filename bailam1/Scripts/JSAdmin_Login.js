function PhanTrangAdmin() {
    $.ajax({
        url: '/Admin/DanhSachAdminAjax', // Controller/Action
        async: false, // chạy bất đồng bộ 2 ajax 
        data: { TuKhoa: $("#txtTimKiemTK").val().trim() },
        success: function (data) { // data đối tượng trả về cuả hàm ajax
            $("#divPhanTrang").html(data); // div nhận dữ liệu html 
            return;

        },
        error: function () {
            alert("Không có dữ liệu!");
            return;
        }
    });
}

function PhanTrangQuyenAdmin() {
    $.ajax({
        url: '/Admin/CapQuyenTaiKhoanAjax', // Controller/Action
        async: false, // chạy bất đồng bộ 2 ajax 
        data: { TuKhoa: $("#txtTimKiemTK").val().trim() },
        success: function (data) { // data đối tượng trả về cuả hàm ajax
            $("#divPhanTrangQH").html(data); // div nhận dữ liệu html 
            return;

        },
        error: function () {
            alert("Không có dữ liệu!");
            return;
        }
    });
}

function ThemTaiKhoan() {
    if ($('#MatKhau').val() == $('#reMatKhau').val()) {
        $.ajax({
            url: "/Admin/ThemTaiKhoan",
            type: "post",
            data: $('#formthemtk').serialize(),
            success: function (data) {
                if (data == true) {
                    alert("Tạo tài khoản thành công..!");
                    PhanTrangAdmin();
                    $('#themtk').modal('hide');
                }
                else {
                    alert("Tài khoản đã tồn tại..!");
                }
            }
        });
    }
    else {
        alert("Mật khẩu nhập lại không trùng khớp!");
        $('#MatKhau').val("");
        $('#MatKhau').focus();
        $('#reMatKhau').val("");
    }
}

function XoaTaiKhoan(id) {
    var r = confirm("Bạn có chắc muốn xóa tài khoản này ?");
    if (r == true) {

        $.ajax({
            url: "/Admin/XoaTaiKhoan",
            data: { id: id },
            success: function (data) {
                alert("Xóa thành công");
                PhanTrangAdmin();
            }
        });
    }
    else {
        this.close();
    }
}

function SuaTaiKhoan() {
    if ($('#MatKhauMoi').val() == $('#reMatKhauMoi').val()) {
        $.ajax({
            url: "/Admin/SuaTaiKhoan",
            type: "post",
            data: $('#formsuatk').serialize(),
            success: function (data) {
                if (data == true) {
                    alert("Đổi mật khẩu thành công..!");
                    PhanTrangAdmin();
                    $('#suatk').modal('hide');
                }
                else {
                    alert("Đổi mật khẩu không thành công vui lòng kiểm tra lại thông tin..!");
                }
            }
        });
    }
    else {
        alert("Mật khẩu nhập lại không trùng khớp!");
        $('#MatKhauMoi').val("");
        $('#MatKhauMoi').focus();
        $('#reMatKhauMoi').val("");
    }
}

/**********************************/
function SuaQuyenHanTaiKhoan() {
    $.ajax({
        url: "/Admin/SuaQuyenTaiKhoan",
        type: "post",
        data: $('#formsuaquyentk').serialize(),
        success: function (data) {
            if (data == true) {
                alert("Phân quyền thành công..!");
                PhanTrangQuyenAdmin();
                $('#suatk').modal('hide');
            }
            else {
                alert("Sửa thành công..!");
            }
        }
    });
}
