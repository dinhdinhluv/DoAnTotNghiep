function Loadcbx(id) {

    $.ajax({
        url: '/Lop/loadchuyennganh',
        async: false,
        data: { makhoa: id },
        success: function (data) {
            $("#Loadcbx").html(data);
            return;

        },
        error: function () {
            return;
        }
    });
};

$(document).ready(function () {
    $("#MaKhoa").change(function () {
        Loadcbx($("#MaKhoa").val());
    });
});




function ThemLop() {
//    document.forms[0].action = '/Lop/Themlop/';
//    document.forms[0].method = 'post';
    //    document.forms[0].submit();
    
    $.ajax({
        url: "/Lop/ThemLop",
        type: "post",
        data: $('#formthem').serialize(),
        success: function (data) {
            if (data == true) {
                alert("Thêm thành công..!");
                PhanTrang();
                $('#themlop').modal('hide');
            }
            else {
                alert("Mã lớp trùng..!");
                //PhanTrang();
               // $('#themlop').modal('hide');
            } 
        }
    });
}

function XoaLop(id) {
    var r = confirm("Bạn có chắc muốn xóa ?");
    if (r == true) {

        $.ajax({
            url: "/Lop/XoaLop",
            data: { id: id },
            success: function (data) {
                alert("Xóa thành công");
                PhanTrang();
            }
        });
    }
}

function SuaLop() {
    $.ajax({
        url: "/Lop/SuaLop",
        type: "post",
        data: $('#form').serialize(),
        success: function (data) {
            if (data == true) {
                alert("Sửa thành công..!");
                PhanTrang();
                $('#sualop').modal('hide');
            }
            else {
                alert("Sửa thành công..!");
            }
        }
    });
}

/**********************************/

function PhanTrang() {
    $.ajax({
        url: '/Lop/DanhSachLopAjax', // Controller/Action
        async: false, // chạy bất đồng bộ 2 ajax 
        data: { TuKhoa: $("#txtTimKiem").val().trim() },
        success: function(data) { // data đối tượng trả về cuả hàm ajax
            $("#tdPhanTrang").html(data); // div nhận dữ liệu html 
            return;

        },
        error: function() {
            alert("Không thấy!");
            return;
        }
    });
}