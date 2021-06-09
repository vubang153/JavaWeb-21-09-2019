<%-- 
    Document   : add_new_product
    Created on : Sep 20, 2019, 10:16:47 PM
    Author     : Admin
--%>

<%@page import="java.util.Vector"%>
<%@page import="Models.clsNhomSP"%>
<%@page import="CSDL.tbNhomSP"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="card">
    <div class="card-header card-header-primary">
        <h4 class="card-title ">THÊM MỚI SẢN PHẨM</h4>
        <p class="card-category">Data table</p>
    </div>
    <div class="card-body">
        <section id="tabs" class="project-tab">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <form enctype = "multipart/form-data" action="../AddNewProduct" enctype="multipart/form-data" method="POST">
                            <div class="form-group">
                                <label for="inputProductId">Mã sản phẩm</label>
                                <small class="form-text text-muted">Ví dụ: SP5</small>
                                <input type="text" class="form-control" id="inputProductId" aria-describedby="emailHelp" name="inputProductId" required>
                            </div>
                            <div class="form-group">
                                <label for="inputProductName">Tên sản phẩm</label>
                                <small class="form-text text-muted">Ví dụ: Mainboard ....</small>
                                <input type="text" class="form-control" id="inputProductName" name="inputProductName" required>
                            </div>
                            <div class="form-group">
                                <label for="inputProductPrice">Giá sản phẩm</label>
                                <small class="form-text text-muted">Ví dụ: 2900000</small>
                                <input type="number" class="form-control" id="inputProductPrice" name="inputProductPrice" required>
                            </div>
                            <div class="form-group">
                                <label for="inputProductGroup">Nhóm sản phẩm</label>
                                <select name="inputProductGroup" class="form-control" id="inputProductGroup">
                                    <%tbNhomSP tb_nhomSP = new tbNhomSP();
                                        Vector<clsNhomSP> v_nhomSP = new Vector<clsNhomSP>();
                                        tb_nhomSP.TimNhomSP("", v_nhomSP);
                                        for (clsNhomSP i : v_nhomSP) {
                                    %>
                                    <option value="<%=i.getManhom()%>"><%=i.getTenhom()%></option>
                                    <%}%>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="inputProductImage" class="btn btn-outline-danger">Chọn hình ảnh</label>
                                <input type="file" name="inputProductImage" id="inputProductImage" required>
                            </div>
                            <div class="form-group">
                                <textarea class="ckeditor" name="inputProductDetails" cols="80" rows="10" required>
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