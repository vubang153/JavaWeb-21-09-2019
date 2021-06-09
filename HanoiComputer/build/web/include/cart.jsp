<%-- 
    Document   : cart
    Created on : Sep 14, 2019, 12:01:28 AM
    Author     : Admin
--%>

<%@page import="java.util.HashMap"%>
<%@page import="Models.clsSanpham"%>
<%@page import="CSDL.tbSanpham"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% int tongGia = 0;
%>
<div class="container">
    <!-- Link menu-->
    <div class="row">
        <div class="col-lg-12 location" style="background: white;">
            <a href="#">Trang chủ</a>
            <span> / </span>
            <a href="#" style="color: #A9E2EE">Giỏ hàng của bạn</a>
        </div>
        <!-- Title , back to menu button and delete cart -->
        <div class="col-lg-12">
            <form action="update_cart" method="get" accept-charset="utf-8">
                <div class="col-lg-12" id="shopping_cart">
                    <div class="cart-title row">
                        <h4 class="text-uppercase pl-2">Thông tin giỏ hàng</h4>
                    </div>
                    <div>
                        <div class="cart-item row">
                            <div class="col-lg-12 mt-2">
                                <button type="button" class="btn btn-danger p-2 b-1"><a href="index.jsp" style="color: white;">< Tiếp tục mua hàng</a>
                                </button>
                                <button type="button" class="btn btn-secondary p-2 b-1" style="float:right" onclick="return confirm('Bạn chắc chắn muốn xoá toàn bộ giỏ hàng ?');"><a href="delete_cart?a=destroycart">Xoá giỏ hàng</a>
                                </button>
                                <button type="submit" style="margin-bottom: 10px;
                                        padding: 0 10px;
                                        display: inline-block;
                                        color: #fff;
                                        min-width: 180px;
                                        " class="btn btn-success p-2 b-1">CẬP NHẬT
                                </button>
                            </div>
                        </div>
                        <!-- Production list  -->
                        <%
                            tbSanpham sp = new tbSanpham();
                            for (int i : cart.keySet()) {
                                clsSanpham sanpham = new clsSanpham();
                                int result = sp.TimSanpham(i, sanpham);
                        %>
                        <div class="shopping-cart-item-wrapper row">
                            <div class="col-lg-2">
                                <img src="img/product/product_detail/<%=sanpham.getHinhanh()%>" alt="" class="shopping-cart-product-img mb-4">
                            </div>
                            <div class="col-lg-7">
                                <b><%=sanpham.getTensp()%></b>
                                <b>Mã sản phẩm: <span><%=sanpham.getMasp()%></span></b>

                                <b>Bảo hành: <span>12 tháng</span></b>
                                <button type="button" onclick="return confirm('Bạn muốn xoá sản phẩm này chứ ?');" class="btn btn-danger" style="min-width: 0;">
                                    <i class="fas fa-trash"></i>
                                    <a href="delete_cart?id=<%=sanpham.getId()%>" style="color: #fff;">
                                        <small>Xoá khỏi giỏ hàng</small>
                                    </a>    
                                </button>
                            </div>
                            <div class="col-lg-3">
                                <b style="font-size: 1.3em;"><%=String.format("%,d đ", sanpham.getGiasp())%></b>
                                <div>
                                    <button type="button" class="button-quantity" onclick="giamSoLuong('quantity_<%=sanpham.getId()%>')">-</button>
                                    <input type="text" name="quantity_<%=sanpham.getId()%>" id="quantity_<%=sanpham.getId()%>" value="<%=cart.get(i)%>" class="text-center shopping-quantity" size="1" readonly>
                                    <button type="button" class="button-quantity" onclick="tangSoLuong('quantity_<%=sanpham.getId()%>')">+</button>
                                </div>
                            </div>
                        </div>
                        <%
                                tongGia += (int) cart.get(i) * sanpham.getGiasp();
                            }
                        %>

                    </div>
                    <!-- Total price and payment button -->
                    <div class="col-lg-12" id="total_price">
                        <b>Tổng tiền đơn hàng: <strong class="font-weight-bold" style="font-size: 1.5em;color: red;"><%=String.format("%,d đ", tongGia)%></strong></b>
                    </div>
                    <div class="col-lg-12">
                        <button type="submit" name="submit" class="btn btn-danger" value="checkout" style="margin:0 0 1% 70%;;padding: 10px 90px 10px 90px">THANH TOÁN</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
