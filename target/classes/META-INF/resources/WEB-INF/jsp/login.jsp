<%@ page import="java.util.Date" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <link rel="icon" href="${pageContext.request.contextPath}/static/images/favicon.png" type="image/x-icon">
    <title>大象能力平台</title>
    <!-- Mobile specific metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Force IE9 to render in normal mode -->
    <!--[if IE]>
    <meta http-equiv="x-ua-compatible" content="IE=9"/><![endif]-->
    <meta name="author" content="zzy"/>
    <meta name="description" content="大象能力平台"/>
    <meta name="keywords" content="大象"/>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="-1">
    <!-- CSS Files -->
    <link href="${pageContext.request.contextPath}/static/css/jqui/jquery.ui.all.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/static/css/material-bootstrap-wizard.css" rel="stylesheet"/>

    <link href="${pageContext.request.contextPath}/static/css/demo.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/static/css/login/style.css" rel="stylesheet"/>
    <%--    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/login.css">--%>
</head>
<style>
    .has_error .control-label {
        color: #f44336 !important;
    }

    ::-ms-clear {
        margin-right: 20px;
        margin-top: 5px;
    }

    .thisimg:HOVER {
        cursor: pointer;
    }
</style>
<script src="${pageContext.request.contextPath }/static/js/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
    function keyLogin() {
        if (event.keyCode == 13) {
            $("#tologin").click();
        }
    }
</script>
<body onkeydown="keyLogin();">
<div class="image-container set-full-height"
     style="background-image: url('${pageContext.request.contextPath}/static/images/14.png')">
    <div style="height: 75px;text-align: left;padding: 10px 0 10px 10px;position: relative"><a
            href="${pageContext.request.contextPath}/jsp/index.jsp" style="cursor: pointer">
        <img src="${pageContext.request.contextPath}/static/images/logo1.png" alt="logo" style="height: 100%;"></a>
    </div>
    <!--   Big container   -->
    <div class="container loginMain">
        <div class="row">
            <div class="col-sm-6 col-sm-offset-3">
                <!--      Wizard container        -->
                <div class="wizard-container">
                    <div class="card wizard-card" data-color="blue" id="wizardProfile">
                        <form action="" method="">
                            <div class="wizard-header">
                                <h4 id="msg"></h4>
                                <h3 class="wizard-title">
                                    用户登录
                                </h3>
                            </div>

                            <div class="tab-content">
                                <div class="tab-pane" style="display:block">
                                    <div class="row">
                                        <div class="userPEpart">
                                            <div class="col-sm-12">
                                                <div class="input-group" style="position:relative">
                                                        <span class="input-group-addon Pe">
                                                            <i class="material-icons">用户名</i>
                                                        </span>
                                                    <div id="name_div" class="form-group label-floating">
                                                        <label class="control-label" id="nameInfo">手机号/邮箱/登录名 <small>
                                                            (必填)</small></label>
                                                        <input id="customerName" name="customerName" type="text"
                                                               class="form-control" style="font-weight: bold">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-12">
                                                <div class="input-group">
                                                        <span class="input-group-addon password">
                                                            <i class="material-icons">密码</i>
                                                        </span>
                                                    <div id="pwd_div" class="form-group label-floating">
                                                        <label class="control-label" id="pwdInfo" style="left:0;">密码
                                                            <small>(必填)</small></label>
                                                        <input id="customerPwdss" name="customerPwdss" type="password"
                                                               class="form-control"
                                                               style="font-weight: bold;display:block;top:0;left:0;">
                                                        <input id="customerPwds" name="customerPwds" type="text"
                                                               class="form-control"
                                                               style="font-weight: bold;display:none;position:absolute;top:0;left:0;">
                                                    </div>
                                                    <div class="passEyes"><img
                                                            src="${pageContext.request.contextPath}/static/images/eyes_gray.png"
                                                            alt="隐藏密码" id="login_img"></div>
                                                </div>
                                            </div>
                                            <div class="col-sm-12">
                                                <div class="input-group">
                                                        <span class="input-group-addon">
                                                            <i class="material-icons">验证码</i>
                                                        </span>
                                                    <div id="code_div" class="form-group label-floating">
                                                        <label class="control-label" id="codeInfo">验证码
                                                            <small>(必填)</small></label>
                                                        <input name="code" id="code" type="text" class="form-control"
                                                               style="font-weight: bold">
                                                    </div>
                                                    <div class="verificationimgCode">
                                                        <a href="javascript:void(0);" title="点击刷新"
                                                           style="text-decoration: underline;">
                                                            <img id="ima"
                                                                 src="${pageContext.request.contextPath}/login/captcha?time=<%= new Date()%>"
                                                                 alt="验证码" style="width: 135px;height: 30px;"/>
                                                        </a>
                                                    </div>
                                                </div>
                                                <p class="useV">使用短信验证码登录</p>
                                                <input id="login_block" type="hidden" value=""/>
                                                <a href="/login/toregister"><p class="goreg">没有账号?马上注册</p></a>
                                            </div>
                                        </div>
                                        <div class="userVpart" style="display:none">
                                            <div class="col-sm-12">
                                                <div class="input-group" style="position:relative">
                                                        <span class="input-group-addon">
                                                            <i class="material-icons">手机号</i>
                                                        </span>
                                                    <div id="phone_div" class="form-group label-floating">
                                                        <label class="control-label" id="phoneInfo">手机号
                                                            <small>(必填)</small></label>
                                                        <input id="phone" name="phoneNumber" maxlength="15" type="text"
                                                               class="form-control" contenteditable="true"
                                                               onpaste="splitPhone()" style="font-weight: bold">
                                                    </div>
                                                    <button type="button" id="btn_phone_code" class="btn_yzm"
                                                            style="cursor: pointer;">获取验证码
                                                    </button>
                                                </div>
                                            </div>
                                            <div class="col-sm-12">
                                                <div class="input-group">
                                                        <span class="input-group-addon">
                                                            <i class="material-icons">验证码</i>
                                                        </span>
                                                    <div id="verifiedCode_div" class="form-group label-floating">
                                                        <label class="control-label" id="verifiedCodeInfo">验证码 <small>(必填)</small></label>
                                                        <input id="verifiedCode" name="verifiedCode" type="text"
                                                               class="form-control" style="font-weight: bold">
                                                    </div>
                                                </div>
                                                <p class="usePE">使用密码登录</p>
                                                <a href="/login/toregister"><p class="goreg">没有账号?马上注册</p></a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="wizard-footer">
                                <div class="pull-right">
                                    <input id="tologin" type='button' class='btn btn-submit btn-fill btn-success btn-wd'
                                           value='登录'/>
                                </div>
                                <div class="pull-left">
                                    <a href="${pageContext.request.contextPath}/jsp/index.jsp"><input type='button'
                                                                                                      class='btn btn-goindex btn-fill btn-default btn-wd'
                                                                                                      name='goindex'
                                                                                                      value='返回首页'/></a>
                                </div>
                            </div>
                            <div style="clear:both"></div>
                        </form>
                    </div>
                </div> <!-- wizard container -->
            </div>
        </div><!-- end row -->
    </div> <!--  big container -->
</div>
<input id="url" type="hidden" value="${pageContext.request.contextPath }">
<script src="${pageContext.request.contextPath}/static/js/jquery-2.1.4.min.js" type="text/javascript"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery.cookie.js"></script>
<script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/static/js/jquery.bootstrap.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/static/js/material-bootstrap-wizard.js"></script>
<script src="${pageContext.request.contextPath}/static/js/jquery.validate.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/layui/layui.all.js"></script>
<script src="${pageContext.request.contextPath}/static/js/plusRegJs.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/static/js/login/login.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/autoComplete.css">
<script src="${pageContext.request.contextPath}/static/js/jquery.autoComplete.js"></script>
<script src="${pageContext.request.contextPath}/static/js/password.js"></script>
<script>
</script>
</body>
</html>