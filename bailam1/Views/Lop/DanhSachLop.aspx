<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<bailam1.Models.FormModel.KHOA_DMKhoaForm>" %>

<%@ Import Namespace="Webdiyer.WebControls.Mvc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Danh sách lớp..
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h3 class="panel-title text-center">
                QUẢN LÝ LỚP</h3>
        </div>
        <div class="panel-body">
            <input id="txtTimKiem" onkeypress="javascript:if (event.keyCode==13) { PhanTrang(); }"
                placeholder="Nhập từ khóa.." type="text" />
        </div>
        <div class="panel-body" id="tdPhanTrang">
        </div>
        <input class="btn btn-primary center-block" value="Thêm mới" id="btnadd" onclick="return btnadd_onclick('Lop/Themlop')" />
    </div>
    <script language="javascript" type="text/javascript">
        $(function () {
            PhanTrang();
        });

        function btnadd_onclick(lo) {
            window.location = lo;
        }
    </script>
</asp:Content>
