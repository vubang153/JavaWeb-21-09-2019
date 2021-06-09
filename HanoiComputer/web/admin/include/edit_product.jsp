<%-- 
    Document   : add_new_product
    Created on : Sep 20, 2019, 10:16:47 PM
    Author     : Admin
--%>

<%@page import="Models.clsSanpham"%>
<%@page import="CSDL.tbSanpham"%>
<%@page import="java.util.Vector"%>
<%@page import="Models.clsNhomSP"%>
<%@page import="CSDL.tbNhomSP"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%tbSanpham tb_sanpham = new tbSanpham();
    clsSanpham sp = new clsSanpham();
    int id = Integer.parseInt(request.getParameter("id"));
    int result = tb_sanpham.TimSanpham(id, sp);
    if (result != 1) {
        out.println("<h3>LỖI KHÔNG XÁC ĐỊNH</h3>");
    } else {
%>
<div class="card">
    <div class="card-header card-header-primary">
        <h4 class="card-title ">SỬA SẢN PHẨM</h4>
        <p class="card-category">Data table</p>
    </div>
    <div class="card-body">
        <section id="tabs" class="project-tab">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <form enctype = "multipart/form-data" action="../EditProduct" method="POST" enctype="multipart/form-data">
                            <input type="hidden" name="inputProductKey" value="<%=sp.getId()%>">
                            <div class="form-group">
                                <label for="inputProductId">Mã sản phẩm</label>
                                <small class="form-text text-muted">Ví dụ: SP5</small>
                                <input type="text" class="form-control" id="inputProductId" aria-describedby="emailHelp" name="inputProductId" value="<%=sp.getMasp()%>" required>
                            </div>
                            <div class="form-group">
                                <label for="inputProductName">Tên sản phẩm</label>
                                <small class="form-text text-muted">Ví dụ: Mainboard ....</small>
                                <input type="text" class="form-control" id="inputProductName" name="inputProductName" value="<%=sp.getTensp()%>" required>
                            </div>
                            <div class="form-group">
                                <label for="inputProductPrice">Giá sản phẩm</label>
                                <small class="form-text text-muted">Ví dụ: 2900000</small>
                                <input type="number" class="form-control" id="inputProductPrice" name="inputProductPrice" value="<%=sp.getGiasp()%>" required>
                            </div>
                            <div class="form-group">
                                <label for="inputProductGroup">Nhóm sản phẩm</label>
                                <select name="inputProductGroup" class="form-control" id="inputProductGroup">
                                    <%tbNhomSP tb_nhomSP = new tbNhomSP();
                                        Vector<clsNhomSP> v_nhomSP = new Vector<clsNhomSP>();
                                        tb_nhomSP.TimNhomSP("", v_nhomSP);
                                        for (clsNhomSP i : v_nhomSP) {
                                            if (i.getManhom() == sp.getManhom()) {%>
                                    <option value="<%=i.getManhom()%>" selected><%=i.getTenhom()%></option>

                                    <%} else {
                                    %>
                                    <option value="<%=i.getManhom()%>"><%=i.getTenhom()%></option>
                                    <%}
                                        }%>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="inputProductImage" class="btn btn-outline-danger">Chọn hình ảnh</label>
                                <input type="file" name="inputProductImage" id="inputProductImage">
                                <input type="hidden" name="inputProductOldImage" value="<%=sp.getHinhanh()%>">
                                
                            </div>
                            <div class="form-group">
                                <textarea class="ckeditor" name="inputProductDetails" cols="80" rows="10">
                                    <%=sp.getNoidung()%>
                                </textarea>
                            </div>
                            <button type="submit" class="btn btn-primary" name="submit" value="1">Submit</button>
                        </form>
                    </div>
                </div>
            </div>
        </section>
    </div>
</div>
<%}%>