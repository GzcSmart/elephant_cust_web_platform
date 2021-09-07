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
        <div class="main-content">
            <div class="container-fluid">
                <!-- OVERVIEW -->
                <div class="panel panel-headline">
                    <div class="panel-heading">
                        <h3 class="panel-title">用户中心</h3>
                    </div>
                </div>
                <div class="outlet">
                    <!-- Start .outlet -->
                    <!-- Page start here ( usual with .row ) -->
                    <div class="row">
                        <!-- Start .row -->
                        <div class="col-lg-12 ">
                            <!-- col-lg-12 start here -->
                            <div class="panel plain panel-default panelMove">
                                <!-- Start .panel -->
                                <div class="panel-heading white-bg" style=" background-color: #f5f5f5">
                                    <h4 class="panel-title">
                                        <i class="lnr lnr-inbox"></i> 操作指引
                                    </h4>
                                </div>
                                <div class="panel-body"
                                     style="padding-bottom: 15px;padding-top: 0px; background-color: #f5f5f5">
                                    <div class="panel-body" style="padding-bottom: 15px; background-color: #f5f5f5">
                                        <div class="col-lg-12"
                                             style="padding-left:0px;padding-top:0px;margin-bottom:15px;font-size:16px;overflow: hidden">
                                            <div id="step1" class="setStep">
                                                <div class="setStep_div"><i class="lnr lnr-pencil"> <br><span
                                                        style="font-size: 18px">1.注册企业</span></i></div>
                                            </div>
                                            <div class="step">... <i class="step_i">></i></div>
                                            <div id="step2" class="setStep ">
                                                <div class="setStep_div"><i class="lnr lnr-file-add"> <br><span
                                                        style="font-size: 18px">2.开通服务</span></i></div>
                                            </div>
                                            <div class="step">... <i class="step_i">></i></div>
                                            <div id="step3" class="setStep ">
                                                <div class="setStep_div"><i class="lnr lnr-download"> <br><span
                                                        style="font-size: 18px">3.下载demo</span></i></div>
                                            </div>
                                            <div class="step">... <i class="step_i">></i></div>
                                            <div id="step4" class="setStep ">
                                                <div class="setStep_div"><i class="lnr lnr-cog"> <br><span
                                                        style="font-size: 18px">4.接口调试</span></i></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- col-lg-12 end here -->
                        </div>

                        <div class="col-lg-12 ">
                            <!-- col-lg-12 start here -->
                            <div class="panel plain panel-default panelMove">
                                <!-- Start .panel -->
                                <!--zhangzhi 0630 begin 有个空白字符注意，没有添加则会导致无法实现拖动  -->
                                <div class="panel-heading white-bg">　</div>
                                <!--zhangzhi 0630 end  -->
                                <div class="panel-body white-bg">
                                    <div class="invoice">
                                        <!-- Start .invoice -->
                                        <div class="invoice-content" id="account">
                                            <!-- Start .invoice-content -->
                                            <table class="table table-hover non-responsive">
                                                <div class="well bn">
                                                    <div class="row">
                                                        <div class="col-md-7">
                                                            <div class="well bn pull-left mb0">
                                                                <span class="invoice-total-txt">账户余额（元）</span>
                                                                <span class="invoice-total-sum">
                                                            <span class="sum-sp4" id="balance"
                                                                  style="font-size: 30px;font-weight: bolder">${sessionScope.customerInfo.balance}</span>
                                                                <span class="invoice-total-txt"><a
                                                                        href="<%=basePath%>balance/index.do"
                                                                        class="sum-sp2 bpot1">充值记录</a>
                                                                </span>
                                                                    <div style="margin-top: 20px">
                                                            <span>
                                                                <a class="btn btn-primary"
                                                                   href="balanceChild">额度调配</a>
                                                            </span>
                                                            <span style="margin-left: 10px">
                                                            <a class="btn btn-primary"
                                                               href="javaScript:getStatusBeforeUpdateBalance();"
                                                               class="" id="chongzhi">
                                                                 充值
                                                            </a>
                                                            </span>
                                                                        </div>
                                                            </span>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-5 pt20">
                                                            <div class="well bn white-bg pull-left"
                                                                 style="width:245px;">
                                                            <span class="invoice-total-txt">账户状态：
                                                                <span id="cstatus"
                                                                      style="color:#3EB43E">${sessionScope.customerInfo.status eq  1 ? '正常' : ''}</span></span>
                                                                <br>
                                                                <br>
                                                                <div class="invoice-total-txt">
                                                                    <span>余额预警值：</span>
                                                                    <span style="color:#2aabd2;font-weight:bold"
                                                                          id="balanceWarning"></span>&nbsp;0元&nbsp;&nbsp;
                                                                    <span id="warningDisable" style="display: none"> <i
                                                                            class="im-pencil" onclick=''
                                                                            style="cursor: pointer;color: #00aff0"></i>
                                                                </span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </table>
                                        </div>
                                        <!-- End .invoice-footer -->
                                    </div>
                                </div>
                            </div>
                            <!-- End .panel -->
                        </div>

                        <!--  guoyuxuan 20160622 新增产品服务模块 begin-->
                        <div class="col-lg-12 ">
                            <!-- col-lg-12 start here -->
                            <div class="panel plain panel-default panelMove">
                                <div class="panel-heading white-bg">
                                    <h4 class="panel-title" style="display: inline-block"><i class="lnr lnr-list"></i>
                                        产品服务 </h4>
                                    <a style="float: right;padding: 12px 0;"
                                       href="getConditionYw">
                                        <div
                                                style="color: #2aabd2;font-weight: bold"> 更多服务>>>
                                        </div>
                                    </a>
                                </div>
                                <!-- Start .panel -->
                                <div class="panel-body" style="padding: 35px">
                                    <!-- Start .invoice -->
                                    <div class="row" id="ywList">
                                        <%--                                    <div class="col-md-3" style="width: 20%" >--%>
                                        <%--                                        <div class="metric">--%>
                                        <%--                                            <span class="icon"><i class="fa fa-download"></i></span>--%>
                                        <%--                                            <p>--%>
                                        <%--                                                <span class="number">1,252</span>--%>
                                        <%--                                                <span class="title">Downloads</span>--%>
                                        <%--                                            </p>--%>
                                        <%--                                        </div>--%>
                                        <%--                                    </div>--%>
                                    </div>
                                    <%--                                    <div id="ywList"></div>--%>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
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

