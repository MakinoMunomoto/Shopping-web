var ismyFocus = false,
    ismyFocusPassword = false,
    isconfirmPasswordTure = false,
    ismyFocuspeone = false;
/* 用户名字符数不能少于3 */
function getLength(str) {
    var len = 0;
    for (var i = 0; i < str.length; i++) {
        var c = str.charCodeAt(i);
        //单字节加1 
        if ((c >= 0x0001 && c <= 0x007e) || (0xff60 <= c && c <= 0xff9f)) {
            len++;
        } else {
            len += 2;
        }
    }
    return len;
}
/* 用户名数字符大于3 */
function myFocus() {
    var username = document.getElementById("username").value;
    var usernameNone = document.getElementById("usernameNone");
    var usernameTurePicture = document.getElementById("usernameTurePicture");
    var usernameFalsePicture = document.getElementById("usernameFalsePicture");
    console.log('获取用户名字符数：' + getLength(username));
    /* if (username.value.length < 3) { */
    if (getLength(username) < 3) {
        usernameNone.style.display = "none";
        usernameFalsePicture.style.display = "block";
    } else {
        usernameNone.style.display = "none";
        usernameTurePicture.style.display = "block";
        usernameFalsePicture.style.display = "none";
        ismyFocus = true;
    }
}

/* 密码不少于6位 */
function myFocusPassword() {
    var password = document.getElementById("password").value;
    var passwordNone = document.getElementById("passwordNone");
    var passwordTurePicture = document.getElementById("passwordTurePicture");
    var passwordFalsePicture = document.getElementById("passwordFalsePicture");
    console.log('获取密码字符'+getLength(username));
    /* if (username.value.length < 6) { */
    if (getLength(password) < 6) {
        passwordNone.style.display = "none";
        passwordFalsePicture.style.display = "block";
        passwordTurePicture.style.display = "none";
    } else {
        passwordNone.style.display = "none";
        passwordTurePicture.style.display = "block";
        passwordFalsePicture.style.display = "none";
        ismyFocusPassword = true;
    }
}
/* 确认两次输入密码相同 */
function confirmPasswordTure() {
    var password = document.getElementById("password").value;
    var confirm_password = document.getElementById("confirm_password").value;
    if (password == confirm_password) {
        document.getElementById("confirm_passwordNone").style.display = "none";
        document.getElementById("confirm_passwordTurePicture").style.display = "block";
        document.getElementById("confirm_passwordFalsePicture").style.display = "none";
        isconfirmPasswordTure = true;
    } else {
        document.getElementById("confirm_passwordNone").style.display = "none";
        document.getElementById("confirm_passwordTurePicture").style.display = "none";
        document.getElementById("confirm_passwordFalsePicture").style.display = "block";

    }
}
/* 手机号码不少于11位 */
function myFocuspeone() {
    var phone_number = document.getElementById("phone_number").value;
    var phone_numberNone = document.getElementById("phone_numberNone");
    var phone_numberTurePicture = document.getElementById("phone_numberTurePicture");
    var phone_numberFalsePicture = document.getElementById("phone_numberFalsePicture");
    console.log('获取手机号码字符'+getLength(username));
    /* if (username.value.length < 6) { */
    if (getLength(phone_number) < 6) {
        phone_numberNone.style.display = "none";
        phone_numberFalsePicture.style.display = "block";
        phone_numberTurePicture.style.display = "none";
    } else {
        phone_numberNone.style.display = "none";
        phone_numberTurePicture.style.display = "block";
        phone_numberFalsePicture.style.display = "none";
        ismyFocuspeone = true;
    }
}

function registerFocus() {

    myFocus();
    myFocusPassword();
    confirmPasswordTure();
    myFocuspeone();
    console.log(ismyFocus && ismyFocusPassword && isconfirmPasswordTure && ismyFocuspeone);
    if (ismyFocus && ismyFocusPassword && isconfirmPasswordTure && ismyFocuspeone) {
        bu = document.getElementById("register").disabled = false;
    }
}/**
 * 
 */