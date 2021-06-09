<%-- 
    Document   : carousel
    Created on : Sep 13, 2019, 8:11:12 PM
    Author     : Admin
--%>

<%@page import="Models.clsSubGroup"%>
<%@page import="java.util.Vector"%>
<%@page import="CSDL.tbNhomSP"%>
<%@page import="Models.clsNhomSP"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div id="banner">
    <div id="carousel-slide" class="carousel slide" data-ride="carousel">
        <ul class="carousel-indicators">
            <li data-target="#carousel-slide" data-slide-to="0" class="active"></li>
            <li data-target="#carousel-slide" data-slide-to="1"></li>
            <li data-target="#carousel-slide" data-slide-to="2"></li>
            <li data-target="#carousel-slide" data-slide-to="3"></li>
        </ul>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="img/carousel/carousel13.jpg" >
            </div>
            <div class="carousel-item">
                <img src="img/carousel/carousel14.jpg" >
            </div>
            <div class="carousel-item">
                <img src="img/carousel/carousel15.jpg" >
            </div>
            <div class="carousel-item">
                <img src="img/carousel/carousel16.jpg" >
            </div>
        </div>
    </div>
    <div class="container b-slide-left">
        <div id="menu" class="text-left main_sub_menu">
        <%
            Vector<clsNhomSP> list_group = new Vector<clsNhomSP>();
            tbNhomSP nhom_sp = new tbNhomSP();
            int result1 = nhom_sp.TimNhomSP("", list_group);
            for (clsNhomSP group : list_group) {%>
        <ul>
            <li><a href="index.jsp?keyword&list_group=<%=group.getManhom()%>&min_price=0&max_price=0"><span style="width: 213px;display: inline-block"><%=group.getTenhom()%></span></a><i class="fas fa-chevron-right"></i>
                <ul>
                    <div class="sub_menu main_sub_menu ">
                        <%
                            Vector<clsSubGroup> list_sub_group = new Vector<clsSubGroup>();

                            int result2 = nhom_sp.layDanhSachNhomCon(list_sub_group, group.getManhom());

                            for (clsSubGroup sub_group : list_sub_group) {%>

                        <li><%=sub_group.getTen_nhom_con()%></li>
                            <%}%>
                    </div>	
                </ul>
        </ul>
        <%}%>
    </div>
    </div>	
</div>