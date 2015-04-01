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