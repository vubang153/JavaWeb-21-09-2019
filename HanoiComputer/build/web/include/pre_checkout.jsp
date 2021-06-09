<%-- 
    Document   : pre_checkout
    Created on : Sep 15, 2019, 4:53:08 PM
    Author     : Admin
--%>

<%@page import="Models.clsUser"%>
<%@page import="CSDL.tbUser"%>
<%@page import="CSDL.tbSanpham"%>
<%@page import="Models.clsSanpham"%>
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("user") == null) {
        out.println("<script>alert('Đăng nhập trước khi mua hàng !');window.location.assign('index.jsp?module=login')</script>");
    }
    HashMap<Integer, Integer> cart = (HashMap<Integer, Integer>) session.getAttribute("cart");
    int tongGia = 0;
    clsUser user = new clsUser();
    tbUser tb_user = new tbUser();
    int user_id = Integer.parseInt(session.getAttribute("user_id").toString());
    int rs = tb_user.fullInfoUser(user_id, user);
%>
<div class="container" style="padding-top: 1% !important;background: #f2f2f2; padding-bottom: 1% !important;">
    <div class="row">
        <div class="col-lg-8">
            <div id="checkout_menu">
                <div class="list-header-left"><span class="font-weight-bold pt-4">Sản phẩm</span></div>
                <div class="list-header-middle"><span class="font-weight-bold pt-4">Giá</span></div>
                <div class="list-header-right"><span class="font-weight-bold pt-4">Số lượng</span></div>
            </div>
            <%                
                tbSanpham sp = new tbSanpham();
                for (int i : cart.keySet()) {
                    clsSanpham sanpham = new clsSanpham();
                    int result = sp.TimSanpham(i, sanpham);
            %>
            <div class="checkout_product">
                <div class="list-header-left d-inline-block">
                    <div style="width: 30%" class="d-inline-block"><img src="img/product/product_detail/<%=sanpham.getHinhanh()%>" alt="" class="img-checkout-item">
                    </div>
                    <div style="width: 70%; float:right" class="d-inline-block">
                        <span class="title-checkout-item "><%=sanpham.getTensp()%></span>
                    </div>
                </div>
                <div class="list-header-middle d-inline-block">
                    <span class="price-checkout-item"><%=String.format("%,d đ", sanpham.getGiasp())%></span>
                </div>
                <div class="list-header-right d-inline-block">
                    <span class="quantity-checkout-item"><%=cart.get(i)%></span>
                </div>
            </div>
            <%
                    tongGia += (int) cart.get(i) * sanpham.getGiasp();
                }
            %>
        </div>
        <div class="col-lg-4">
            <div class="row" style="background: white;">
                <div id="wrapper_delivery" class="ml-2 pb-2">
                    <div style="width: 100%;height: 30px;" class="mt-2 text-center bg-danger">
                        <p class="pt-1 text-white">THANH TOÁN</p>
                    </div>
                    <p style="font-size: 1.2em;" class="pt-2 "><i class="fas fa-map-marker-alt" style="color: blue;"></i> Địa chỉ giao hàng</p>
                    <div>                    		
                        <input type="radio" name="address" value="" class="" id="address" checked>
                        <label for="address"><%=user.getAddress()%>
                        </label>
                    </div>
                    <hr>
                    <div>
                        <p style="font-size: 1.2em;" class="pt-2 "><i class="fas fa-phone" style="color: blue;"></i> Thông tin người nhận</p>
                    </div>
                    <div>
                        <p class="pl-4 font-weight-bold">0<%=user.getPhone_number()%></p>
                        <p class="pl-4"><i class="far fa-user text-success"></i> <%=user.getReal_name()%></p>
                    </div>
                    <hr>
                    <div>
                        <p style="font-size: 1.2em;" class="pt-2 "><i class="fas fa-info mr-2" style="color: blue;"></i> Thông tin đơn hàng</p>
                    </div>
                    <div>
                        <span class="pl-2">Tạm tính</span>
                        <b style="padding-left: 35%;font-size: 1.2em;color:red;"><%=String.format("%,d đ", tongGia)%></b>
                    </div>
                    <div class="mt-2">
                        <span class="pl-2">Phí giao hàng</span>
                        <span style="padding-left: 35%">Miễn phí</span>
                    </div>
                    <div class="mt-2">
                        <span class="pl-2 font-weight-bold">Tổng phí</span>
                        <b style="padding-left: 35%;font-size: 1.2em;color:red;"><%=String.format("%,d đ", tongGia)%></b>
                    </div>
                    <div>
                        <a href="cart_checkout">
                            <button type="button" class="btn btn-block btn-danger">ĐẶT HÀNG</button>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>