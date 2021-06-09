<%-- 
    Document   : login
    Created on : Sep 6, 2019, 10:44:55 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (request.getParameter("s") != null) {
        if (request.getParameter("s").equalsIgnoreCase("f")) {
            out.println("<script>alert('Sai tài khoản hoặc mật khẩu')</script>");
        }
    }
    String user = "";
    String password = "";
    Cookie[] cookies = null;
    // Lấy mảng Cookies gắn với website này
    cookies = request.getCookies();
    if (cookies != null) {
        for (int i = 0; i < cookies.length; i++) {
            if (cookies[i].getName().equalsIgnoreCase("taikhoan")) {
                user = cookies[i].getValue();
            }
            if (cookies[i].getName().equalsIgnoreCase("matkhau")) {
            }
            password = cookies[i].getValue();
        }
    }
%>
<div class="container" id="LoginForm">
    <div class="row">
        <div class="col-lg-12 p-0" id="login_title_bar">
            <span class="bg-danger text-center text-uppercase font-weight-bold">
                Đăng nhập
            </span>
        </div>
    </div>
    <div class="row">   
        <div class="col-lg-6 p-0 pt-2">
            <table>
                <thead>
                    <tr>
                        <td colspan="2">Thông tin khách hàng đăng nhập hệ thống</td>
                    </tr>
                </thead>
                <tbody>
                <form action="XuLyDangNhap" method="POST" accept-charset="utf-8">
                    <tr>
                        <td><label for="txtUsername">Email đăng nhập</label></td>
                        <td><input type="text" required name="txtUsername" value="<%=user%>" placeholder="" class="input-size-text" id="txtUsername">
                            <p id="usernameError" class="error"></p></td>
                    </tr>
                    <tr>
                        <td><label for="txtPassword">Mật khẩu</label></td>
                        <td><input type="password" required name="txtPassword" value="<%=password%>" placeholder="" class="input-size-text" id="txtPassword"><p id="passwordError" class="error"></p></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type="checkbox" id="saveLoginCookies" name="saveLoginCookies" value="1" style="width: 15px;"> <label for="saveLoginCookies">Ghi nhớ đăng nhập</label></td>
                    </tr>
                    </tbody>
                    <tfoot>
                        <tr>
                            <td></td>
                            <td><button class="btn btn-danger p-1" type="submit">Đăng nhập</button></td>
                        </tr>
                    </tfoot>
                </form>

            </table>
        </div>
        <div class="col-lg-6">
            <span>Bạn chưa là thành viên ?</span>
            <p class="m-0">Đăng ký là thành viên để hưởng nhiều lợi ích và đặt mua hàng dễ dàng hơn.
            </p>
            <a class="font-weight-bold text-danger" href="index.jsp?module=register">Đăng kí tài khoản ngay</a>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-7 p-2" style="border: 1px solid #ccc;">
            <b class="text-danger text-uppercase">Tổng đài trợ giúp</b>
            <p class="text-uppercase pt-1 font-weight-bold">Nhanh chóng - tiện lợi - hài lòng</p>
            <hr>
            <p><i class="fas fa-phone"><small> Chăm sóc khách hàng: 19001903 phím 0 (8h-17h30)
                    </small>
                </i>
            </p>
            <p><i class="fas fa-phone"><small> Mua hàng trực tuyến: 19001903 phím 1 (8h-21h30)

                    </small>
                </i>
            </p>
            <p><i class="fas fa-phone"><small> Bán hàng doanh nghiệp: 19001903 phím 1​57

                    </small>
                </i>
            </p>
            <p><i class="fas fa-phone"><small> Kỹ thuật: 19001903 phím 2 (8h-21h30)

                    </small>
                </i>
            </p>
            <p><i class="fas fa-phone"><small> Bảo hành: 19001903 phím 3 (8h-19h)


                    </small>
                </i>
            </p>
            <p class="text-uppercase pt-1 font-weight-bold">Góp ý - thắc mắc - khiếu nại</p>
            <hr>
            <p><i class="fas fa-envelope"></i><small>Email: vubang151@gmail.com</small></p>
            <p><i class="fas fa-headphones"></i><small> Tổng đài: 1900.1903, ấn phím 0 
                </small></p>
            <p><i class="fas fa-mobile-alt"></i><small> Hotline: 097.858.0088
                </small></p>

        </div>
        <div class="col-lg-5">
        </div>
    </div>
</div>
