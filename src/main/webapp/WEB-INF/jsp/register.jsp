<%@ page import="java.util.Date" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>注册页面</title>
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"/>

    <!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap-theme.min.css"/>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/register.css"/>

    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-2.1.4.min.js"></script>
    <style>
        .text {
            border: 1px solid #E8E8E8;
            height: 50px;
            width: 250px;
            outline: none;
        }

        #box {
            border: 1px solid #E8E8E8;
            width: 120px;
            height: 50px;
            background-color: white;
            float: right;
        }

        #sendsms {
            text-decoration: none;
            color: black;
            line-height: 50px;
            margin-left: 20px;
        }

        #box:hover {
            background-color: floralwhite;
        }
    </style>
    <script type="text/javascript">
        $(function () {
            $("#zhuce").click(function () {
                var phone = $("#iphone").val();
                var myreg = /^[1][3,4,5,7,8][0-9]{9}$/;
                if (phone == "") {
                    $("#domo").show();
                    return;
                } else if (!myreg.test(phone)) {
                    $("#domo").show();
                    $("#domo").text("手机号格式不正确");
                } else if (myreg.test(phone)) {
                    var verifiedCode = $("#verifiedCode").val();
                    $("#domo").hide();
                    $.ajax({
                        type: "POST",
                        dataType: "JSON",
                        url: "/login/codeVerify",
                        data: {
                            verifiedCode: verifiedCode,
                            phone: phone
                        },
                        success: function (data) {
                            console.log(data.code);
                            if (data.code === 0) {
                                $("#msg").html(data.massage);
                                $("#msg").css("color", "red");
                            } else if (data.code === 2) {
                                $("#msg").html(data.massage);
                                $("#msg").css("color", "red");
                            } else {
                                sessionStorage.setItem("tel", phone);
                                window.location.href = "/login/toregister2";
                            }
                        },
                        error: function () {
                            layer.msg("服务器繁忙,请稍后再试", {icon: 2, time: 1500});
                            layer.closeAll("loading");
                        }
                    });
                }
            })
            $(".boxfour").click(function () {
                $("#xiala").toggle();
            })
            $("#sendsms").click(function () {
                sendyzm($("#sendsms"));
            });

            function sendyzm(obj) {
                var phone = $("#iphone").val();
                $.ajax({
                    type: "post",
                    url: "/login/sendCode",
                    async: true,
                    dataType: "json",
                    data: {
                        "mobile": phone
                    },
                    success: function (data) {
                        alert(JSON.stringify(data));
                    }
                });
                setTime(obj);
            }
        });
        var countdown = 60;

        function setTime(obj) {
            if (countdown == 0) {
                obj.prop('disabled', false);
                obj.text("获取验证码");
                countdown = 60;
                return;
            } else {
                obj.prop('disabled', true);
                obj.text("(" + countdown + "s)后重发");
                countdown--;
            }
            setTimeout(function () {
                setTime(obj)
            }, 1000)
        }
    </script>

</head>
<body>
<div class="boxone">
    <div class="boxtwo">
        <div id="img">

        </div>
        <h1 style="margin-bottom: 50px">注册账号</h1>
        <input id="iphone" type="text" class="boxsix" placeholder="请输入手机号码">
        <div class="boxfive">
            <p class="font">
                +86<span class="glyphicon glyphicon-triangle-bottom" aria-hidden="true"></span>
            </p>
        </div>
        <div style="margin-top: 130px">
            <input id="verifiedCode" type="text" placeholder="请输入验证码" class="text"/>
            <div id="box" style="cursor: pointer">
                <a id="sendsms">获取验证码</a>
            </div>
        </div>
        <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true" id="domo">请输入手机号</span>
        <h4 id="msg"></h4>
        <p><input style="margin-top: 20px" type="button" value="立即注册" class="input" id="zhuce"/></p>
    </div>
</div>
</body>
</html>
