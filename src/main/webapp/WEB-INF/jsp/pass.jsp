<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="taglib.jsp" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!doctype html>
<html lang="en">

<head>
    <title>大象能力平台</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <!-- VENDOR CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/vendor/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/linearicons/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/icons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/chartist/css/chartist-custom.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css">
    <!-- MAIN CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css">
    <!-- FOR DEMO PURPOSES ONLY. You should remove this in your project -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/demo.css">
    <!-- GOOGLE FONTS -->
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700" rel="stylesheet">
    <!-- ICONS -->
    <link rel="apple-touch-icon" sizes="76x76" href="${pageContext.request.contextPath}/assets/img/apple-icon.png">
    <link rel="icon" type="image/png" sizes="96x96" href="${pageContext.request.contextPath}/assets/img/favicon.png">
    <link href="${pageContext.request.contextPath}/static/css/tabs-basic.css" rel="stylesheet"/>
    <style type="text/css">
        .tabs-basic {
            font: bold 14px sans-serif;
            max-width: auto;
            margin: 30px auto;
        }

        .tabs-basic .tabs-content-placeholder {
            overflow: hidden;
            border: 1px solid #dddddd;
            border-bottom: 0px;
            border-left: 0px;
            border-right: 0px;
            font-weight: normal;
            background-color: #fff;
            padding: 15px 30px 30px;
            margin: 0 auto;
        }

        .error {
            font-weight: normal;
        }

        input.error, textarea.error {
            border: 1px solid red;
        }

        .title {
            float: left;
            margin-left: 1px;
            color: rgb(26, 26, 26);
            font-size: 16px;
        }

        .outLine {
            margin-left: 35px;
            margin-right: 30px;
            border: 1px dotted rgb(180, 181, 182);
        }

        .line {
            border: 1px dotted rgb(180, 181, 182);
            margin-left: 1px;
        }

        /* zhangzhi 20161212 begin*/
        @media (max-width: 1520px) {
            .pace-done {
                min-width: 1520px;
                overflow-x: scroll;
            }
        }

        .col-md-3 {
            width: 25%;
            float: left;
        }

        .col-md-4 {
            width: 33.33333333%;
            float: left;
        }

        .form-inline .form-control {
            display: inline-block;
            width: auto;
            vertical-align: middle;
        }

        .layui-layer-btn {
            background-color: white;
        }

        .test .col-sm-4 {
            width: 33.33333333%;
            float: left;
        }

        .test .col-sm-8 {
            width: 66.66666667%;
            float: left;
        }

        .clearfix {
            clear: both;
        }

        @media (max-width: 1520px) {
            .pace-done {
                min-width: 0px !important;
                overflow-x: auto !important;
            }

            .constant_width {
                width: 75% !important;
            }
        }

        @media (max-width: 635px) {

            .collagen_width {
                width: 100% !important;
                text-align: left !important;
                margin-left: 15px;
            }

            .margin_leftnone {
                margin-left: 0px !important;
            }
        }

        @media (max-width: 500px) {

            .margin_leftnone {
                margin-left: 0px !important;
            }

            .margin_leftsecnone {
                margin-left: 0px !important;
            }
        }

    </style>
    <script src="${pageContext.request.contextPath }/static/js/jquery-2.1.4.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/user-center.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery.lazyload.min.js"></script>
    <script>
        $(function () {
            $("#detail4").on("click", function () {
                showUploadImg($("#pic-individual").attr("src"));
            });
            $('img.lazy').lazyload({
                effect: "fadeIn",
                skip_invisible: false,
                event: 'sporty'
            });
            $(window).bind('load', function () {
                var timeout = setTimeout(function () {
                    $('img.lazy').trigger('sporty');
                }, 500);
            });
            $("#orgAudit_ui").addClass("show");
            $("#orgAudit_a").addClass("active");
        });

        function showUploadImg(ImageSrc) {
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
                    title: '<b><i class="lnr lnr-smile"/> 浏览</b>',
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
</head>

<body>
<!-- WRAPPER -->
<div id="wrapper">
    <c:import url="header.jsp"/>
    <!-- END NAVBAR -->
    <!-- LEFT SIDEBAR -->
    <c:import url="manager_menu.jsp"/>
    <!-- END LEFT SIDEBAR -->
    <!-- MAIN -->
    <div class="main">
        <!-- MAIN CONTENT -->
        <div class="panel">
            <div class="col-lg-12 heading">
                <h4 class="page-header" style="font-weight: bolder">个体工商户信息</h4>
                <!-- Start .bredcrumb -->
                <ul class="breadcrumb">
                    <li>
                        <a href="go2UserCenter">用户中心</a>
                        <i class="lnr lnr-chevron-right"></i>
                    </li>
                    <li>
                        企业申请
                        <i class="lnr lnr-chevron-right"></i>
                    </li>
                    <li>
                        上传认证照片
                    </li>
                </ul>
                <!-- End .breadcrumb -->
            </div>
            <div class="panel plain panel-default panelMove">
                <!-- Start .panel -->
                <div class="panel-body" style="padding-bottom: 20px">
                    <div class="col-lg-12"
                         style="padding-left:0px;padding-top:0px;margin-bottom:15px;font-size:16px;">
                        <div class="col-lg-3"><i
                                class="lnr lnr-pencil"> <strong> 第一步：填写基本信息</strong></i></div>
                        <div class="col-lg-3" style="/* padding-left:0px; */color:#0091f1;"><i class="lnr lnr-picture">
                            第二步：上传证件照片</i></div>
                        <div class="col-lg-3"><i class="lnr lnr-checkmark-circle"> 第三步：提交成功</i></div>
                    </div>
                </div>
            </div>
            <form class="form-horizontal" method="post" id="orgAuditForm"
                  action="addAllIndividual">
                <input value="" id="img_src" type="hidden" name="img_src"/>
                <div class="panel-body">
                    <div class="tabs-basic">
                        <div class="tabs-content-placeholder">
                            <div class="tab-content-active">
                                <div class="tab-content-active title">个体工商户证件</div>
                                <br/>
                                <hr class="line"/>
                                <div class="tab-content-active row">
                                    <div class="tab-content-active col-md-12"
                                         style="height: 100px;width: 100%;position:relative;">
                                        <div class="tab-content-active">
                                            <img id="pic-individual1" class="lazy" alt="" width="130" height="100"
                                                 style="margin:0 auto;margin-right: 15px"/>
                                            <div id="detail3"
                                                 style="position:absolute;top:0; display:inline-block;width:130px;height:100px;margin-left: -150px; background:rgba(0,0,0,0.5);padding: 0;cursor: pointer">
                                                <p style="color:#fff;line-height:14px;text-align:center;font-size:14px;margin-top:43px;"></p>
                                                <%--                                            <i class="lnr lnr-magnifier"></i><br/>上传图片</p>--%>
                                                <button type="button" class="layui-btn" id="upload-button"
                                                        style="margin-top: 19px;width: 130px">
                                                    <i class="layui-icon">&#xe67c;</i>图片上传
                                                </button>
                                            </div>
                                            <%--                                    <script>upload1('img2', 'detail3', 'orgcodeCertificateId', '<%=basePath%>');</script>--%>
                                            <%--                                    <input name="orgcodeCertificateId"--%>
                                            <%--                                           id="orgcodeCertificateId" type="text"--%>
                                            <%--                                           value="" hidden--%>
                                            <%--                                           readonly="readonly"/>--%>
                                            <img id="pic-individual" class="lazy" alt="个体工商户营业执照"
                                                 src="../../static/images/businessLicense.jpg"
                                                 width="130" height="100" style="margin:0 auto;"/>
                                            <div id="detail4"
                                                 style="position:absolute;top:0; display:inline-block;width:130px;height:100px;margin-left: -130px; background:rgba(0,0,0,0.5);padding: 0;cursor: pointer">
                                                <p style="color:#fff;line-height:14px;text-align:center;font-size:14px;margin-top:43px;">
                                                    <i class="lnr lnr-magnifier"></i><br/>示例</p>
                                            </div>
                                        </div>
                                        <div class="tab-content-active col-md-12">
                                            <label class="control-label">普通营业执照</label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <a href="toaddIndividual">
                        <button type="button" class="btn btn-primary">上一步</button>
                    </a>
                    <button type="submit" class="btn btn-primary" style="float: right">提交</button>
                </div>
            </form>
        </div>
        <!-- END MAIN CONTENT -->
        <c:import url="foot.jsp"/>
    </div>
    <!-- END MAIN -->

</div>
<!-- END WRAPPER -->
<!-- Javascript -->
<script src="${pageContext.request.contextPath}/assets/vendor/jquery/jquery.js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/jquery.easy-pie-chart/jquery.easypiechart.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/chartist/js/chartist.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/scripts/klorofil-common.js"></script>
<script src="${pageContext.request.contextPath}/static/layui/layui.js"></script>
</body>
</html>
<script src="${pageContext.request.contextPath}/static/layui/layui.js"></script>
<script type="text/javascript">
    layui.use('upload', function () {
        let upload = layui.upload;
        let $ = layui.$;
        //执行实例
        let uploadInst = upload.render({
            elem: '#upload-button' //绑定元素
            , url: 'uploadimg' //上传接口
            , done: function (res) {
                //上传完毕回调
                if (res.code == 1) {
                    layer.msg(res.msg);
                    let imagePath = res.data.src;
                    $("#pic-individual1").attr("src", imagePath);
                    $("#img_src").attr("value", imagePath);
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

