<%@ page import="java.util.Date" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title></title>
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"/>

    <!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap-theme.min.css"/>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/register.css"/>

    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-2.1.4.min.js"></script>

    <script type="text/javascript">
        $(function () {
            $("#tijiao").click(function () {
                var username = $("#username").val();
                var phone = $("#phones").text();
                var text1 = $(".text1").val();
                var text2 = $(".text2").val();
                var mag = /[\u4e00-\u9fa5_a-zA-Z0-9_]{6,12}/;
                if (text1 == text2 && mag.test(text1) && mag.test(text2)) {
                    $("#domo").hide();
                    $.ajax({
                        type: "POST",
                        dataType: "JSON",
                        url: "/login/register",
                        data: {
                            phone: phone,
                            username: username,
                            password: text1
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
                                alert(data.massage);
                                window.location.href = "/login/tologin";
                            }
                        },
                        error: function () {
                            layer.msg("服务器繁忙,请稍后再试", {icon: 2, time: 1500});
                            layer.closeAll("loading");
                        }
                    });
                } else if (text1 == "" && text2 == "") {
                    $("#domo").show();
                    $("#domo").text("密码不能为空");
                    $("#span").hide();
                } else if (!mag.test(text1) && !mag.test(text2)) {
                    $("#domo").show();
                    $("#domo").text("密码输入格式错误");
                    $("#span").hide();
                } else if (text1 !== text2) {
                    $("#domo").show();
                    $("#domo").text("密码输入不一致");
                    $("#span").hide();
                }
            })
        })
    </script>

    <style type="text/css">
        p {
            font-family: "微软雅黑";
            font-size: 18px;
            color: black;
            font-weight: bold;
        }

        .text1 {
            border: 1px solid #E8E8E8;
            width: 100%;
            height: 50px;
            outline: none;
            text-indent: 20px;
        }

        .text2 {
            border: 1px solid #E8E8E8;
            width: 100%;
            height: 50px;
            outline: none;
            text-indent: 20px;
        }

        .text3 {
            border: 1px solid #E8E8E8;
            width: 100%;
            height: 50px;
            outline: none;
            text-indent: 20px;
        }
    </style>
</head>
<body>
<div class="boxone">
    <div class="boxtwo">
        <div id="img">

        </div>
        <h1>注册账号</h1>
        <p>您注册的手机号为:<span style="color: #00BBFF; font-size: 18px;" id="phones"></span></p>
        <p>请输入您的用户名:</p>
        <p><input id="username" type="text" placeholder="请输入用户名" class="text3"/></p>
        <p>请设置您的密码:</p>
        <p><input type="password" placeholder="请输入密码" class="text1"/></p>
        <p><input type="password" placeholder="请输入确认密码" class="text2"/></p>
        <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true" id="domo"></span>
        <span id="span">提示：密码长度6~12位,数字、字母、字符至少包含两种</span>
        <p><input id="tijiao" type="button" value="提交" class="input"/></p>
    </div>
</div>
<script type="text/javascript">
    var iphone = sessionStorage.getItem("tel");
    $("#phones").text(iphone);
</script>
</body>
</html>
