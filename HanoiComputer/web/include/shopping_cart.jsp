<%-- 
    Document   : shopping_cart
    Created on : Sep 8, 2019, 9:08:00 AM
    Author     : Admin
--%>

<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("user") == null) {
        out.println("<script>alert('Đăng nhập trước khi mua hàng !');window.location.assign('index.jsp?module=login')</script>");
    }
    HashMap<Integer, Integer> cart = (HashMap<Integer, Integer>) session.getAttribute("cart");
    if (cart == null) { %>
<%@include file="blank_shopping_cart.jsp" %>
<%} else {%>
<%@include file="cart.jsp" %>
<%}%>

