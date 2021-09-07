$(function(){
    $("#btn_phone_code").click(function (){
        sendyzm($("#btn_phone_code"));
    });
    function sendyzm(obj){
        var phone = $("#phone").val();
        var result = isPhoneNum();
        if(result){
            $.ajax({
                type:"post",
                url:"/login/sendCode",
                async : true,
                dataType:"json",
                data:{
                    "mobile":phone
                },
                success:function (data) {
                    alert(JSON.stringify(data));
                }
            });
            setTime(obj);
        }
    }
});

var countdown = 60;
function setTime(obj) {
    if (countdown == 0) {
        obj.prop('disabled', false);
        obj.text("点击获取验证码");
        countdown = 60;
        return;
    } else {
        obj.prop('disabled', true);
        obj.text("("+countdown+"s)后重新发送");
        countdown--;
    }
    setTimeout(function() { setTime(obj) },1000)
}
function isPhoneNum(){
    var phonenum = $("#phone").val();
    var reg = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/;
    if(!reg.test(phonenum)){
        alert('请输入有效的手机号码！');
        return false;
    }else{
        return true;
    }
}

$("#ima").click(function () {
    var time = new Date().getTime();
    this.src = $("#url").val() + "/login/captcha?i=" + time;
    $("#code").val("");
});

$("#tologin").click(function () {
    var time = new Date().getTime();
    var captcha = $("#url").val() + "/login/captcha?i=" + time;
    $("#ima").attr('src',captcha);
    var block = $("#login_block").val();
    if (block === "2"){
        phoneLogin();
    }
    else{
        pwdLogin();
    }
});

//账号密码登录
function pwdLogin() {
        var customerName;
        var customerPwd;
        var code;
        customerName = $("#customerName").val();
        customerPwd = $("#customerPwds").val();
        code = $("#code").val();
        var checked = this.check(customerName,customerPwd,code);
        if (!(checked)){
            return;
        }
        loginAction(customerName, customerPwd, code);
}

//手机号登录
function phoneLogin(){
    var phone = $("#phone").val();
    var verifiedCode = $("#verifiedCode").val();
    $.ajax({
        type: "POST",
        dataType: "JSON",
        url: "/login/phoneLogin",
        data: {
            phone: phone,
            verifiedCode: verifiedCode,
        },
        success: function (data) {
            console.log(data);
            if (data.code === 0){
                $("#msg").html(data.massage);
                $("#msg").css("color","red");
            }else if (data.code === 2){
                $("#msg").html(data.massage);
                $("#msg").css("color","red");
            }
            else {
                window.location.href = "/toadmin";
            }
        },
        error: function () {
            layer.msg("服务器繁忙,请稍后再试", {icon: 2, time: 1500});
            layer.closeAll("loading");
        }
    });
}

function check(userName,password,code) {
    if(userName == null || userName === ""){
        $("#nameInfo").html("请输入登录名");
        $("#name_div").addClass("has-error");
        $("#customerName").focus();
        return false;
    }
    if(password == null || password === ""){
        $("#pwdInfo").html("请输入密码");
        $("#pwd_div").addClass("has-error");
        $("#customerPwds").focus();
        return false;
    }
    if(code == null || code === ""){
        $("#codeInfo").html("请输入验证码");
        $("#code_div").addClass("has-error");
        $("#code").focus();
        return false;
    }
    return true;
}

function loginAction(customerName, customerPwd, code) {
    var url = $("#url").val();
    $.ajax({
        type: "POST",
        dataType: "JSON",
        url: url + "/login/login?time=" + new Date().getTime(),
        data: {
            customerName: customerName,
            customerPwd: customerPwd,
            code: code
        },
        success: function (data) {
            console.log(data);
            if (data.code === 0){
                $("#msg").html(data.massage);
                $("#msg").css("color","red");
            }else if (data.code === 2){
                $("#msg").html(data.massage);
                $("#msg").css("color","red");
            }
            else {
                window.location.href = url + "/toadmin";
            }
        },
        error: function () {
            layer.msg("服务器繁忙,请稍后再试", {icon: 2, time: 1500});
            layer.closeAll("loading");
        }
    });
}
