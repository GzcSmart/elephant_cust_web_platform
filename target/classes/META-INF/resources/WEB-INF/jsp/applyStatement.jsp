<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="icon" href="../../../../elephant_images/favicon.png" type="image/x-icon">
    <title>大象能力平台</title>
    <!-- tangyinquan 20160518 -->
    <%@ include file="public_css_js.jsp" %>
    <!-- tangyinquan 20160518 end -->
    <link href="../../../../assets/css/tabs-basic.css" rel="stylesheet"/>
    <!-- zhangzhi begin 20161114 -->
    <script type="text/javascript" src="../../../../js/common/jquery.lazyload.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $('img.lazy').lazyload({
                effect: "fadeIn",
                event: 'sporty',
                skip_invisible: false
            });

            $(window).bind('load', function () {
                var timeout = setTimeout(function () {
                    $('img.lazy').trigger('sporty');
                }, 500);
            });

            $("#applition").click(function () {
                var value = $("#applition").val();
                if ("查看企业信息" == value) {
                    window.location.href = "${pageContext.request.contextPath }/orgInfoAudit/showOrgInfo.do";
                } else {
                    $.ajax({
                        url: 'customerInfo/getCustomerStatus.do',
                        dataType: "json",
                        success: function (data) {
                            if (data.status == 2) {
                                layer.msg('您的账户异常，无法完成操作，请联系客服', {icon: 2});
                            } else {
                                var value = $("#applition").val();
                                if ("立即申请" == value) {
                                    window.location.href = "${pageContext.request.contextPath }/orgInfoAudit/goOrgAudit.do";
                                } else if ("继续填写" == value) {
                                    window.location.href = "${pageContext.request.contextPath }/orgInfoAudit/judgeStep.do";
                                } else if ("再次申请" == value) {
                                    window.location.href = "${pageContext.request.contextPath }/orgInfoAudit/getOrgInfoAndApInfo.do";
                                }
                            }
                        }
                    });
                }
            });
            $('.niu').click(function () {
                $('.niu').css("display", "none");
                $('html').css("overflow", "scroll");
            });
        });

        function showImg(ImageSrc) {
            var screenHeight = document.documentElement.clientHeight;
            var screenWidth = document.documentElement.clientWidth;
            var showHeight = screenHeight * 0.8;
            var showWidth = screenWidth * 0.8;
            var img = new Image;
            img.src = ImageSrc;
            img.onload = function () {
                var height = img.height;
                var width = img.width;
                if (height > showHeight || width > showWidth) {
                    if (height > showHeight && width > showWidth) {
                        if ((height / showHeight) >= (width / showWidth)) {
                            bili = showHeight / height;
                        } else {
                            bili = showWidth / width;
                        }
                        height = (height * bili);
                        width = (width * bili);
                    } else if (height > showHeight) {
                        bili = showHeight / height;
                        height = height * bili;
                        width = width * bili;
                    } else if (width > showWidth) {
                        bili = showWidth / width;
                        height = height * bili;
                        width = width * bili;
                    }
                }
                layer.open({
                    title: '<b><i class="im-image2"/> 浏览</b>',
                    type: 1,
                    area: [width + 'px', height + 92 + 'px'],
                    fixed: false,
                    resize: true,
                    scrollbar: false,
                    shadeClose: true,
                    content: '<div><img src="' + ImageSrc + '" height=' + height + 'px width=' + width + 'px"></div>',
                    moveOut: true,
                    btn: ['原图'],
                    yes: function (index, layero) {
                        window.open(ImageSrc);
                    }
                });
            };
        }
    </script>
    <style type="text/css">
        @media (max-width: 500px) {
            .maincenter {
                padding: 5% 15% !important;
            }
        }
    </style>
</head>
<body>
<!-- tangyinquan 20160518 -->
<c:import url="/WEB-INF/jsp/common/head.jsp"/>
<!-- tangyinquan 20160518 end -->
<!-- tangyinquan 20160518 -->
<c:import url="/WEB-INF/jsp/common/manager_menu.jsp"/>
<!-- tangyinquan 20160518 end -->
<div id="content">
    <!-- Start .content-wrapper -->
    <div class="content-wrapper">
        <div class="row">
            <!-- Start .row -->
            <!-- Start .page-header -->
            <div class="col-lg-12 heading">
                <h1 class="page-header"></h1>
                <!-- Start .bredcrumb -->
                <ul class="breadcrumb">
                    <li>
                        <i class="im-home"></i>
                        <a href="go2UserCenter">用户中心</a>
                        <i class="en-arrow-right7"></i>
                    </li>
                    <li>
                        <i class="im-paragraph-justify"></i>
                        企业申请
                        <i class="en-arrow-right7"></i>
                    </li>
                    <li><i class="en-vcard"></i>企业资质申请</li>
                </ul>
                <!-- End .breadcrumb -->
            </div>
            <!-- End .page-header -->
        </div>

        <div class="maincenter" style="padding:5% 25%;">
            <div class="panel panel-default toggle">
                <div class="panel-heading">
                    <h3 class="panel-title">
                        <i class="im-quill"></i><span style="font-size:16px">企业资质申请提示</span>
                    </h3>
                </div>
                <div class="panel-body">
                    <c:if test="${auditMsgHead eq '0000'}">
                        <p style="font-size:14px">注册前需要准备：<span style="font-size:10px;">影印件必须为彩色原件的扫描件或数码照</span></p>
                        <ul style="padding-left:20px">
                            <li style="list-style-type:disc;"><a
                                    href="javascript:showImg('../../../../elephant_images/enterpriseQualification/businessLicensePhotocopy.png');">营业执照影印件</a>
                            </li>
                            <li style="list-style-type:disc;">对公银行账户，可以是基本户或一般户</li>
                            <li style="list-style-type:disc;">法定代表人的<a
                                    href="javascript:showImg('../../../../elephant_images/enterpriseQualification/demoidcard.png');">身份证影印件</a>
                            </li>
                        </ul>
                        <br>

                        <p style="font-size:14px">如果您是代理人，除以上资料，还需准备：</p>
                        <ul style="padding-left:20px">
                            <li style="list-style-type:disc;">您的<a
                                    href="javascript:showImg('../../../../elephant_images/enterpriseQualification/demoidcard.png');">身份证影印件</a>
                            </li>
                            <li style="list-style-type:disc;">企业委托书，必须盖有公司公章或者财务专业章，不能是合同/业务专用章&nbsp;<a
                                    href="javascript:showImg('../../../../elephant_images/enterpriseQualification/attorney.jpg');">查看模板</a>
                            </li>
                        </ul>
                        <br>
                    </c:if>

                    <c:if test="${auditMsgHead eq '3333'}">
                        <p style="font-size:14px;"><i class="im-sad2 s20" style="color:red;"></i>&nbsp;sorry，您的企业信息未通过审核！
                        </p>
                        <p style="font-size:14px">审核失败原因如下：</p>
                        <ul style="padding-left:20px">
                            <c:forEach var="errorMsg" items="${errorList}">
                                <li style="list-style-type:disc;">${errorMsg}</li>
                                <br>
                            </c:forEach>
                        </ul>
                        <p style="font-size:14px">请根据失败原因进行修改后重新提交申请，如有疑问，请联系管理员。</p>
                    </c:if>

                    <c:if test="${auditMsgHead eq '2222'}">
                        <p style="font-size:14px;"><i class="im-happy s20" style="color:#69C550;"></i>&nbsp;恭喜！您的企业信息已通过审核
                        </p>

                    </c:if>

                    <c:if test="${auditMsgHead eq '4444'}">
                        <p style="font-size:14px;">您的信息尚未填写完整，请继续填写并提交申请</p>

                    </c:if>

                    <c:if test="${auditMsgHead eq '1111'}">
                        <p style="font-size:14px;">请耐心等待审核，我们会尽快将审核结果发送到您的手机。</p>
                    </c:if>

                    <c:if test="${btnMsg ne null}">
                        <div style="text-align: center;">
                            <button class="btn btn-primary" id="applition" value="${btnMsg}"><i class="ec-pencil"></i>&nbsp;${btnMsg}
                            </button>
                        </div>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
    <c:import url="foot.jsp"/>
</div>
</body>
<div style="display: none">
    <img id="img1" class="lazy" alt="企业法人营业执照"
         data-original="../../../../elephant_images/enterpriseQualification/businessLicensePhotocopy.png" width="130">
    <img id="img2" class="lazy" data-original="../../../../elephant_images/enterpriseQualification/demoidcard.png"
         width="130" alt="身份证">
    <img id="img3" class="lazy" data-original="../../../../elephant_images/enterpriseQualification/attorney.jpg"
         width="130" alt="委托书">.
</div>
</html>