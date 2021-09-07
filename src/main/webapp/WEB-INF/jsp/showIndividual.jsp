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
    <!-- MAIN CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css">
    <!-- FOR DEMO PURPOSES ONLY. You should remove this in your project -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/demo.css">
    <!-- GOOGLE FONTS -->
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700" rel="stylesheet">
    <!-- ICONS -->
    <link rel="apple-touch-icon" sizes="76x76" href="${pageContext.request.contextPath}/assets/img/apple-icon.png">
    <link rel="icon" type="image/png" sizes="96x96" href="${pageContext.request.contextPath}/assets/img/favicon.png">
    <script src="${pageContext.request.contextPath }/static/js/jquery-2.1.4.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/user-center.js"></script>
    <style>
        .setStep {
            cursor: pointer;
            font-size: 35px;
            text-align: center;
            padding: 0px 0;
            float: left;
            width: 18%;
        }

        .setStep_div {
            margin: 10px 10px;
            padding: 30px 10px;
            border: 5px dashed #ccc;
            border-radius: 10px;
        }

        .setStep_div_hover {
            background-color: #ffffff;
            box-shadow: 9px 5px 17px #ccc;
            border: 2px solid #ccc;
            padding: 33px 10px;
        }

        .setStep_i_hover {
            color: #0091f1;
            font-weight: bold;
        }

        .step {
            float: left;
            width: 9%;
            height: 150px;
            font-size: 45px;
            text-align: center;
            line-height: 150px;
            color: #ccc;
            position: relative;
        }

        .step_i {
            position: absolute;
            top: 12px;
        }

        @media (max-width: 780px) {
            .setStep {
                width: 50%;
            }

            .step {
                display: none;
            }
        }
    </style>
    <script>
        $(function () {
            $("#detail4").on("click", function () {
                showUploadImg($("#pic-individual").attr("src"));
            });
        })

        function showUploadImg(ImageSrc) {
            var screenHeight = document.documentElement.clientHeight;
            var screenWidth = document.documentElement.clientWidth;
            var showHeight = screenHeight * 0.4;
            var showWidth = screenWidth * 0.4;
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
                    area: [showWidth + 'px', showHeight + 'px'],
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
                        查看企业信息
                    </li>
                </ul>
                <!-- End .breadcrumb -->
            </div>
            <div class="row">
                <div class="col-lg-12 ">
                    <!-- col-lg-12 start here -->
                    <!-- col-lg-12 end here -->
                    <%--                    <div class="row">--%>
                    <%--                    <div class="panel-body">--%>
                    <%--                    <div class="tabs-basic">--%>
                    <%--                    <ul>--%>
                    <%--                        <li><a id="a_org" class="tabs-basica" data-index="0"--%>
                    <%--                               style="text-decoration: none;"--%>
                    <%--                               href="#">企业</a></li>--%>
                    <%--                        <li><a class="tabs-basica" data-index="1" href="#"--%>
                    <%--                               style="text-decoration: none;">事业单位</a>--%>
                    <%--                        </li>--%>
                    <%--                        <li><a id="outList" class="tabs-basica" data-index="2"--%>
                    <%--                               href="#" style="text-decoration: none;">民办非企业单位</a>--%>
                    <%--                        </li>--%>
                    <%--                        <li><a data-index="3" class="tabs-basica"--%>
                    <%--                               href="#"--%>
                    <%--                               style="text-decoration: none">个体工商户</a></li>--%>
                    <%--                        <li><a data-index="4" class="tabs-basica"--%>
                    <%--                               href="#"--%>
                    <%--                               style="text-decoration: none">社会团体</a></li>--%>
                    <%--                        <li><a data-index="5" class="tabs-basica"--%>
                    <%--                               href="#"--%>
                    <%--                               style="text-decoration: none">党政及国家机关</a></li>--%>
                    <%--                    </ul>--%>
                    <%--                    </div>--%>
                    <%--                    </div>--%>
                    <%--                </div>--%>
                </div>
            </div>
            <div class="panel-body">
                <div class="tabs-basic">
                    <div class="tabs-content-placeholder">
                        <div class="tab-content-active">
                            <div class="tab-content-active">
                                <img id="pic-individual" class="lazy" alt="个体工商户营业执照"
                                     src="${sessionScope.individualInfo.orgImg}"
                                     width="130" height="100" style="margin:0 auto;"/>
                                <div id="detail4"
                                     style="position:absolute;top:0; display:inline-block;width:130px;height:100px;margin-left: -130px; background:rgba(0,0,0,0.5);padding: 0;cursor: pointer;margin-top: 239px">
                                    <p style="color:#fff;line-height:14px;text-align:center;font-size:14px;margin-top:43px;">
                                        <i class="lnr lnr-magnifier"></i><br/></p>
                                </div>
                                <p style="margin-bottom: 30px;margin-left: 20px;margin-top: 10px">普通营业执照</p>
                            </div>
                        </div>
                    </div>
                </div>
                <label class="control-label">名称</label>
                <input name="orgName" class="form-control" type="text" value="${sessionScope.individualInfo.orgName}"
                       disabled="disabled">
                <br>
                <label class="control-label">注册号</label>
                <input name="registerCode" class="form-control" type="text"
                       value="${sessionScope.individualInfo.registerCode}" disabled="disabled">
                <br>
                <label class="control-label">单位所在地</label>
                <input name="orgAddress" class="form-control" type="text"
                       value="${sessionScope.individualInfo.orgAddress}" disabled="disabled">
                <br>
                <label class="control-label">固定号码</label>
                <input name="telPhone" class="form-control" type="text" value="${sessionScope.individualInfo.telPhone}"
                       disabled="disabled">
                <br>
                <label class="control-label">经营范围</label>
                <input name="businessScope" class="form-control" type="text"
                       value="${sessionScope.individualInfo.businessScope}" disabled="disabled">
                <br>
                <label class="control-label">营业期限</label>
                <input name="businessTerm" class="form-control" type="text"
                       value="${sessionScope.individualInfo.businessTerm}" disabled="disabled">
                <br>
                <label class="control-label">推荐人/公司名称</label>
                <input name="recommender" class="form-control" type="text"
                       value="${sessionScope.individualInfo.recommender}" disabled="disabled">
                <br>
                <label class="control-label">联系人手机号码</label>
                <input name="tempPhone" class="form-control" type="text"
                       value="${sessionScope.individualInfo.tempPhone}" disabled="disabled">
                <br>
                <a href="toreviewSuccess">
                    <button type="button" class="btn btn-primary">返回</button>
                </a>
            </div>
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

