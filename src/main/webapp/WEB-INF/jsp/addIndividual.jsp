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
        //操作指引样式
        $(function () {
            //快速使用展开
            $("#sideNav").addClass("show");

            $(".setStep_div").mouseover(function () {
                $(this).addClass("setStep_div_hover");
                $(this).find("i").addClass("setStep_i_hover");
            })
            $(".setStep_div").mouseout(function () {
                $(this).removeClass("setStep_div_hover");
                $(this).find("i").removeClass("setStep_i_hover");
            })
        });
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
                        填写基本信息
                    </li>
                </ul>
                <!-- End .breadcrumb -->
            </div>
            <div class="row">
                <div class="col-lg-12 ">
                    <!-- col-lg-12 start here -->
                    <div class="panel plain panel-default panelMove">
                        <!-- Start .panel -->
                        <div class="panel-body" style="padding-bottom: 20px">
                            <div class="col-lg-12"
                                 style="padding-left:0px;padding-top:0px;margin-bottom:15px;font-size:16px;">
                                <div class="col-lg-3" style="/* padding-left:0px; */color:#0091f1;"><i
                                        class="lnr lnr-pencil"> <strong> 第一步：填写基本信息</strong></i></div>
                                <div class="col-lg-3"><i class="lnr lnr-picture"> 第二步：上传证件照片</i></div>
                                <div class="col-lg-3"><i class="lnr lnr-checkmark-circle"> 第三步：提交成功</i></div>
                            </div>
                        </div>
                    </div>
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
            <form class="form-horizontal" method="post" id="orgAuditForm"
                  action="addIndividual">
                <div class="panel-body">
                    <label class="control-label">名称</label>
                    <input name="orgName" class="form-control" type="text"
                           value="${sessionScope.individualInfo.orgName}">
                    <br>
                    <label class="control-label">注册号</label>
                    <input name="registerCode" class="form-control" type="text"
                           value="${sessionScope.individualInfo.registerCode}">
                    <br>
                    <label class="control-label">单位所在地</label>
                    <input name="orgAddress" class="form-control" type="text"
                           value="${sessionScope.individualInfo.orgAddress}">
                    <br>
                    <label class="control-label">固定号码</label>
                    <input name="telPhone" class="form-control" type="text"
                           value="${sessionScope.individualInfo.telPhone}">
                    <br>
                    <label class="control-label">经营范围</label>
                    <input name="businessScope" class="form-control" type="text"
                           value="${sessionScope.individualInfo.businessScope}">
                    <br>
                    <label class="control-label">营业期限</label>
                    <input name="businessTerm" class="form-control" type="text"
                           value="${sessionScope.individualInfo.businessTerm}">
                    <br>
                    <label class="control-label">推荐人/公司名称</label>
                    <input name="recommender" class="form-control" type="text"
                           value="${sessionScope.individualInfo.recommender}">
                    <br>
                    <label class="control-label">联系人手机号码</label>
                    <input name="tempPhone" class="form-control" type="text"
                           value="${sessionScope.individualInfo.tempPhone}">
                    <br>
                    <button type="submit" class="btn btn-primary">下一步</button>
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

