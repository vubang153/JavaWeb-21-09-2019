<%-- 
    Document   : bill_detail
    Created on : Sep 24, 2019, 8:08:57 AM
    Author     : Admin
--%>

<%@page import="Models.clsSanpham"%>
<%@page import="CSDL.tbSanpham"%>
<%@page import="java.util.Vector"%>
<%@page import="Models.clsChitietHoadon"%>
<%@page import="Tienich.Dungchung"%>
<%@page import="CSDL.tbHoadon"%>
<%@page import="CSDL.tbChitietHoadon"%>
<%@page import="Models.clsHoadon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    int bill_id = Integer.parseInt(request.getParameter("id"));
    clsHoadon hd = new clsHoadon();
    tbHoadon tb_hd = new tbHoadon();
    tbChitietHoadon tb_cthd = new tbChitietHoadon();
    int result = tb_hd.searchBIll(bill_id, hd);
    Vector<clsChitietHoadon> dsCTHD = new Vector<clsChitietHoadon>();
    tb_cthd.TimDSChitietHoadon(bill_id, dsCTHD);
%>
<div class="card">
    <div class="card-header card-header-primary">
        <h4 class="card-title ">THÔNG TIN CHI TIẾT HOÁ ĐƠN</h4>
        <p class="card-category">Bill detail</p>
    </div>
    <div class="card-body">
        <div class="container-fluid wrapper-bill-detail">
            <div class="row">
                <div class="col-lg-4 info-bill">
                    <h3 class="text-center font-weight-bold">THÔNG TIN HOÁ ĐƠN</h3>
                    <hr>
                    <p>Mã hoá đơn: <%=hd.getMahd()%></p>
                    <p>Tên người đặt: <%=hd.getTennguoimua()%></p>
                    <p>Số điện thoại: <%=hd.getDienthoai()%></p>
                    <p>Ngày đặt: <%=hd.getNgaydat()%></p>
                    <p>Ngày nhận: <%=hd.getNgaynhan()%></p>
                    <p>Trạng thái: <%=Dungchung.booleanToString(hd.getTrangthai(), "Chờ thanh toán", "Đã xác nhận", "Đã thanh toán", "Đã huỷ")%></p>
                </div>
                <div class="col-lg-8 list-product-bill">
                    <table class="bill-table table" cellspacing="0">
                        <thead>
                            <tr>
                                <th>STT</th>
                                <th>ID Sản phẩm</th>
                                <th>Tên sản phẩm</th>
                                <th>Hình ảnh</th>
                                <th>Giá mua</th>
                                <th>Số lượng</th>
                                <th>Thành tiền</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                int stt = 0;
                                for (clsChitietHoadon cthd : dsCTHD) {
                                    stt++;
                                    tbSanpham bangSP = new tbSanpham();
                                    clsSanpham sp = new clsSanpham();
                                    result= bangSP.TimSanpham(cthd.getIdsp(), sp);
                                    String tensp = "";
                                    String anhsp = "";
                                    if (result != 1) {
                                        out.println("<h3>Lỗi tìm sản phẩm: " + cthd.getIdsp() + "<h3>");
                                    } else {
                                        tensp = sp.getTensp();
                                        anhsp = sp.getHinhanh();
                                    }
                            %>
                            <tr>
                                <td><%=stt%></td>
                                <td><%=cthd.getIdsp()%></td>
                                <td><%=tensp%></td>
                                <td><img src="../img/product/product_detail/<%=anhsp%>" width="50"></td>
                                <td><%=String.format("%,d VND", cthd.getGiamua())%></td>
                                <td><%=cthd.getSoluong()%></td>
                                <td><%=String.format("%,d VND", cthd.getGiamua() * cthd.getSoluong())%></td>
                            </tr>   
                            <%
                                }//đóng for chi tiết hóa đơn
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
