<%-- 
    Document   : table
    Created on : Sep 18, 2019, 4:49:43 PM
    Author     : Admin
--%>

<%@page import="java.io.PrintWriter"%>
<%@page import="Tienich.Dungchung"%>
<%@page import="CSDL.tbHoadon"%>
<%@page import="Models.clsHoadon"%>
<%@page import="Models.clsChitietHoadon"%>
<%@page import="CSDL.tbChitietHoadon"%>
<%@page import="Models.clsNhomSP"%>
<%@page import="CSDL.tbNhomSP"%>
<%@page import="java.util.Vector"%>
<%@page import="Models.clsSanpham"%>
<%@page import="CSDL.tbSanpham"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="error.jsp" %>
<%if (request.getParameter("s") != null) {
        if (request.getParameter("s").equalsIgnoreCase("f")) {
            out.println("<script>alert('Thất bại. Xin thử lại !')</script>");
        }
    }
%>
<div class="card">
    <div class="card-header card-header-primary">
        <h4 class="card-title ">BẢNG DỮ LIỆU</h4>
        <p class="card-category">Data table</p>
    </div>
    <div class="card-body">
        <section id="tabs" class="project-tab">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <nav>
                            <div class="nav nav-tabs nav-fill" id="nav-tab" role="tablist">
                                <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">Sản phẩm</a>
                                <a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false">Nhóm sản phẩm</a>
                                <a class="nav-item nav-link" id="nav-contact-tab" data-toggle="tab" href="#nav-contact" role="tab" aria-controls="nav-contact" aria-selected="false">Hoá đơn</a>
                            </div>
                        </nav>
                        <div class="tab-content" id="nav-tabContent">
                            <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
                                <table class="table" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Tên sản phẩm</th>
                                            <th>Giá sản phẩm</th>
                                            <th>Mã nhóm</th>
                                            <th>Hình ảnh</th>
                                            <th>Chi tiết sản phẩm</th>
                                            <th>Trạng thái</th>
                                            <th>Sửa</th>
                                            <th>Xoá</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%tbSanpham tb_sanpham = new tbSanpham();
                                            Vector<clsSanpham> vSanPham = new Vector<clsSanpham>();
                                            int result = tb_sanpham.getListProduct(vSanPham);
                                            for (clsSanpham i : vSanPham) {
                                        %>
                                        <tr>
                                            <td><%=i.getId()%></td>
                                            <td><%=i.getTensp()%></td>
                                            <td><%=i.getGiasp()%></td>
                                            <td><%=i.getManhom()%></td>
                                            <td><details><summary><small>Chi tiết</small></summary><%=i.getHinhanh()%></details></td>
                                            <td><details><summary><small>Chi tiết</small></summary><%=i.getNoidung()%></details></td>
                                            <td><%=Tienich.Dungchung.booleanToString(i.isTrangthai(), "Còn hàng", "Hết hàng")%></td>
                                            <td><a class="btn btn-sm btn-success" href="?c=editProduct&id=<%=i.getId()%>"><i class="far fa-edit"></i></a></td>
                                            <td><a class="btn btn-sm btn-danger" href="../DeleteProduct?id=<%=i.getId()%>"><i class="fas fa-trash"></i></a></td>
                                        </tr>
                                        <%}%>
                                    </tbody>
                                </table>
                            </div>
                            <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
                                <button type="button" class="btn btn-success circle" id="addNewGroup"><i class="fas fa-plus-circle" style="font-size:20px;"></i></button>
                                <table class="table" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>Mã nhóm</th>
                                            <th>Tên nhóm</th>
                                            <th>Số thứ tự</th>
                                            <th>Trạng thái</th>
                                            <th>Sửa</th>
                                            <th>Xoá</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            tbNhomSP tb_NhomSP = new tbNhomSP();
                                            Vector<clsNhomSP> vNhomSP = new Vector<clsNhomSP>();
                                            result = tb_NhomSP.TimNhomSP("", vNhomSP);
                                            for (clsNhomSP i : vNhomSP) {
                                        %>
                                        <tr>
                                            <td><%=i.getManhom()%></td>
                                            <td><%=i.getTenhom()%></td>
                                            <td><%=i.getThutu()%></td>
                                            <td><%=Tienich.Dungchung.booleanToString(i.isTrangthai(), "Mở", "Đóng")%></td>
                                            <td><button data-toggle="modal" class="btn btn-sm btn-success editbtn"><i class="far fa-edit"></i></button></td>
                                            <td><a class="btn btn-sm btn-danger" href="../EditDataTable?c=xoanhom&idGroup=<%=i.getManhom()%>"><i class="fas fa-trash"></i></a></td>
                                        </tr>
                                        <%}%>
                                    </tbody>
                                </table>
                            </div>
                            <div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab">
                                <table class="table" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>ID KH</th>
                                            <th>Tên người nhận</th>
                                            <th>Số điện thoại</th>
                                            <th>Ngày đặt</th>
                                            <th>Ngày giao</th>
                                            <th>Trạng thái</th>
                                            <th>Xoá</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            tbHoadon tb_hoaDon = new tbHoadon();
                                            Vector<clsHoadon> vCTHD = new Vector<clsHoadon>();
                                            result = tb_hoaDon.TimDSHoadon("", -1, vCTHD);
                                            for (clsHoadon i : vCTHD) {
                                        %>
                                        <tr>
                                            <td><a href="?c=billDetail&id=<%=i.getMahd()%>"><%=i.getMahd()%></a></td>
                                            <td><%=i.getId_customer()%></td>
                                            <td><%=i.getTennguoimua()%></td>
                                            <td><%=i.getDienthoai()%></td>
                                            <td><%=i.getNgaydat()%></td>
                                            <td><%=i.getNgaynhan()%></td>
                                    
                                            <td>
                                                <select name="selectedGroup" class="form-control" onchange="checkGroup(<%=i.getTrangthai()%>,document.getElementById(<%=i.getMahd()%>).value, <%=i.getMahd()%>)" onclick="" id="<%=i.getMahd()%>">
                                                    <%for (int x = 0; x <= 3; x++) {
                                                    %>
                                                    <option value="<%=x%>"<%tb_NhomSP.selectCurrentState(i.getTrangthai(), x, out);%>>
                                                        <%=Dungchung.booleanToString(x, "Chờ thanh toán", "Đã xác nhận", "Đã thanh toán", "Đã huỷ")%>
                                                    </option>
                                                    <%}
                                                    %>
                                                </select>
                                            </td>
                                            <%--<%=Tienich.Dungchung.booleanToString(i.getTrangthai(), "Đã huỷ", "Đã xác nhận", "Đã thanh toán", "Chờ duyệt")%>--%>
                                            <td><a class="btn btn-sm btn-danger" href="../EditBill?c=deleteBill&id=<%=i.getMahd()%>"><i class="fas fa-trash"></i></a></td>
                                        </tr>
                                        <%}%>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</div>
<script>
    $(document).ready(function () {
        $('.editbtn').on('click', function () {
            $('#editGroup').modal('show');

            $tr = $(this).closest('tr');
            var data = $tr.children("td").map(function () {
                return $(this).text();
            }).get();

            $('#inputGroupId').val(data[0]);
            $('#inputGroupName').val(data[1]);
            $('#inputOrderName').val(data[2]);
            $('#inputGroupStatus').val(data[3]);
        });
        $('#addNewGroup').on('click', function () {
            $('#addGroup').modal('show');
        });

    });
</script>
