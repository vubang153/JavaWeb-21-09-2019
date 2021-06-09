<%-- 
    Document   : register
    Created on : Sep 9, 2019, 9:14:34 PM
    Author     : Admin
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="container">
    <div class="row">
        <div class="col-lg-12 location" style="background: white;">
            <a href="#">Trang chủ</a>
            <span> / </span>
            <a href="#" style="color: #A9E2EE">Đăng kí</a>
        </div>
    </div>
    <div class="row title mt-5">
        <div class="col-lg-2">
            <h4 class="text-uppercase font-weight-bold">Đăng kí</h4>
        </div>
    </div>
    <div class="row" id="register_table">
        <form action="XuLyDangKy" method="POST" class="col-lg-12">
            <table class="col-lg-10">
                <thead>
                    <tr>
                        <td colspan="2"><p>Tạo tài khoản khách hàng cá nhân</p></td>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Tài khoản đăng kí*</td>
                        <td><input type="text" name="info[account]" required>
                        </td>
                    </tr>
                    <tr>
                        <td>Tên*</td>
                        <td><input type="text" name="info[name]" required="">
                        </td>
                    </tr>
                    <tr>
                        <td>Số điện thoại</td>
                        <td><input type="text" name="info[phone_number]" required="">
                        </td>
                    </tr>
                    <tr>
                        <td>Giới tính*</td>
                        <td>
                            <input type="radio" name="info[sex]" value="1" id="sex_male" required=""><label for="sex_male" style="margin-bottom: 0;"> Nam</label>
                            <input type="radio" name="info[sex]" value="2" id="sex_female" required=""><label for="sex_female" style="margin-bottom: 0;"> Nữ</label>
                        </td>
                    </tr>
                    <tr>
                        <td>Ngày sinh</td>
                        <td>
                            <input type="date" name="info[birthday]" required>
                        </td>
                    </tr>
                    <tr>
                        <td>Mật khẩu*</td>
                        <td><input type="password" name="info[password]" value="" required></td>
                    </tr>
                    <tr>
                        <td>Địa chỉ</td>
                        <td>
                            <input type="text" name="info[address]" value="" placeholder="" required="">
                        </td>
                    </tr>
                    <tr>
                        <td>Tỉnh thành phố</td>
                        <td>
                            <select name="info[province]">

                                <option value="1">Hà nội</option>

                                <option value="2">TP HCM</option>

                                <option value="5">Hải Phòng</option>

                                <option value="4">Đà Nẵng</option>

                                <option value="6">An Giang</option>

                                <option value="7">Bà Rịa-Vũng Tàu</option>

                                <option value="13">Bình Dương</option>

                                <option value="15">Bình Phước</option>

                                <option value="16">Bình Thuận</option>

                                <option value="14">Bình Định</option>

                                <option value="8">Bạc Liêu</option>

                                <option value="10">Bắc Giang</option>

                                <option value="9">Bắc Kạn</option>

                                <option value="11">Bắc Ninh</option>

                                <option value="12">Bến Tre</option>

                                <option value="18">Cao Bằng</option>

                                <option value="17">Cà Mau</option>

                                <option value="3">Cần Thơ</option>

                                <option value="24">Gia Lai</option>

                                <option value="25">Hà Giang</option>

                                <option value="26">Hà Nam</option>

                                <option value="27">Hà Tĩnh</option>

                                <option value="30">Hòa Bình</option>

                                <option value="28">Hải Dương</option>

                                <option value="29">Hậu Giang</option>

                                <option value="31">Hưng Yên</option>

                                <option value="32">Khánh Hòa</option>

                                <option value="33">Kiên Giang</option>

                                <option value="34">Kon Tum</option>

                                <option value="35">Lai Châu</option>

                                <option value="38">Lào Cai</option>

                                <option value="36">Lâm Đồng</option>

                                <option value="37">Lạng Sơn</option>

                                <option value="39">Long An</option>

                                <option value="40">Nam Định</option>

                                <option value="41">Nghệ An</option>

                                <option value="42">Ninh Bình</option>

                                <option value="43">Ninh Thuận</option>

                                <option value="44">Phú Thọ</option>

                                <option value="45">Phú Yên</option>

                                <option value="46">Quảng Bình</option>

                                <option value="47">Quảng Nam</option>

                                <option value="48">Quảng Ngãi</option>

                                <option value="49">Quảng Ninh</option>

                                <option value="50">Quảng Trị</option>

                                <option value="51">Sóc Trăng</option>

                                <option value="52">Sơn La</option>

                                <option value="53">Tây Ninh</option>

                                <option value="56">Thanh Hóa</option>

                                <option value="54">Thái Bình</option>

                                <option value="55">Thái Nguyên</option>

                                <option value="57">Thừa Thiên-Huế</option>

                                <option value="58">Tiền Giang</option>

                                <option value="59">Trà Vinh</option>

                                <option value="60">Tuyên Quang</option>

                                <option value="61">Vĩnh Long</option>

                                <option value="62">Vĩnh Phúc</option>

                                <option value="63">Yên Bái</option>

                                <option value="19">Đắk Lắk</option>

                                <option value="22">Đồng Nai</option>

                                <option value="23">Đồng Tháp</option>

                                <option value="21">Điện Biên</option>

                                <option value="20">Đăk Nông</option>
                            </select>
                        </td>
                    </tr>
                </tbody>
                <tfoot>
                    <tr>
                        <td></td>
                        <td>
                            <input type="submit" name="" value="Đăng kí" class="btn btn-danger" style="width: 150px;">
                        </td>
                    </tr>
                </tfoot>
            </table>
        </form>
    </div>
</div>