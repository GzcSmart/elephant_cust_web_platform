// 验证码
$(document).ready(function () {
    // 判断手机移动端
    if (/Android|webOS|iPhone|iPod|BlackBerry/i.test(navigator.userAgent)) {
        $(".wizard-container").css("padding-top", "10px");
    }

    $(".useEmail").click(function () {
        $("#codeRefresh2").click();
        $(".userphonepart").css("display", "none");
        $(".useremailpart").css("display", "block");
    });
    $(".usePhone").click(function () {
        $("#codeRefresh").click();
        $(".useremailpart").css("display", "none");
        $(".userphonepart").css("display", "block");
    });

    $(".useV").click(function () {
        $(".userVpart").css("display", "block");
        $(".userPEpart").css("display", "none");
        $("#login_block").val("2");//登录方式(手机验证码登录)
    });
    $(".usePE").click(function () {
        $(".userPEpart").css("display", "block");
        $(".userVpart").css("display", "none");
        $("#login_block").val("1");//登录方式(账号密码登录)
    });

});
//隐藏text block，显示password block
    function hideShowPsw(input,img) {
        var demoImg = document.getElementById(img);
        var demoInput = document.getElementById(input);
        if (demoInput.type === "password") {
            demoInput.type = "text";
            demoImg.src = "../../../../home_page/img/eyes_blue.png";
        } else {
            demoInput.type = "password";
            demoImg.src = "../../../../home_page/img/eyes_gray.png";
        }
    }



