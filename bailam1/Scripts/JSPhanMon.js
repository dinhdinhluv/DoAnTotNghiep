/////////////////Phân Môn///////////////////////////
$(document).ready(function () {
    LoadlstMonHocTheoChuyenNganh();
    $("#cbxKhoa").change(function () {
        LoadlstMonHocTheoChuyenNganh();
    });
});


function LoadlstMonHocTheoChuyenNganh() {
    $.ajax({
        url: '/MonHocTheoChuyenNganh/LoadlstMonHocTheoChuyenNganh',
        async: false,
        data: { MaKhoa: $("#cbxKhoa").val() },
        success: function (data) {
            $("#lstPhanMon").html(data);
            return;
        },
        error: function () {
            return;
        }
    });
}

function LoadThemMonChuyenNganh() {
    $.ajax({
        url: "/MonHocTheoChuyenNganh/LoadThemMonChuyenNganh",
        type: "post",
        success: function (data) {
            $("#loadthemmonchuyennganh").find(".modal-body").html(data);
            $("#loadthemmonchuyennganh").modal("show");
        },
        error: function () {
            alert("Lỗi");
        }
    });
}

function ThemMonChuyenNganh() {
    var formData = new FormData($('#formThemMonChuyenNganh')[0]);
    $.ajax({
        url: '/MonHocTheoChuyenNganh/ThemMonChuyenNganh/',
        type: 'POST',
        data: formData,
        contentType: false,
        processData: false,
        success: function (result) {
            if (result == true) {

                alert("Thêm thành công");
                LoadlstMonHocTheoChuyenNganh();
            }
            else {
                alert("Thêm thất bại! ");
            }
        },
        error: function (jqXhr, status, err) {
            alert("Có lỗi trong quá trình xử lý, vui lòng tải lại trang và thực hiện lại !");
        }
    });
};