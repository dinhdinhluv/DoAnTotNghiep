$(document).ready(function () {
    LoadcbxMonChuyenNganh()
    $("#Khoa").change(function () {
        LoadcbxMonChuyenNganh();
    });
});

function ChuyenTrangPhanPhongThi() {
    location.assign("/PhanPhongThi/PhanPhongThi");
}


function LoadcbxMonChuyenNganh() {
    $.ajax({
        url: '/PhanPhongThi/LoadcbxMonChuyenNganh',
        async: false,
        data: { MaKhoa: $("#Khoa").val() },
        success: function (data) {
            $("#cbxMonChuyenNganh").html(data);
            return;
        },
        error: function () {
            return;
        }
    });
}

function LoadlstSinhVien() {
    $.ajax({
        url: "/PhanPhongThi/LoadlstSinhVien",
        type: "post",
        success: function (data) {
            $("#loadlstSV").find(".modal-body").html(data);
            $("#loadlstSV").modal("show");
            $("#lstDanhSachSV").val($("#temp").val());
            var listId = $("#temp").val().split(',');
            $("#tblSV  :checkbox").each(function () {
                var idDong = $(this).parent().attr("id");
                for (var i = 0; i < listId.length; i++) {
                    if (listId[i] == idDong) {
                        $(this).prop("checked", true);
                        return;
                    }
                }
            });
        },
        error: function () {
            alert("Lỗi");
        }
    });
}


function SeachTheoMaSV() {
    $.ajax({
        url: '/PhanPhongThi/SeachTheoMaSV',
        data: { MaSV: $("#txtseach").val() },
        success: function (data) {
            $("#loadlstSV").find(".modal-body").html(data);
            $("#loadlstSV").modal("show");
        },
        error: function () {
            alert("Lỗi");
        }
    });
}

function SeachTheoMaLop() {
    $.ajax({
        url: '/PhanPhongThi/SeachTheoMaLop',
        data: { MaLop: $("#txtseach").val() },
        success: function (data) {
            $("#loadlstSV").find(".modal-body").html(data);
            $("#loadlstSV").modal("show");
        },
        error: function () {
            alert("Lỗi");
        }
    });
}

function ClickPhanLoaiSeach() {
    if ($("#cbxPhanLoaiSeach").val() == "0") {
        SeachTheoMaSV();
    }
    else {
        SeachTheoMaLop();
    }
}

function LoadlstSVtemp() {
    $.ajax({
        url: '/PhanPhongThi/LoadlstSinhVienTemp',
        async: false,
        data: { Chuoi: $("#lstDanhSachSV").val() },
        success: function (data) {
            $("#LoadlstSinhVienTemp").html(data);
            $("#temp").val($("#lstDanhSachSV").val());
            $("#loadlstSV").modal("hide");
            return;
        },
        error: function () {
            return;
        }
    });
}

function Them() {
    $.ajax({
        url: '/PhanPhongThi/ThemPhongThi/',
        data: { Chuoi: $("#temp").val(), PhongThi: $("#PhongThi").val(), MaMonChuyenNganh: $("#MonChuyenNganh").val(), NgayThi: $("#txtNgayThi").val() },
        success: function (result) {
            if (result == true) {

                alert("Thêm thành công");
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