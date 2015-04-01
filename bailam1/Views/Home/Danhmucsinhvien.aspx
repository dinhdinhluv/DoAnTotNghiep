<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Danhmucsinhvien
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h3 class="panel-title">DANH MỤC SINH VIÊN</h3>
        </div>
        <div class="panel-body" id="DvData">
            <table class="table table-hover table-responsive" id="TableData">
                <thead>
                    <tr>
                        <th>Mã SV</th>
                        <th>Họ và tên</th>
                        <th>Giới tính</th>
                        <th>Địa chỉ</th>
                        <th>Ngày sinh</th>
                        <th>Số điện thoại</th>
                    </tr>
                </thead>
                <tbody></tbody>
            </table>
        </div>
        <center><input class="btn btn-primary" data-target="#AddingPeopleModal" data-toggle="modal" type="button" value="Thêm mới" />
        
        <input class="btn btn-primary" data-target="#UpdatePeopleModal" data-toggle="modal" type="button" value="Sua" /></center>
        
    </div>
    <div class="modal fade" id="AddingPeopleModal" tabindex="-1" role="dialog" aria-labelledby="ModalTitle" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                        </button>
                    <h4 class="modal-title" id="ModalTitle">Thêm dang muc vao sinh vien</h4>
                </div>
            <div class="row">
                    <div class="col-lg-6 text-center">
                            <div class="panel-body">
                                <input type="text" class="form-control" id="MaSV" placeholder="Ma sinh vien" />
                            </div>
                    </div>
                    <div class="col-lg-6 text-center">
                            <div class="panel-body">
                                <input type="text" class="form-control" id="Hoten" placeholder="Ho va ten" />
                            </div>
                    </div>
            </div>
            <div class="row">
                    <div class="col-lg-6 text-center">
                            <div class="panel-body">
                                <select id="Gioitinh" class="form-control">
                                    <option value="Male">Nam</option>
                                    <option value="Female">Nu</option>
                                </select>
                            </div>
                    </div>
                    <div class="col-lg-6 text-center">
                            <div class="panel-body">
                                <input type="text" class="form-control" id="Diachi" placeholder="Dia chi" />
                            </div>
                    </div>
            </div>
            <div class="row">
                    <div class="col-lg-6 text-center">
                            <div class="panel-body">
                                <input type="text" class="form-control" id="Ngaysinh" placeholder="Ngay sinh" />
                            </div>
                    </div>
                    <div class="col-lg-6 text-center">
                            <div class="panel-body">
                                <input type="text" class="form-control" id="sdt" placeholder="So dien thoai" />
                            </div>
                    </div>
            </div>
            <div class="row">
                    <div class="col-lg-6 text-center">
                            <div class="panel-body">
                                <input type="text" class="form-control" id="Quequan" placeholder="Que quan" />
                            </div>
                    </div>
                    <div class="col-lg-6 text-center">
                            <div class="panel-body">
                                <select id="Dantoc" class="form-control">
                                    <option value="Male">Kinh</option>
                                    <option value="Female">Muong</option>
                                </select>
                            </div>
                    </div>
            </div>
            <div class="row">
                    <div class="col-lg-6 text-center">
                            <div class="panel-body">
                                <input type="text" class="form-control" id="Tongiao" placeholder="Ton giao" />
                            </div>
                    </div>
                    <div class="col-lg-6 text-center">
                            <div class="panel-body">
                                <input type="file" id="Hinhanh" placeholder="Hinh anh" />
                            </div>
                    </div>
            </div>
            <div class="row">
                    <div class="col-lg-6 text-center">
                            <div class="panel-body">
                                <input type="text" class="form-control" id="Lop" placeholder="Lop" />
                            </div>
                    </div>
                    <div class="col-lg-6 text-center">
                            <div class="panel-body">
                                <input type="text" class="form-control" id="Khoa" placeholder="Khoa" />
                            </div>
                    </div>
            </div>
            <div class="row">
                    <div class="col-lg-6 text-center">
                            <div class="panel-body">
                                <input type="text" class="form-control" id="Nienkhoa" placeholder="Nien khoa" />
                            </div>
                    </div>
                    <div class="col-lg-6 text-center">
                            <div class="panel-body">
                                <input type="text" class="form-control" id="Text12" placeholder="Ho va ten" />
                            </div>
                    </div>
            </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
                    <button type="button" class="btn btn-primary" id="BtnAdd">Thêm</button>
                </div>
            </div>
        </div>
    </div>


    <div class="modal fade" id="UpdatePeopleModal" tabindex="-1" role="dialog" aria-labelledby="ModalTitle" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                        </button>
                    <h4 class="modal-title" id="H1">Thêm dang muc vao sinh vien</h4>
                </div>
            <div class="row">
                    <div class="col-lg-6 text-center">
                            <div class="panel-body">
                                <input type="text" class="form-control" id="Text1" placeholder="Ma sinh vien" />
                            </div>
                    </div>
                    <div class="col-lg-6 text-center">
                            <div class="panel-body">
                                <input type="text" class="form-control" id="Text2" placeholder="Ho va ten" />
                            </div>
                    </div>
            </div>
            <div class="row">
                    <div class="col-lg-6 text-center">
                            <div class="panel-body">
                                <select id="Select1" class="form-control">
                                    <option value="Male">Nam</option>
                                    <option value="Female">Nu</option>
                                </select>
                            </div>
                    </div>
                    <div class="col-lg-6 text-center">
                            <div class="panel-body">
                                <input type="text" class="form-control" id="Text3" placeholder="Dia chi" />
                            </div>
                    </div>
            </div>
            <div class="row">
                    <div class="col-lg-6 text-center">
                            <div class="panel-body">
                                <input type="text" class="form-control" id="Text4" placeholder="Ngay sinh" />
                            </div>
                    </div>
                    <div class="col-lg-6 text-center">
                            <div class="panel-body">
                                <input type="text" class="form-control" id="Text5" placeholder="So dien thoai" />
                            </div>
                    </div>
            </div>
            <div class="row">
                    <div class="col-lg-6 text-center">
                            <div class="panel-body">
                                <input type="text" class="form-control" id="Text6" placeholder="Que quan" />
                            </div>
                    </div>
                    <div class="col-lg-6 text-center">
                            <div class="panel-body">
                                <select id="Select2" class="form-control">
                                    <option value="Male">Kinh</option>
                                    <option value="Female">Muong</option>
                                </select>
                            </div>
                    </div>
            </div>
            <div class="row">
                    <div class="col-lg-6 text-center">
                            <div class="panel-body">
                                <input type="text" class="form-control" id="Text7" placeholder="Ton giao" />
                            </div>
                    </div>
                    <div class="col-lg-6 text-center">
                            <div class="panel-body">
                                <input type="file" id="File1" placeholder="Hinh anh" />
                            </div>
                    </div>
            </div>
            <div class="row">
                    <div class="col-lg-6 text-center">
                            <div class="panel-body">
                                <input type="text" class="form-control" id="Text8" placeholder="Lop" />
                            </div>
                    </div>
                    <div class="col-lg-6 text-center">
                            <div class="panel-body">
                                <input type="text" class="form-control" id="Text9" placeholder="Khoa" />
                            </div>
                    </div>
            </div>
            <div class="row">
                    <div class="col-lg-6 text-center">
                            <div class="panel-body">
                                <input type="text" class="form-control" id="Text10" placeholder="Nien khoa" />
                            </div>
                    </div>
                    <div class="col-lg-6 text-center">
                            <div class="panel-body">
                                <input type="text" class="form-control" id="Text11" placeholder="Ho va ten" />
                            </div>
                    </div>
            </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
                    <button type="button" class="btn btn-primary" id="Button1">Thêm</button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

