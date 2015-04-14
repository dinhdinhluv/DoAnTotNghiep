$(document).ready(function () {

    LoadlstSinhVien();
    $("#Khoa").change(function () {
        LoadcbxLop($("#Khoa").val(), $("#NienKhoa").val());
    });
    $("#NienKhoa").change(function () {
        LoadcbxLop($("#Khoa").val(), $("#NienKhoa").val());
    });
});


function LoadlstSinhVien() {
    $.ajax({
        url: '/SinhVien/LoadlstSinhVien',
        async: false, 
        success: function (data) {
            $("#LoadlstSinhVien").html(data);
            return;
        },
        error: function () {
            return;
        }
    });
};

function LoadHangHoa(seach) {
    seach = 
    $.ajax({
        url: '/SinhVien/SeachTheoTenSV',
        async: false,
        data: { id: id },
        success: function (data) {
            $("#LoadlstSinhVien").html(data);
            return;
        },
        error: function () {
            return;
        }
    });
};

function ClickPhanLoaiSeach() {
    if($("#cbxPhanLoaiSeach").val()=="0")
    {
        SeachTheoMaSV();
    }
    else
    {
        SeachTheoMaLop();
    }
}

function SeachTheoMaSV() {
        $.ajax({
            url: '/SinhVien/SeachTheoMaSV',
            async: false,
            data: { MaSV: $("#txtseach").val() },
            success: function (data) {
                $("#LoadlstSinhVien").html(data);
                return;
            },
            error: function () {
                return;
            }
        }); 
}

function SeachTheoMaLop() {
        $.ajax({
            url: '/SinhVien/SeachTheoMaLop',
            async: false,
            data: { MaLop: $("#txtseach").val() },
            success: function (data) {
                $("#LoadlstSinhVien").html(data);
                return;
            },
            error: function () {
                return;
            }
    });
    }

    /*--------------------------------------------------*/
//    function disabledbutton(btLuu, btHuy, btThem, btSua, btTroVe) {
//        document.getElementById("btLuu").disabled = btLuu;
//        document.getElementById("btHuy").disabled = btHuy;
//        document.getElementById("btThem").disabled = btThem;
//        document.getElementById("btSua").disabled = btSua;
//        document.getElementById("btTroVe").disabled = btTroVe;
//    }

    /*-------------------------------------*/
function LoadcbxLop(jKhoa,jNienKhoa) {

    $.ajax({
        url: '/SinhVien/loadcbxLop',
        async: false,
        data: { Khoa: jKhoa,NienKhoa: jNienKhoa},
        success: function (data) {
            $("#loadcbxLop").html(data);
            return;

        },
        error: function () {
            return;
        }
    });
};

/*--------------------------------------------------*/
//function loadThem() {
//       $.ajax({
//        url: "/SinhVien/LoadThemSinhVien",
//        type: "post",
//        data: $('#formthemsinhvien').serialize(),
//        success: function (data) {
//            if (data == true) {
//                $('#themsinhvien').modal('hide');
//            }
//            else {
//                alert("Mã Sinh vien trùng..!");
//                //PhanTrang();
//                // $('#themlop').modal('hide');
//            }
//        }
//    });
//};
function loadTroVe() {
    location.assign("/SinhVien/Index");
}
function ThucHienThemSV() {
    var formData = new FormData($('#formthemsinhvien')[0]);
    $.ajax({
        url: '/SinhVien/ThucHienThemSV/',
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

function ThucHienSuaSV() {
    var formData = new FormData($('#formsuasinhvien')[0]);
    $.ajax({
        url: '/SinhVien/ThucHienSuaSV/',
        type: 'POST',
        data: formData,
        contentType: false,
        processData: false,
        success: function (result) {
            if (result == true) {

                alert("Sửa thành công");
                location.reload(true);
            }
            else {
                alert("Sửa thất bại! ");
            }
        },
        error: function (jqXhr, status, err) {
            alert("Có lỗi trong quá trình xử lý, vui lòng tải lại trang và thực hiện lại !");
        }

    });
};