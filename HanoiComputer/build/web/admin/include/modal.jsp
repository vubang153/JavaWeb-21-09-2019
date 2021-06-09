<%-- 
    Document   : modal
    Created on : Sep 19, 2019, 1:24:42 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="modal fade" id="editGroup" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h3>Sửa nhóm sản phẩm</h3>
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
            </div>
            <div class="modal-body">
                <!-- content goes here -->
                <form action="../EditDataTable?c=suanhom" method="POST">
                    <input type="hidden" class="form-control" id="inputGroupId" name="txtGroupId">

                    <div class="form-group">
                        <label for="inputGroupName">Tên nhóm</label>
                        <input type="text" class="form-control" id="inputGroupName" name="txtGroupName">
                    </div>
                    <div class="form-group">
                        <label for="inputOrderName">Số thứ tự</label>
                        <input type="number" class="form-control" id="inputOrderName" name="txtOrderId">
                    </div>
                    <div class="form-group">
                        <label for="inputGroupStatus">Trạng thái</label>
                        <select name="txtGroupStatus" class="pl-4 pr-4 ml-4 text-center">
                            <option value="1">Mở</option>
                            <option value="0">Đóng</option>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-default">Thay đổi</button>
                </form>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="addGroup" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h3>Thêm nhóm sản phẩm</h3>
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
            </div>
            <div class="modal-body">
                <!-- content goes here -->
                <form action="../EditDataTable?c=themNhom" method="POST">
                    <div class="form-group">
                        <label for="inputGroupName">Tên nhóm</label>
                        <input type="text" class="form-control" id="inputGroupName" name="txtGroupName">
                    </div>
                    <div class="form-group">
                        <label for="inputOrderName">Số thứ tự</label>
                        <input type="number" class="form-control" id="inputOrderName" name="txtOrderId">
                    </div>
                    <div class="form-group">
                        <label for="inputGroupStatus">Trạng thái</label>
                        <select name="txtGroupStatus" class="pl-4 pr-4 ml-4 text-center">
                            <option value="1">Mở</option>
                            <option value="0">Đóng</option>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-default">Thêm mới</button>
                </form>
            </div>
        </div>
    </div>
</div>