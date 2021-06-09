<%-- 
    Document   : index
    Created on : Sep 17, 2019, 9:45:08 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta charset="utf-8" />
        <link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
        <link rel="icon" type="image/png" href="assets/img/favicon.png">
        <script src="../js/jquery.js"></script>
        <script src="../js/index.js"></script>
        <script src="../bootstrap/js/bootstrap.min.js"></script>
        <script src="//cdn.ckeditor.com/4.12.1/standard/ckeditor.js"></script>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <title>
            -------------
        </title>
        <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
        <!--     Fonts and icons     -->
        <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
        <link rel="stylesheet"x href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
        <!-- CSS Files -->
        <link href="assets/css/material-dashboard.css?v=2.1.1" rel="stylesheet" />
        <!-- CSS Just for demo purpose, don't include it in your project -->
        <link href="assets/demo/demo.css" rel="stylesheet" />
        <link href="assets/demo/demo.css" rel="stylesheet" />
        <link href="css/style.css" rel="stylesheet" />
        <script src="https://kit.fontawesome.com/fed4770733.js"></script>

    </head>
    <body>
        <%
            RequestDispatcher rd = request.getRequestDispatcher("include/login.jsp");
            if (request.getParameter("c") != null) {
                if (request.getParameter("c").equalsIgnoreCase("login")) {
                    rd.forward(request, response);
                }
            } else if (session.getAttribute("Admin") == null) {
                rd.forward(request, response);
            }
        %>
        <div class="wrapper">

            <%@include file="include/left_menu.jsp" %>
            <div class="main-panel">
                <%@include file="include/navbar.jsp" %>
                <div class="content">
                    <%if (request.getParameter("c") != null) {
                            if (request.getParameter("c").equalsIgnoreCase("profile")) {%>
                    <jsp:include page="include/profile.jsp" />
                    <%} else if (request.getParameter("c").equalsIgnoreCase("addNewProduct")) {%>
                    <jsp:include page="include/add_new_product.jsp" />
                    <%} else if (request.getParameter("c").equalsIgnoreCase("editProduct")) {%>
                    <jsp:include page="include/edit_product.jsp" />
                    <%} else if (request.getParameter("c").equalsIgnoreCase("billDetail")) {%>
                    <jsp:include page="include/bill_detail.jsp" />
                    <%}
                    } else {%>
                    <%--<jsp:include page="include/add_new_product.jsp" />--%>
                    <jsp:include page="include/table.jsp" />
                    <%}%>
                </div>
                <%@include file="include/footer.jsp" %>
            </div>
            <%@include file="include/fixed_plugin.jsp" %>
            <%@include file="include/js_file.jsp" %>
        </div>
        <%@include file="include/modal.jsp" %>
    </body>
</html>

