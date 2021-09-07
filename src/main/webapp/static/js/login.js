/*
 * 用户登录的js
 */
var COOKIE_NAME = 'username';
var COOKIE_PHONE = 'phone';
var url = $("#url").val();
var regmail = /^[\w!#$%&'*+/=?^_`{|}~-]+(?:\.[\w!#$%&'*+/=?^_`{|}~-]+)*@(?:[\w](?:[\w-]*[\w])?\.)+[\w](?:[\w-]*[\w])?$/;
var regphone = /^(((13[0-9]{1})|(14[0-9]{1})|(15[0-9]{1})|166|(17[0-9]{1})|(18[0-9]{1})|(198|199))+\d{8})$/;

var countFlag = 0;// 0:可发送验证码  1:已发送验证码
$(document).ready(function () {
    if (document.getElementById("btn_phone_code") != null) {
        codeBtn_true();
    }
});

var times = 10;
$(function () {
    //邮箱自动补全
    $.AutoComplete('#customerName');

    if ($.cookie(COOKIE_NAME)) {
        $("#customerName").val($.cookie(COOKIE_NAME));
        if ($("#customerName").val() != "") {
            $("#name_div").removeClass("is-empty");
        }
    }
    if ($.cookie(COOKIE_PHONE)) {
        $("#phoneNumber").val($.cookie(COOKIE_PHONE));
        if ($("#phoneNumber").val() != "") {
            var phoneNumber = $("#phoneNumber").val();
            phoneNumber = phoneNumber.replace(/  /g, "");
            if (regphone.test(phoneNumber)) {
                codeBtn_false();
                $("#phone_div").removeClass("is-empty");
            } else {
                codeBtn_true();
            }
        }
    }

    $("#tologin").click(function () {
        login();
    });

    $("#btn_phone_code").click(function () {
        var phoneNumber = $("#phoneNumber").val();
        phoneNumber = phoneNumber.replace(/  /g, "");
        if (regphone.test(phoneNumber)) {
            codeBtn_false();
            sendCodeForLogin(phoneNumber);
        }
    });

    $("#phoneNumber").keyup(function (e) {
        formatPhone(e);
    });

    $("#customerName").keyup(function () {
        nameCheck();
    });

    $("#code").keydown(function (e) {
        if (e.keyCode == 13) {
            login();
        }
    });

    $("#ima").click(function () {
        var time = new Date().getTime();
        this.src = $("#url").val() + "/captcha?i=" + time;
        $("#code").val("");
    });

    $("a").hover(function () {
        $(this).addClass("hover");
    }, function () {
        $(this).removeClass("hover");
    });

    $("#customerPwds").keyup(function () {
        checkPwd();
    });

    $("#customerPwdss").keyup(function () {
        checkPwd();
    });

    $("#code").keyup(function () {
        codeCheck();
    });

});

function codeBtn_false() {
    document.getElementById("btn_phone_code").disabled = false;
    $("#btn_phone_code").css({'background-color': '#00A1E9'});
}
function codeBtn_true() {
    document.getElementById("btn_phone_code").disabled = true;
    $("#btn_phone_code").css({'background-color': 'lightgrey'});
}

function loginAction(customerName, password, code, loginType, platform) {
    $.ajax({
        type: "POST",
        dataType: "JSON",
        url: url + "/customerInfo/login.do?time=" + new Date().getTime(),
        data: {
            phoneOrEmail: customerName,
            customerPwd: password,
            code: code,
            loginType: loginType,
            platform: platform
        },
        success: function (data) {
            layer.closeAll("loading");
            if (data.failed_login_count >= 5) {
                window.location.href = url + "/customerInfo/goIndex.do";
            }
            if (data.code == 0000) {
                window.location.href = url + "/customerInfo/go2UserCenter.do";
            } else if (data.code == 9998) {
                layer.msg(data.message, {icon: 2, time: 1500});
                $("#ima").click();
            } else {
                showResMsg(data);
                $("#ima").click();
            }
        },
        error: function () {
            layer.msg("服务器繁忙,请稍后再试", {icon: 2, time: 1500});
            layer.closeAll("loading");
        }
    });
}
function login() {
    var block = $("#login_block").val();
    var loginType;
    var customerName;
    var customerPwd;
    var code;
    if (block == "2") {
        loginType = 1;
        var codeC = varycodeCheck();
        var phoneC = phoneCheck();
        if (!(phoneC && codeC)) {
            return;
        }
        code = $("#verifiedCode").val();
        customerName = ($("#phoneNumber").val()).replace(/  /g, "");
        if ($.trim(customerName) != "") {
            if (codeC) {
                var l = layer.load(1);
                var verifiedCode = $("#verifiedCode").val();
                $.cookie(COOKIE_PHONE, $("#phoneNumber").val());
            }
        }
    } else {
        loginType = 0;
        //账号密码登录
        customerName = $("#customerName").val();
        $.cookie(COOKIE_NAME, customerName);
        customerPwd = $("#customerPwds").val();
        code = $("#code").val();
        var name = nameCheck();
        var pwd = checkPwd();
        var coded = codeCheck();
        if (!(name && pwd && coded)) {
            return;
        }
    }
    var l = layer.load(1);
    var password = encode64($("#customerPwds").val());
    $("#customerPwds").val(customerPwd);
    loginAction(customerName, password, code, loginType,0);
}

function sendCodeForLogin(phoneNumber) {
    $.ajax({
        type: "GET",
        dataType: "JSON",
        url: url + "/clientController/sendCodeForLogin.do?time=" + new Date().getTime(),
        data: {phoneNumber: phoneNumber},
        success: function (data) {
            if (data.code == 0000) {
                layer.msg("验证码已发送至" + phoneNumber + ",请注意查收", {icon: 1, time: 1500});
                time();
            } else if (data.code == 0001) {
                layer.msg(data.message, {icon: 1, time: 1500});
            } else if (data.code == 1004) {
                layer.msg(data.message, {icon: 2, time: 1500});
                $("#phone_div").addClass("has-error");
                $("#phoneNumber").focus();
            } else if (data.code == 9998) {
                layer.msg(data.message, {icon: 2, time: 1500});
            } else {
                layer.msg(data.message, {icon: 2, time: 1500});
            }
        },
        error: function () {
            layer.msg("服务器繁忙,请稍后再试", {icon: 2, time: 1500});
        }
    });
}

//获取验证码按钮倒数计时
var wait = 60;
function time() {
    if (wait == 0) {
        codeBtn_false();
        $("#btn_phone_code").val("获取验证码");
        wait = 60;
        countFlag = 0;
    } else {
        countFlag = 1;
        codeBtn_true();
        $("#btn_phone_code").val("重新发送(" + wait + ")");
        wait--;
        setTimeout(function () {
                time()
            },
            1000)
    }
}

//格式化手机号码,友好显示
function formatPhone(e) {
    var phoneNumber = $("#phoneNumber").val();
    if (e.keyCode !== 8 && (phoneNumber.length === 3 || phoneNumber.length === 9)) {
        $("#phoneNumber").val(phoneNumber + "  ");
    }
    phoneCheck();
}

function showResMsg(data) {
    var code = data.code;
    layer.msg(data.message, {icon: 2, time: 1500});
    var block = $("#login_block").val();
    if (code == 6668) {
        $("#code_div").addClass("has-error");
        $("#code").focus();
    }
    if (code == 1111) {
        if(block == "2"){
            $("#phone_div").addClass("has-error");
            $("#phoneNumber").focus();
        }else{
            $("#name_div").addClass("has-error");
            $("#customerName").focus();
        }
    }
    if (code == 2222) {
        if(block == "2"){
            $("#verifiedCode_div").addClass("has-error");
            $("#verifiedCode").focus();
        }else{
            $("#pwd_div").addClass("has-error");
            $("#customerPwds").focus();
        }
    }
    if (code == 1001) {
        $("#phone_div").addClass("has-error");
        $("#phoneNumber").focus();
    }
    if (code == 1002 || code == 1003) {
        $("#verifiedCode_div").addClass("has-error");
        $("#verifiedCode").focus();
    }
    layer.closeAll("loading");
}

//校验手机号码
function phoneCheck() {
    var phoneNumber = $("#phoneNumber").val();
    phoneNumber = phoneNumber.replace(/  /g, "");
    if (regphone.test(phoneNumber)) {
        //按钮不可用时不放开
        if (countFlag != 1) {
            codeBtn_false();
        }
    } else {
        codeBtn_true();
    }
    if ($.trim(phoneNumber) == "") {
        $("#phoneInfo").html("请输入手机号");
        $("#phone_div").addClass("has_error");
        $("#phoneNumber").focus();
        return false;
    }
    if (phoneNumber.length == 11) {
        if (!regphone.test(phoneNumber)) {
            $("#phoneInfo").html("手机号码格式错误");
            $("#phone_div").addClass('has_error');
            $("#phoneNumber").focus();
            return false;
        }
        $("#phoneInfo").html("手机号<small>(必填)</small>");
        $("#phone_div").removeClass("has_error");
        return true;
    }
}

function varycodeCheck() {
    var verifiedCode = $("#verifiedCode").val();
    if ($.trim(verifiedCode) == "") {
        $("#verifiedCodeInfo").html("请输入验证码");
        $("#verifiedCode_div").addClass("has-error");
        $("#verifiedCode").focus();
        return false;
    }
    $("#verifiedCodeInfo").html("验证码<small>(必填)</small>");
    $("#verifiedCode_div").removeClass("has-error");
    return true;
}

function nameCheck() {
    var customerName = $("#customerName").val();
    if ($.trim(customerName) == "") {
        $("#nameInfo").html("请输入登录名");
        $("#name_div").addClass("has-error");
        $("#customerName").focus();
        return false;
    } else if ($.trim(customerName).length > 60) {
        $("#nameInfo").html("请输入正确的登录名");
        $("#name_div").addClass("has-error");
        $("#customerName").focus();
        return false;
    } else if (regmail.test(customerName) || regphone.test(customerName)) {
        $("#nameInfo").html("手机号/邮箱/登录名<small>(必填)</small>");
        return true;
    } else {
        $("#nameInfo").html("手机号/邮箱/登录名<small>(必填)</small>");
        $("#name_div").removeClass("has-error");
        return true;
    }
};

function checkPwd() {
    var pwd = $("#customerPwds").val();
    if ($.trim(pwd) == "") {
        $("#pwdInfo").html("请输入密码");
        $("#pwd_div").addClass("has-error");
        $("#customerPwds").focus();
        return false;
    } else {
        $("#pwdInfo").html("密码<small>(必填)</small>");
        $("#pwd_div").removeClass("has-error");
        return true;
    }
};

function codeCheck() {
    var code = $("#code").val();
    if ($.trim(code).length == 0) {
        $("#codeInfo").html("请输入验证码");
        $("#code_div").addClass("has-error");
        $("#code").focus();
        return false;
    }
    $("#codeInfo").html("验证码<small>(必填)</small>");
    $("#code_div").removeClass("has-error");
    return true;
}

//黏贴时间 格式化手机号码
function splitPhone() {
    var phone = ""
    setTimeout(function () {
        phone = $("#phoneNumber").val();
        phone = jQuery.trim(phone);
        var phoneFormat = "";
        if (phone.length > 3) {
            if (phone.length < 7) {
                phoneFormat = phone.substring(0, 3) + "  " + phone.substring(3, 7);
            } else {
                phoneFormat = phone.substring(0, 3) + "  " + phone.substring(3, 7) + "  " + phone.substring(7, 11);
            }
            $("#phoneNumber").val(phoneFormat);
        }
    }, 0)
}

