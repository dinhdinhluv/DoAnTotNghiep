$(document).ready(function () {

    LoadlstDM_MonHoc();
    $("#cbxTrangThai").change(function () {
        LoadlstDM_MonHoc();
    });
});

function LoadlstDM_MonHoc(TrangThai) {
    $.ajax({
        url: '/MonHoc/LoadlstDM_MonHoc',
        async: false,
        data: { TrangThai: $("#cbxTrangThai").val() },
        success: function (data) {
            $("#LoadDM_MonHoc").html(data);
            return;
        },
        error: function () {
            return;
        }
    });
}

function ThemMon() {
    var formData = new FormData($('#formthem')[0]);
    $.ajax({
        url: '/MonHoc/ThemMon/',
        type: 'POST',
        data: formData,
        contentType: false,
        processData: false,
        success: function (result) {
            if (result == true) {

                alert("Thêm thành công");
                location.reload(true);
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

function ThemMonHoc() {
    $.ajax({
        url: "/MonHoc/LoadThemMon",
        type: "post",
        success: function (data) {
            $("#themmonhoc").find(".modal-body").html(data);
            $("#themmonhoc").modal("show");
        },
        error: function () {
            alert("Lỗi");
        }
    });
}

