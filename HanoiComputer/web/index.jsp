<%-- 
    Document   : index
    Created on : Sep 6, 2019, 10:40:56 PM
    Author     : Admin
--%>

<%@page import="Tienich.Dungchung"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
        <!-- JQuery -->
        <script src="js/jquery.js" charset="utf-8" async defer></script>
        <!-- Bootstrap -->
        <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css">
        <script src="bootstrap/js/bootstrap.min.js" type="text/javascript" charset="utf-8" async defer></script>
        <!-- Font awesome -->
        <script src="https://kit.fontawesome.com/fed4770733.js"></script>

        <!-- My jquery -->
        <script src="js/index.js" charset="utf-8" async defer></script>

        <!-- My Css -->
        <link rel="stylesheet" type="text/css" href="css/style.css">

    </head>
    <body>
        <%
            Dungchung.outError("", out, request);
            request.setCharacterEncoding("UTF-8");
            String view = "";
            //HashMap<Integer,Integer> cart = (HashMap<Integer,Integer>)session.getAttribute("cart");
            String module = "";
            if (request.getParameter("module") != null) {
                module = request.getParameter("module");
            }
        %>
        <%if (request.getParameter("module") == null) {%>
        <%@include file="include/header_and_carousel.jsp" %> 
        <%} else {
        %>
        <%@include file="include/header.jsp" %>
        <%}%>
        <% if (module.equalsIgnoreCase("checkout")) {
                view = "Thanh toán";%>
        <%@include file="include/pre_checkout.jsp" %>
        <% } else if (module.equalsIgnoreCase("pd")) {
            %>
        <%@include file="include/product_detail.jsp" %>
        <% } else if (module.equalsIgnoreCase("register")) {
            view ="Đăng ký";%>
        <%@include file="include/register.jsp" %>
        <% } else if (module.equalsIgnoreCase("login")) {
            view = "Đăng nhập";
            %>
        <%@include file="include/login.jsp" %>
        <% } else if (module.equalsIgnoreCase("cart")) {
            view = "Giỏ hàng";%>
        <%@include file="include/shopping_cart.jsp" %>
        <% } else if (module.equalsIgnoreCase("checkout_success")) {
            view ="Đặt hàng thành công";%>
        <%@include file="include/check_out.jsp" %>
        <% } else {
          %>
        <%@include file="include/list_product.jsp"%>
        <%--<%@include file="include/check_out.jsp" %>--%>
        <%view = "Trang chủ";
            }
        %>    
        <%@include file="include/footer.jsp" %>
    </body>
    <title><%=view%></title>
</html>
