function LoadMonHoc(makhoa) {

    $.ajax({
        url: '/Diem/LoadMonTheoKhoa',
        async: false,
        data: { makhoa: makhoa },
        success: function (data) {
            $("#MaMonHocTheoKhoa").html(data);
            return;

        },
        error: function () {
            return;
        }
    });
};

$(document).ready(function () {
    $("#MaKhoa").change(function () {
        //        alert($("#MaKhoa").val());
        LoadMonHoc($("#MaKhoa").val());
    });
    $("#MaPhongThi").change(function () {
        if ($("#MaPhongThi").val() == "") {
            alert("Chọn phòng thi");
        }
        else {
            LoadDiem($("#MaPhongThi").val(), $("#MaMonHocChuyenNganh").val());
        }
    });
});

function LoadDiem(MaPhongThi, MaMonChuyenNganh) {
    $.ajax({
        url: '/Diem/DiemTheoPhongThijs',
        async: false,
        data: { MaPhongThi: MaPhongThi, MaMonHocChuyenNganh: MaMonChuyenNganh },
        success: function (data) {
            $("#LoadDiemTheoPhongMon").html(data);
            return;
        },
        error: function () {
            return;
        }
    });
};

