<%-- 
    Document   : list_product
    Created on : Sep 11, 2019, 6:22:03 PM
    Author     : Admin
--%>

<%@page import="Models.clsNhomSP"%>
<%@page import="CSDL.tbNhomSP"%>
<%@page import="java.util.Vector"%>
<%@page import="Models.clsSanpham"%>
<%@page import="CSDL.tbSanpham"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%  String keyword = "";
    int min_price = 0;
    int max_price = 0;
    int group_item = 0;
    int current_page;
    int ketqua = 0;
    if (request.getParameter("page") == null) {
        current_page = 1;
    } else {
        current_page = Integer.parseInt(request.getParameter("page"));
    }
    tbSanpham tc_bangSanpham = new tbSanpham();
    Vector<clsSanpham> tc_dsSP = new Vector<clsSanpham>();
//    int total_page = tc_ketequa / 12;
//    if (tc_ketequa % 12 != 0) {
//        total_page += 1;
//    }
    int total_page = 0;

    if (request.getParameter("keyword") != null) {
        keyword = request.getParameter("keyword");
        if (request.getParameter("min_price") != null && !request.getParameter("min_price").equalsIgnoreCase("")) {
            min_price = Integer.parseInt(request.getParameter("min_price"));
        }
        if (request.getParameter("max_price") != null && !request.getParameter("max_price").equalsIgnoreCase("")) {
            max_price = Integer.parseInt(request.getParameter("max_price"));
        }
        if (request.getParameter("list_group") != null && !request.getParameter("list_group").equalsIgnoreCase("")) {
            group_item = Integer.parseInt(request.getParameter("list_group"));
        }
        ketqua = tc_bangSanpham.TimDSSanpham(group_item, keyword, min_price, max_price, tc_dsSP, current_page);
        total_page = ketqua / 12;
        if (ketqua % 12 != 0) {
            total_page += 1;
        }
    } else {
        ketqua = tc_bangSanpham.TimDSSanpham(0, tc_dsSP, current_page);
        total_page = ketqua / 12;
        if (ketqua % 12 != 0) {
            total_page += 1;
        }
    }
%>
<div class="container b-product">
    <div class="row title mt-5">
        <div class="col-lg-6">
            <h4 class="text-uppercase font-weight-bold">t???t c??? s???n ph???m</h4>
            <span class="d-inline" style=";font-size: 0.7em;">(T???ng <%=ketqua%> s???n ph???m)
            </span>
        </div>
    </div>
    <div class="row" id="wrapper_list_product">
        <div class="col-lg-3" id="list_menu_product">
            <div class="d-filter-title">L???c s???n ph???m</div>
            <form action="#" method="get" accept-charset="utf-8">
                <input type="hidden" value="" name="keyword">
                <select name="list_group" style="font-size: 0.8em;width: 100%;height: 30px; margin-top: 10px;">
                    <option value="0">Nh??m s???n ph???m</option>
                    <%tbNhomSP list_group = new tbNhomSP();
                        Vector<clsNhomSP> vNhomSP = new Vector<clsNhomSP>();
                        int result = list_group.TimNhomSP("", vNhomSP);
                        for (clsNhomSP group : vNhomSP) {
                    %>
                    <option value="<%=group.getManhom()%>"><%=group.getTenhom()%></option>
                    <%}%>
                </select>
                <div class="d-filter-items">
                    <input type="number" name="min_price" placeholder="Gi?? t???" style="width: 40%;display: inline-block;" min="0" value="0"><span> -</span>
                    <input type="number" name="max_price" placeholder="Gi?? ?????n" style="width: 40%;display: inline-block;" min="0" value="0">
                    <button type="submit" style="width: 12%; max-width: 30px;max-height: 30px;border: 1px solid red" class="btn-danger"><i class="fas fa-play"></i></button>
                </div>
            </form>
            <div class="d-filter-item">h??ng s???n xu???t</div>
            <div class="d-filter-item">lo???i gi??</div>
            <div class="d-filter-item">lo???i ram</div>
            <div class="d-filter-item">cpu</div>
            <div class="d-filter-item">Ki???u tai nghe</div>
            <div class="d-filter-item">t??nh n??ng</div>
            <div class="d-filter-item">d??ng cpu</div>
            <div class="d-filter-item">ch???t li???u</div>
            <div class="d-filter-item">hdd</div>
            <div class="d-filter-item">ram</div>
            <div class="d-filter-item">vga</div>
            <div class="d-filter-item">chi???u cao</div>
            <div class="d-filter-item">form case</div>
            <div class="d-filter-item">m??n h??nh</div>
            <div class="d-filter-item">dvd</div>
            <div class="d-filter-item">ch???ng lo???i</div>
            <div class="d-filter-item">Ngu???n</div>
            <div class="d-filter-item">chipset</div>
            <div class="d-filter-item">h??? ??i???u h??nh</div>
            <div class="d-filter-item">????? ph??n gi???</div>
            <div class="d-filter-item">wifi</div>
            <div class="d-filter-item">socket</div>
            <div class="d-filter-item">Kh??? gi???y</div>
        </div>
        <div class="col-lg-9" id="list_product">
            <div id="sort_menu" class="pt-2 col-lg-12">
                <span class="pl-2">S???p x???p theo: </span>
                <select name="sort_product" class="ml-2">
                    <option value="0" onclick="window.location.href = 'http://www.hyperlinkcode.com/button-links.php'">M???i nh???t</option>
                    <option value="1">Gi?? t??ng d???n</option>
                    <option value="2">Gi?? gi???m d???n</option>
                </select>
            </div>
            <div class="col-lg-12" id="cate_list_item">
                <div class="row">
                <%
                    if (ketqua == -1)
                        out.println("<h3> L???I K???T N???I CSDL</h3>");
                    else if (ketqua == -2)
                        out.println("<h3> L???I TRUY V???N CSDL SQL</h3>");
                    else if (ketqua == 0)
                        out.println("<h3> CH??A C?? S???N PH???M</h3>");
                    else {
                        for (clsSanpham sp : tc_dsSP) {%>
                    <div class="col-lg-4 col-md-4 col-sm-12  p-item">
                         <a href="index.jsp?module=pd&id=<%=sp.getId()%>">
                        <p class="p-item-product-id">M?? SP: <%=sp.getId()%></p>
                        <div style="width: 100%; height: 166px;text-align: center">
                            <img class="p-item-img" src="img/product/product_detail/<%=sp.getHinhanh()%>" alt="">
                        </div>
                        <div style="height: 100px;overflow: hidden">
                            <p class="p-item-title"><%=sp.getTensp()%></p>
                        </div>
                        <div>
                            <p class="p-item-price"><%=String.format("%,d ??", sp.getGiasp())%>
                            </p>
                        </div>
                         </a>
                    </div>
                <% }
                    }%>
            </div>
            </div>
            <div class="col-sm-12 col-md-12 col-lg-12" id="pagination">
                <div>
                    <%if (current_page != 1) {%>
                    <span class="page-number">
                        <a href="index.jsp?page=<%=current_page - 1%>">Quay v???</a>
                    </span>
                    <%}%>
                    <span class="page-number">
                        <a href="index.jsp?page=1">1</a>
                    </span>
                    <%for (int i = total_page - current_page + 3; i <= total_page - 1; i++) {%>
                    <span class="page-number">
                        <a href="index.jsp?page=<%=i%>"><%=i%></a>
                    </span>
                    <%}%>
                    <%if (current_page != total_page) {%>
                    <span class="page-number">
                        <a href="index.jsp?page=<%=current_page + 1%>&keyword=<%=keyword%>&list_group=<%=group_item%>&min_price=<%=min_price%>&max_price=<%=max_price%>">Trang ti???p</a>
                    </span>
                    <%}%>
                </div>
            </div>
        </div>
    </div>
</div>
