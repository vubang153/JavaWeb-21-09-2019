function isEmail(inputEmail) {
    return inputEmail.length > 6;
}
function validatePassword(inputPassword) {
    return inputPassword.length > 6;
}

$(document).ready(function () {
    $('#txtUsername').change(function () {
        var email = $(this).val().trim();
        // alert(`email = ${JSON.stringify(email)}`)
        if (!isEmail(email)) {
            //Error ?
            $("#usernameError").html("Tài khoản phải dài hơn 6 kí tự ");
        } else {
            $("#usernameError").html("");
        }
    });
    $('#txtPassword').change(function () {
        var password = $(this).val();
        if (!validatePassword(password)) {
            $("#passwordError").html("Mật khẩu phải dài hơn 6 kí tự");
        } else {
            $("#passwordError").html("");
        }
    });

});
function tangSoLuong(quantity) {
    var i = document.getElementById(quantity).value;
    i++;
    document.getElementById(quantity).value = i;
}
function giamSoLuong(quantity) {
    var i = document.getElementById(quantity).value;
    if (i <= 1) {
        return;
    }
    else {
        i--;
        document.getElementById(quantity).value = i;
    }
}
function loginFailed() {
    ("#usernameError").html("Sai tài khoản hoặc mật khẩu ! ");
}
function loginFailedAlert() {
    alert("Sai tài khoản hoặc mật khẩu");
}
//function redirectHome() {
//    alert("Bạn phải đăng nhập trước khi mua hàng");
//    window.location.assign("index.jsp?module=login");
//}
function getCurrentStateValue(id) {
    current_state = document.getElementById(id).value;
    return current_state;
}
function getNewStateValue(id) {
    new_state = document.getElementById(id).value;
    return new_state;
}
// kiểm tra điều kiện trước khi thay đổi nhóm
function checkGroup(curState, newState, id) {
    console.log(curState);
    console.log(newState);
    if ((curState == 0)
            || (curState == 1 && (newState == 2 || newState == 3))
            || (curState == 3 && (newState == 1 || newState == 2))) {
        window.location.href="../EditBill?c=editBillState&newState=" + newState +"&id=" + id;
    }
    else {
        alert("Không thể chuyển trạng thái");
        location.reload();
    }
}
