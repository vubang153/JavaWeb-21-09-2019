<%-- 
    Document   : check_out
    Created on : Sep 16, 2019, 3:37:12 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="container" style="margin-top: 1% !important;">
    <div class="row">
        <div id="wrapper_check_out_success">
            <div class="wrapper_check_out_success_child">
                <div class="check-out-success-thank">
                    <div class="pt-3 text-danger" style=";background: white;">
                        <i class="far fa-clock " style="font-size: 4em;"></i><span class="font-weight-bold pb-5 pl-2" style="font-size: 2em;">Cảm ơn bạn đã mua hàng</span>
                    </div>
                    <p class="font-weight-bold">Mã đơn hàng của bạn là: <span class="text-danger"><%=request.getParameter("orderId")%></span></p>
                    <p>Bạn có thể theo dõi đơn hàng tại
                        <a href="">
                            <b class="pl-2">Tài khoản của tôi > Đơn hàng của tôi
                            </b>
                        </a>
                    </p>
                </div>
            </div>
            <div class="wrapper_check_out_success_child pb-2">
                <p>Vui lòng chuẩn bị số tiền tương ứng:</p>
                <p class="font-weight-bold text-danger" style="font-size: 2em;"><%=String.format("%,d đ", Integer.parseInt(request.getParameter("total_price")))%>
                </p>
                <p class="border-checkout-success"><i class="fas fa-envelope pr-2 text-info"></i></i>Chúng tôi đã gửi email xác nhận đơn hàng vào tài khoản email của bạn</p>
                <p class="border-checkout-success"><i class="fas fa-truck pr-2 text-info"></i>Đơn hàng của bạn sẽ được giao vào ngày 15-2-2019</p>
                <p></p>
            </div>
        </div>
    </div>
</div>