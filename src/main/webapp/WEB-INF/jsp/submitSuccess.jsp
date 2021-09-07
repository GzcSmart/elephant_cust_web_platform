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
                        <div class="col-lg-3"><i class="lnr lnr-picture"> 第二步：上传证件照片</i></div>
                        <div class="col-lg-3" style="/* padding-left:0px; */color:#0091f1;"><i
                                class="lnr lnr-checkmark-circle"> 第三步：提交成功</i></div>
                    </div>
                </div>
            </div>
            <form class="form-horizontal" method="post" id="orgAuditForm"
                  action="addAllIndividual">
                <input value="" id="img_src" type="hidden" name="img_src"/>
                <div class="panel-body">
                    <div class="row" style="padding:5% 25%;">
                        <!-- Start .row -->
                        <div class="outer col-lg-12 ">
                            <div class="panel panel-default">
                                <div class="panel-heading" style="background: rgb(229,245,255);">
                                    <h3 class="col-lg-offset-1" style="margin-left: 0px;">
                                        <i class="lnr lnr-smile" style="color: #71D398;"></i>提交成功，请耐心等待审核
                                    </h3>
                                </div>
                                <div class="panel-body">
                                    <p style="font-size:16px">温馨提示：我们将通过短信的方式将审核结果通知您</p>
                                    <br>
                                </div>
                            </div>
                        </div>
                        <!-- table end  -->
                        <!-- End .row -->
                        <!-- Page End here -->
                    </div>
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


