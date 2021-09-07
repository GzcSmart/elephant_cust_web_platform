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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css">
    <script src="${pageContext.request.contextPath }/static/js/jquery-2.1.4.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/layui/layui.js"></script>
    <script type="text/javascript">

    </script>
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

        .layui-input {
            width: 50%;
        }

        .layui-form-item {
            margin-left: 300px;
        }

        .layui-form-label {
            width: 200px;
        }
    </style>
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
            <div id="content">
                <div class="content-wrapper" style="min-height:800px;">
                    <div class="outlet notSortable">
                        <div class="row">
                            <div class="col-lg-12">
                                <ul class="breadcrumb">
                                    <li>
                                        <a href="go2UserCenter">用户中心</a>
                                        <i class="lnr lnr-chevron-right"></i>
                                    </li>
                                    <li>
                                        发票管理
                                        <i class="lnr lnr-chevron-right"></i>
                                    </li>
                                    <li>
                                        发票申请
                                    </li>
                                </ul>
                                <div class="panel panel-default plain toggle panelClose panelRefresh">
                                    <div class="panel-body" style="">
                                        <div class="col-lg-12"
                                             style="padding-left:0px;padding-top:0px;font-size:16px;">
                                            <div class="col-lg-3"><i
                                                    class="lnr lnr-pencil"> <strong> 第一步：确认开票信息</strong></i></div>
                                            <div class="col-lg-3" style="/* padding-left:0px; */color:#0091f1;"><i
                                                    class="lnr lnr-picture"> 第二步：选择账单</i></div>
                                            <div class="col-lg-3"><i class="lnr lnr-checkmark-circle"> 第三步：选择收票地址</i>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="panel-body" style="border:1px solid #e4e9eb;">
                                        <form class="layui-form" action="toselectAddress">
                                            <div class="layui-form-item">
                                                <label class="layui-form-label" style="padding: 7px 0">*
                                                    发票类型&nbsp;</label>
                                                <div class="layui-input-inline" style="width: 300px;margin-left: 20px">
                                                    <select name="invoiceType" lay-verify="required" lay-search=""
                                                            style="display: inline-block;height: 35px;width: 250px">
                                                        <option value="">请选择发票类型</option>
                                                        <option value="0"
                                                                <c:if test="${sessionScope.customerInvoiceApply2.invoiceType == 0}">selected</c:if>>
                                                            增值税普通发票
                                                        </option>
                                                        <option value="1"
                                                                <c:if test="${sessionScope.customerInvoiceApply2.invoiceType == 1}">selected</c:if>>
                                                            增值税专用发票
                                                        </option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="layui-form-item">
                                                <label class="layui-form-label" style="padding: 7px 0">*
                                                    服务名称&nbsp;</label>
                                                <div class="layui-input-inline" style="width: 300px;margin-left: 20px">
                                                    <select name="customerYwId" lay-verify="required" lay-search=""
                                                            style="display: inline-block;height: 35px;width: 250px">
                                                        <option value="">请选择服务名称</option>
                                                        <option value="1"
                                                                <c:if test="${sessionScope.customerInvoiceApply2.customerYwId.equals('1')}">selected</c:if>>
                                                            一键登录
                                                        </option>
                                                        <option value="3"
                                                                <c:if test="${sessionScope.customerInvoiceApply2.customerYwId.equals('3')}">selected</c:if>>
                                                            短信验证码
                                                        </option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="layui-form-item">
                                                <label class="layui-form-label" style="padding: 7px 0">*
                                                    开票账单&nbsp;</label>
                                                <div class="layui-input-inline" style="width: 300px;margin-left: 20px">
                                                    <select name="billId" lay-verify="required" lay-search=""
                                                            style="display: inline-block;height: 35px;width: 250px">
                                                        <option value="">请选择开票账单</option>
                                                        <option value="123"
                                                                <c:if test="${sessionScope.customerInvoiceApply2.billId.equals('123')}">selected</c:if>>
                                                            123
                                                        </option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="layui-form-item">
                                                <label class="layui-form-label" style="padding: 7px 0">*
                                                    盖章类型&nbsp;</label>
                                                <div class="layui-input-inline" style="width: 300px;margin-left: 20px">
                                                    <select name="stampType" lay-verify="required" lay-search=""
                                                            style="display: inline-block;height: 35px;width: 250px">
                                                        <option value="财务章"
                                                                <c:if test="${sessionScope.customerInvoiceApply2.stampType.equals('财务章')}">selected</c:if>>
                                                            财务章
                                                        </option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="layui-form-item">
                                                <label class="layui-form-label"
                                                       style="padding: 7px 0;margin-right: 20px">* 纸质对账单</label>
                                                <div class="layui-input-block"
                                                     style="line-height: 36px;margin-left: 20px">
                                                    <input
                                                            <c:if test="${sessionScope.customerInvoiceApply2.needBill == 0}">checked</c:if>
                                                            type="radio" name="needBill" value="0" title="不需要"
                                                            style="display: inline-block;" checked/>不需要
                                                    <input
                                                            <c:if test="${sessionScope.customerInvoiceApply2.needBill == 1}">checked</c:if>
                                                            type="radio" name="needBill" value="1" title="需要"
                                                            style="display: inline-block"/>需要
                                                </div>
                                            </div>
                                            <div class="layui-form-item">
                                                <label class="layui-form-label"
                                                       style="padding: 7px 0;margin-right: 20px">*
                                                    发票项目&nbsp;&nbsp;</label>
                                                <div class="layui-input-block">
                                                    <input style="width: 300px" type="text" name="invoiceCategory"
                                                           lay-verify="title" autocomplete="off" placeholder=""
                                                           class="layui-input" value="信息服务费，通信服务费">
                                                </div>
                                            </div>
                                            <div class="layui-form-item">
                                                <label class="layui-form-label"
                                                       style="padding: 7px 0;margin-right: 20px">*
                                                    发票金额&nbsp;&nbsp;</label>
                                                <input style="width: 100px" type="text" name="invoiceAmount"
                                                       lay-verify="title" autocomplete="off" placeholder=""
                                                       class="layui-input" value="0.00" disabled="disabled">
                                            </div>
                                            <a href="toinvoiceApply">
                                                <button type="button" class="layui-btn" onclick="">上一步</button>
                                            </a>
                                            <button type="submit" class="layui-btn" onclick="">下一步</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <input id="pageNumber" hidden value="1">
                            <input id="url" hidden value="${pageContext.request.contextPath}">
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
        <c:import url="foot.jsp"/>
    </div>
    <!-- END MAIN -->
</div>
<!-- END WRAPPER -->
<!-- Javascript -->
<script src="${pageContext.request.contextPath}/assets/vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/jquery.easy-pie-chart/jquery.easypiechart.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/chartist/js/chartist.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/scripts/klorofil-common.js"></script>
<script src="${pageContext.request.contextPath}/static/layui/layui.js"></script>
<script>

</script>
</body>

</html>
<script src="${pageContext.request.contextPath}/static/layui/layui.js"></script>
<script type="text/javascript">

</script>
