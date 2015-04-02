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

    //    $("#MaChuyenNganh").change(function () {
    //        Loadcbx($("#MaChuyenNganh").val());
    //    });
});




function Themlop() {
    document.forms[0].action = '/Lop/Themlop/';
    document.forms[0].method = 'post';
    document.forms[0].submit();
}


function SuaLop() {
    document.forms[0].action = '/Lop/SuaLop/';
    document.forms[0].method = 'post';
    document.forms[0].submit();
}


function btnadd_onclick(lo) {
    window.location = lo;
}
/**********************************/

function PhanTrang() {

    $.ajax({
        url: '/Lop/DanhSachLopAjax', // Controller/Action
        async: false, // chạy bất đồng bộ 2 ajax 
        data: { TuKhoa: $("#txtTimKiem").val().trim() },
        success: function (data) { // data đối tượng trả về cuả hàm ajax
            $("#tdPhanTrang").html(data); // div nhận dữ liệu html 
            return;

        },
        error: function () {
            alert("Không thấy!");
            return;
        }
    });
}
