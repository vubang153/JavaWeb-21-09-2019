<%-- 
    Document   : error
    Created on : Sep 19, 2019, 10:55:07 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%if (request.getParameter("error") != null) {
        if (request.getParameter("error").equalsIgnoreCase("2")) {
            out.println("<script>alert('Nhóm còn tồn tại sản phẩm. Tự động chuyển về trạng thái Đóng')</script>");
        }
    }
%>
