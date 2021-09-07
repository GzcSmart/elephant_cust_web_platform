<%@ page pageEncoding="UTF-8" %>
<%@ include file="taglib.jsp" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
    <link rel="icon" type="image/x-icon">
    <title>大象能力平台</title>
    <%@ include file="/WEB-INF/jsp/head_alert.jsp" %>
    <link href="${pageContext.request.contextPath }/static/css/webuploader.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath }/static/js/customerInfo.js"></script>
    <script src="${pageContext.request.contextPath }/static/js/jquery.lazyload.min.js"></script>
    <script src="${pageContext.request.contextPath }/static/js/jquery-2.1.4.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $("#updatePassword").on('click', function () {
                var newPassword = $("#newPasswords").val();
                layer.confirm("您确定修改密码吗?", {
                    btn: ['确定', '取消']
                }, function () {
                    $.ajax({
                        type: "post",
                        url: "upPwd",
                        async: true,
                        dataType: "json",
                        data: {
                            "password": newPassword
                        },
                        success: function (data) {
                            if (data.code === 1) {
                                layer.msg(data.msg);
                                setTimeout("javascript:top.location.href='/login/logOut'", 2100);
                            } else {
                                layer.msg(data.msg);
                            }
                        }
                    });
                }, function () {
                    layer.close()
                })
            })
        })
    </script>
    <style src="text/css">
        #img1 .thumbnail {
            border: none !important;
        }

        .im-eye {
            position: relative;
            left: 135px;
        }
    </style>
</head>
<body style="overflow-x: hidden">
<!-- Start #content -->
<div id="content">
    <input id="baseHost" type="hidden" value="${pageContext.request.contextPath }">
    <!-- Start .content-wrapper -->
    <div class="content-wrapper">
        <div class="outlet">
            <!-- Start .outlet -->
            <div class="row">
                <input type="hidden" id="customerId" name="customerId" value="${sessionScope.customerInfo.customerId}">
                <!-- Start .row -->
                <div class="col-lg-3">
                    <!-- Start col-lg-12 -->
                    <div class="panel panel-default toggle">
                        <!-- Start .panel -->
                        <sf:form class="form-horizontal" role="form" method="post"
                                 action="${pageContext.request.contextPath }/customerInfo/update.do">
                        <div class="panel-body" style="border:none;">
                            <input value="" id="img_src" type="hidden" name="img_src"/>
                            <div class="form-group">
                                <label class="col-sm-3 control-label"
                                       style="text-align:right;margin-top: 40px">修改头像</label>
                                <div class="controls col-sm-5" style="line-height: 35px;">
                                    <div class="tab-content-active"
                                         style="float: left; position: relative;">
                                        <input id="wizard-picture" type="text"
                                               style="width: 100px; height: 100px; border-radius: 50px; border: solid rgb(243, 245, 246) 5px;">
                                        <div style="position: absolute; top: 0; display: inline-block; width: 100px; height: 100px; left: 0;"
                                             id="img1">
                                            <c:if test="${!empty sessionScope.customerInfo.headImgUrl}">
                                                <img id="image8" class="lazy"
                                                     src="${sessionScope.customerInfo.headImgUrl}" width="90px"
                                                     height="90px" alt="头像"
                                                     style="margin: 5px 5px; border-radius: 50px;"/>
                                            </c:if>
                                        </div>
                                        <div style="position: absolute; top: 0; display: inline-block; width: 100px; height: 100px; left: 0;cursor: pointer"
                                             id="picker2"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label" style="text-align:right;">用户类型</label>
                                <div class="controls col-sm-5" style="line-height: 35px;">
                                        ${sessionScope.customerInfo.auditStatus==1?'正式用户':'试用用户'}
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label" style="text-align:right;">企业名称</label>
                                <div class="controls col-sm-5" style="line-height: 35px;">
                                        ${sessionScope.customerInfo.orgName}
                                </div>
                            </div>
                            <c:if test="${!empty sessionScope.customerInfo.email}">
                                <div class="form-group">
                                    <label class="col-sm-3 control-label" style="text-align:right;">邮箱账号</label>
                                    <div class="controls col-sm-5" style="line-height: 35px;">
                                            ${sessionScope.customerInfo.email}
                                    </div>
                                </div>
                            </c:if>
                            <div class="form-group">
                                <label class="col-sm-3 control-label" style="text-align:right;">联系人姓名</label>
                                <div class="controls col-sm-5" style="line-height: 35px;">
                                        ${sessionScope.customerInfo.customerName}
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label" style="text-align:right;">修改密码</label>
                                <div class="controls col-sm-5" style="line-height: 35px;width: 320px;">
                                    <input id="newPasswords" name="newPassword" type="text" class="form-control"
                                           placeholder="请输入新密码" style="float:left;width:170px;display:block;">
                                    <input type="button" id="updatePassword" value="修改"
                                           style="margin-right:50px;float:right" class="btn btn-default">
                                </div>
                            </div>
                            <div class="form-group" style="margin-top:-10px;">
                                <label class="col-sm-3 control-label"></label>
                                <div class="controls col-sm-5" id="checkPassword"></div>
                            </div>
                            <c:choose>
                            <c:when test="${sessionScope.customerInfo.customerTel !=''}">
                            <div class="form-group">
                                <label class="col-sm-3 control-label" style="text-align:right;">联系号码</label>
                                <div class="controls col-sm-5" style="line-height: 35px;">
                                    <input type="text" name="oldPhone" value="${sessionScope.customerInfo.customerTel }"
                                           id="oldPhone"
                                           disabled="disabled" class="form-control" style="float:left;width:50%;">
                                    <input type="button" id="showUp" value="修改" style="margin-left:20px;float:left"
                                           class="btn btn-default">
                                </div>
                            </div>
                            <div class="form-group" style="margin-top:-10px;">
                                <label class="col-sm-3 control-label"></label>
                                <div class="controls col-sm-5">
                                    <span style="color: #FF6666; ">*用于找回密码和余额预警的短信提醒</span>
                                </div>
                            </div>
                            <div id="show1" hidden>
                                <div class="form-group" id="showCode">
                                    <label class="col-sm-3 control-label" style="text-align:right;">验证码</label>
                                    <div class="controls col-sm-5">
                                        <input type='text' name='code' id='code' class="form-control"
                                               style="width:35%;float:left;">
                                        <input type="button" id='getCode' value='获取验证码' class="btn btn-default"
                                               onclick="sendCode('changePhone')"
                                               style="margin-left:10px;width:50%;float:left;">
                                    </div>
                                </div>
                                <div class="form-group" style="margin-top:-10px;">
                                    <label class="col-sm-3 control-label"></label>
                                    <div class="controls col-sm-5" id="result"></div>
                                </div>
                                <div class="form-group" style="display: none;" id="newPhone">
                                    <label class="col-sm-3 control-label" style="text-align:right;">绑定新号码</label>
                                    <div class="controls col-sm-5">
                                        <input type="text" id="phone" name="phone" value="" class="form-control"
                                               style="width:55%;">
                                    </div>
                                </div>
                                <div class="form-group" style="margin-top:-10px;">
                                    <label class="col-sm-3 control-label"></label>
                                    <div class="controls col-sm-5" id="checkPhone"></div>
                                </div>
                            </div>
                        </div>

                        <div class="form-group" style="display:none" id="submit">
                            <div class="controls  col-sm-offset-2 col-sm-3">
                                <button id="update" type="button" class="btn btn-default">
                                    确定
                                </button>
                            </div>
                        </div>
                        </c:when>
                        <c:otherwise>
                            <div class="form-group">
                                <label class="col-sm-3 control-label" style="text-align:right;">联系号码</label>
                                <div class="controls col-sm-5" style="line-height: 35px;">
                                    <input type="text" id="addPhone" name="oldPhone" placeholder="请完善联系号码"
                                           class="form-control" style="float:left;width:50%;">
                                    <input type="button" id="surePhoneNum" value="确认"
                                           style="margin-left:10px;float:left" class="btn btn-default">
                                </div>
                            </div>
                            <div class="form-group" style="margin-top:-10px;">
                                <label class="col-sm-3 control-label"></label>
                                <div class="controls col-sm-5" id="checkNewPhone"></div>
                            </div>
                            <div class="form-group" style="display: none;" id="showCode1">
                                <label class="col-sm-3 control-label" style="text-align:right;">验证码</label>
                                <div class="controls col-sm-5">
                                    <input type='text' name='code' id='phoneCode' class="form-control"
                                           style="width:35%;float:left;">
                                    <input type="button" id='getPhoneCode' value='获取验证码' class="btn btn-default"
                                           onclick="sendCode('addPhone')"
                                           style="margin-left:10px;width:50%;float:left;">
                                </div>
                            </div>
                            <div class="form-group" style="margin-top:-10px;">
                                <label class="col-sm-3 control-label"></label>
                                <div class="controls col-sm-5" id="result1"></div>
                            </div>
                            <div class="form-group" style="display:none" id="submit1">
                                <div class="controls  col-sm-offset-2 col-sm-3">
                                    <button id="updatePhone" type="button" class="btn btn-default">
                                        确定
                                    </button>
                                </div>
                            </div>
                        </c:otherwise>
                        </c:choose>
                    </div>
                    </sf:form>
                    <!-- End .panel -->
                </div>
                <!-- End col-lg-12 -->
            </div>
            <!-- End .row -->
            <!-- Page End here -->
        </div>
        <!-- End .outlet -->
        <div class="clearfix"></div>
    </div>
</div>
<!-- End #content -->
</body>
</html>
<script src="${pageContext.request.contextPath}/static/layui/layui.js"></script>
<script type="text/javascript">
    layui.use('upload', function () {
        let upload = layui.upload;
        let $ = layui.$;
        //执行实例
        let uploadInst = upload.render({
            elem: '#picker2' //绑定元素
            , url: 'upface' //上传接口
            , done: function (res) {
                //上传完毕回调
                if (res.code == 1) {
                    layer.msg(res.msg);
                    let imagePath = res.data.src;
                    $("#image8").attr("src", imagePath);
                } else {
                    layer.msg(res.msg);
                }
            }
            , error: function () {
                //请求异常回调
            }
        });
    });
</script>