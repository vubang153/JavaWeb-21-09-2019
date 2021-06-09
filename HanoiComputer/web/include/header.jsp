<%-- 
    Document   : header
    Created on : Sep 6, 2019, 10:33:35 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Header menu -->
<div class="container bg-transparent b-top">
    <div class="row" id="header_bar_link">
        <div class="col-lg-4">
        </div>
        <div class="col-lg-8 col-xs-8">
            <ul class="text-uppercase">
                <li><a href="#">chăm sóc khách hàng</a></li>
                <li><a href="">kiểm tra đơn hàng</a></li>
                    <%if (session.getAttribute("user") == null) {%>
                <li><a href="index.jsp?module=login">đăng nhập</a></li>
                <li><a href="index.jsp?module=register">đăng kí</a></li>
                    <%} else {%>
                <li style="color:red;">xin chào, <%=session.getAttribute("user")%></li>
                <li><a href="XuLyDangNhap?action=logout">đăng xuất</a></li>
                    <%}%>
            </ul>
        </div>
    </div>
</div>
<div class="container sticky-top b-bottom">
    <div class="row bg-white align-content-center">
        <div class="col-lg-3">
            <a href="index.jsp">
                <img src="img/logo-2019.png" alt="logo" id="logo">
            </a>
        </div>
        <div class="col-lg-9">
            <form action="#" method="get" accept-charset="utf-8">
                <input type="text" name="keyword" placeholder="Tìm kiếm sản phẩm" class="bg-faded input-size-text">
                <button type="submit" class="btn btn-danger btn-sm">
                    <span class="fas fa-search"> Tìm kiếm</span>
                </button>
                <a href="?module=cart">
                    <span class="fas fa-cart-plus text-danger"></span>
                </a>
            </form>
        </div>
    </div>
</div>
