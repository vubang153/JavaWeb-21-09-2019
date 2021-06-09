<%-- 
    Document   : product_detail
    Created on : Sep 7, 2019, 8:41:16 AM
    Author     : Admin
--%>

<%@page import="Models.clsSanpham"%>
<%@page import="CSDL.tbSanpham"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%int id = 0;
    if (request.getParameter("id") != null) {
        id = Integer.parseInt(request.getParameter("id"));
    }
    tbSanpham bangSanpham = new tbSanpham();
    clsSanpham sp = new clsSanpham();
    int ketqua = bangSanpham.TimSanpham(id, sp);
    if (ketqua == -1)
        out.println("<h3> LỖI KẾT NỐI CSDL</h3>");
    else if (ketqua == -2)
        out.println("<h3> LỖI TRUY VẤN CSDL SQL</h3>");
    else if (ketqua == 0)
        out.println("<h3> CHƯA CÓ SẢN PHẨM</h3>");

    else {
%>

<div class="container">
    <div class="row">
        <div class="col-lg-12 location">
            <a href="">
                <i class="fas fa-home" style="color: #000"></i>
            </a>
            <span>»</span>
            <a href="#">Linh kiện máy tính</a>
        </div>
    </div>
    <div class="row" id="pro_detail_page" style="margin-top: 2%;">
        <div class="col-lg-4" id="product_detail">
            <img src="img/product/product_detail/<%=sp.getHinhanh()%>" alt="" class="img_product border-ccc mt-3">
            <div id="wrapper-shop-info" class="border-ccc mt-3">
                <ul class="col-lg-6 mt-3">
                    <li><i class="fab fa-skype"></i> Mr Đạt: 0964740880</li>
                    <li><i class="fab fa-skype"></i> Mr Long: 0984789552</li>
                    <li><i class="fab fa-skype"></i> Mr Lâm: 0163852147</li>
                    <li><i class="fab fa-skype"></i> Mr Liên: 0356874145</li>
                    <li><i class="fab fa-skype"></i> Mr Sang: 0984693258</li>
                </ul>
                <ul class="col-lg-6 mt-3">
                    <li><i class="fab fa-skype"></i> Mr Ngô: 0178256474</li>
                    <li><i class="fab fa-skype"></i> Mr Trần: 0984256874</li>
                    <li><i class="fab fa-skype"></i> Mr Đức: 0978145222</li>
                    <li><i class="fab fa-skype"></i> Mr Tứ: 0915625555</li>
                    <li><i class="fab fa-skype"></i> Mr Trịnh: 0964740222</li>
                </ul>
            </div>				
        </div>
        <div class="col-lg-6 pt-3">
            <b><%=sp.getTensp()%>
            </b>
            <p class="pt-2">Mã sản phẩm: <span class="text-danger font-weight-bold"><%=sp.getMasp()%></span></p>
            <hr>
            <b>Kho hàng</b>
            <p class="pl-4 text-danger">- 129+131 Lê Thanh Nghị - HBT - Hà Nội
            </p>
            <p class="pl-4 text-danger">- 43 Thái Hà - Đống Đa - Hà Nội
            </p>
            <b>Thông tin sản phẩm</b>
            <%=sp.getNoidung()%>
            <p style="font-family: Anton; font-size: 3.5em"><%=String.format("%,d đ", sp.getGiasp())%></p>
            <div class="btn btn-group">
                <a href="add_to_cart?id=<%=sp.getId()%>"><button type="button" class="btn btn-warning"><span class="text-uppercase font-weight-bold">Cho vào giỏ</span><small style="display: block">Cho giao hàng nhanh chóng</small></button></a>
                <a href="add_to_cart?id=<%=sp.getId()%>"><button type="button" class="btn btn-danger pl-3 pr-3"><span class="text-uppercase font-weight-bold ">Đặt mua ngay</span><small style="display: block">Cho vào giỏ để chọn tiếp</small></button></a>
            </div>
        </div>
        <div class="col-lg-2" style="background: #fafafa;">
            <small class="font-weight-bold">Tuỳ chọn giao hàng</small>
            <p class="pt-1" style="font-size: 0.9em;"><i class="fas fa-map-marker-alt p-"></i> Hồ Chí Minh,Quận 1,Phường Phạm Ngũ Lão</p>
            <hr>
            <p><i class="fas fa-truck"></i> GH Tiêu chuẩn</p>
            <b class="pl-4">11.000đ</b>
            <small style="display: inline-block;" class="pl-4">Giao hàng từ 8/9 - 10/9</small>
            <p class="pt-2"><i class="fas fa-money-bill-wave"></i> Thanh toán khi nhận hàng</p>
            <hr>
            <small class="pl-3">Đổi trả và bảo hành</small>
            <p class="pb-2"><i class="far fa-calendar"></i> 14 ngày trả hàng
            </p>
            <p><i class="fas fa-shield-alt"></i> Không áp dụng chính sách bảo hành
            </p>
        </div>
    </div>
</div>
            <title><%=sp.getTensp()%></title>
<%}%>