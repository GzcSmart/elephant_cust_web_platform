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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css">
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
    <script src="${pageContext.request.contextPath}/static/js/jquery-2.1.4.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/layui/layui.js"></script>
    <script type="text/javascript">
        // $(function (){
        //   var data = {};
        //   data = $("#ywList").val();
        // })
        function ywCategory(current) {
            window.location.href = "/tostatistics?id=" + current;
        }

        function customerYw(current) {
            var id = $("#fwlx").val();
            window.location.href = "/tostatistics?customerYwId=" + current + "&id=" + id;
        }

        function statementDate() {
            var id = $("#fwlx").val();
            var customerYwId = $("#fwmc").val();
            var date = $("#test13").val();
            window.location.href = "/tostatistics?id=" + id + "&customerYwId=" + customerYwId + "&statementDate=" + date;
        }

        function viewDetails(id) {
            var screenWidth = document.documentElement.clientWidth;
            if (screenWidth > 780) {
                screenWidth = 780;
            } else {
                screenWidth = screenWidth * 0.9;
            }
            var screenHeight = document.documentElement.clientHeight;
            if (screenHeight > 500) {
                screenHeight = 500;
            } else {
                screenHeight = screenHeight * 0.68;
            }
            layer.open({
                type: 2,
                title: '<i class="br-address-book" style="color:#828ea2">  <b>查看详情与账单</b></i>',
                area: [screenWidth + 'px', screenHeight + 'px'],
                shade: 0.03,
                scrollbar: false,
                fix: false,
                maxmin: false,
                content: '/viewStatistics?id=' + id
            });
        }
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
                                        数据统计
                                    </li>
                                </ul>
                                <div class="panel panel-default plain toggle panelClose panelRefresh">
                                    <input type="hidden" value="${allYwInfoList}" id="ywList">
                                    <form action="" id="queryForm">
                                        <div class="panel-body" style="border:1px solid #e4e9eb;">
                                            <label>服务类型：</label><select id="fwlx" class="form-control"
                                                                        style="width: 200px;display: inline-block"
                                                                        onchange="ywCategory(this.value)">
                                            <option value="">全部</option>
                                            <c:forEach var="ywCategory" items="${ywInfoCategories}">
                                                <option value="${ywCategory.id}"
                                                        <c:if test="${ywCategory.id==ywInfoId}">selected</c:if>>${ywCategory.categoryName}</option>
                                            </c:forEach>
                                        </select>
                                            <label style="margin-left: 10px">服务名称：</label><select id="fwmc"
                                                                                                  class="form-control"
                                                                                                  style="width: 200px;display: inline-block"
                                                                                                  onchange="customerYw(this.value)">
                                            <option value="">全部</option>
                                            <c:forEach var="allYw" items="${allYwInfoList}">
                                                <option value="${allYw.customerYwId}"
                                                        <c:if test="${allYw.customerYwId==customerYwId}">selected</c:if>>${allYw.ywName}</option>
                                            </c:forEach>
                                        </select>
                                            <div style="display: inline-block;margin-left: 10px">
                                                <label class="">账单日期：</label>
                                                <div class="" style="display: inline-block">
                                                    <input type="text" id="test13" placeholder="yyyy-MM"
                                                           value="${statementDate}">
                                                    <button type="button" class="btn btn-info" onclick="statementDate()"
                                                            style="margin-left: 10px">查看
                                                    </button>
                                                </div>
                                                <%--                        <select class="bill-sele1 form-control" autocomplete="off" style="display:inline-block! important;width:85px;" id="YY' name='YY'></select>--%>
                                                <%--                        <select class="bill-sele1 form-control" autocomplete="off" style="display:inline-block! important;width:70px;" id='MM' name="MM"></select>--%>
                                            </div>
                                            <div class="table-responsive" style="margin-top: 10px;">
                                                <table class="table table-hover table-bordered non-responsive"
                                                       style="margin-bottom:90px" id="ywInfoTable">
                                                    <thead>
                                                    <tr id="tab_td">
                                                        <th class="per text-center" style="width: 5%"><span value=""
                                                                                                            style="padding:2px 0;float: left; margin-right: 10px;">
                                                序号</span></th>
                                                        <th class="per text-center" style="width: 5%"><span value=""
                                                                                                            style="padding:2px 0;float: left; margin-right: 10px;">
                                                服务名称</span></th>
                                                        <th class="per text-center" style="width: 5%"><span value=""
                                                                                                            style="padding:2px 0;float: left; margin-right: 10px;">
                                                使用总量(次)</span></th>
                                                        <th class="per text-center" style="width: 5%"><span value=""
                                                                                                            style="padding:2px 0;float: left; margin-right: 10px;">
                                                使用成功量(次)</span></th>
                                                        <th class="per text-center" style="width: 5%"><span value=""
                                                                                                            style="padding:2px 0;float: left; margin-right: 10px;">
                                                未知使用量(次)</span></th>
                                                        <th class="per text-center" style="width: 5%"><span value=""
                                                                                                            style="padding:2px 0;float: left; margin-right: 10px;">
                                                失败使用量(次)</span></th>
                                                        <th class="per text-center" style="width: 5%"><span value=""
                                                                                                            style="padding:2px 0;float: left; margin-right: 10px;">
                                                总花费(元)</span></th>
                                                        <th class="per text-center" style="width: 5%"><span value=""
                                                                                                            style="padding:2px 0;float: left; margin-right: 10px;">
                                                测试费用(元)</span></th>
                                                        <th class="per text-center" style="width: 5%"><span value=""
                                                                                                            style="padding:2px 0;float: left; margin-right: 10px;">
                                                返现费用(元)</span></th>
                                                        <th class="per text-center" style="width: 5%"><span value=""
                                                                                                            style="padding:2px 0;float: left; margin-right: 10px;">
                                                实际费用(元)</span></th>
                                                        <th class="per text-center" style="width: 5%"><span value=""
                                                                                                            style="padding:2px 0;float: left; margin-right: 10px;">
                                                结算总价(元)</span></th>
                                                        <th class="per text-center" style="width: 5%"><span value=""
                                                                                                            style="padding:2px 0;float: left; margin-right: 10px;">
                                                结算返还(元)</span></th>
                                                        <th class="per text-center" style="width: 5%"><span value="">
                                                操作</span></th>
                                                    </tr>
                                                    </thead>
                                                    <c:forEach var="all" items="${allRecord}">
                                                        <c:forEach var="ywInfo" items="${allYwInfoList}">
                                                            <tr id="tr">
                                                                <c:if test="${all.customerYwId == ywInfo.customerYwId}">
                                                                    <td>
                                                                            ${all.id}
                                                                    </td>
                                                                    <td class="per text-center">
                                                                            ${ywInfo.ywName}
                                                                    </td>
                                                                    <td class="per text-center">
                                                                            ${all.apiTotal}
                                                                    </td>
                                                                    <td class="per text-center">
                                                                            ${all.successTimes}
                                                                    </td>
                                                                    <td class="per text-center">
                                                                            ${all.unknownTimes}
                                                                    </td>
                                                                    <td class="per text-center">
                                                                            ${all.failTimes}
                                                                    </td>
                                                                    <td class="per text-center">
                                                                            ${all.totalCost}
                                                                    </td>
                                                                    <td class="per text-center">
                                                                            ${all.testCost}
                                                                    </td>
                                                                    <td class="per text-center">
                                                                            ${all.backCost}
                                                                    </td>
                                                                    <td class="per text-center">
                                                                            ${all.actualCost}
                                                                    </td>
                                                                    <td class="per text-center">
                                                                            ${all.settleTotalPrice}
                                                                    </td>
                                                                    <td class="per text-center">
                                                                            ${all.settleBackPrice}
                                                                    </td>
                                                                    <td class="per text-center">
                                                                        <button type="button" class="btn btn-info"
                                                                                value="${all.id}"
                                                                                onclick="viewDetails(this.value)">
                                                                            查看详情与账单
                                                                        </button>
                                                                    </td>
                                                                </c:if>
                                                            </tr>
                                                        </c:forEach>
                                                    </c:forEach>
                                                </table>
                                            </div>
                                            <div id="page" align="center"></div>
                                        </div>
                                    </form>
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
<script src="${pageContext.request.contextPath}/assets/vendor/jquery/jquery.js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/jquery.easy-pie-chart/jquery.easypiechart.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/chartist/js/chartist.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/scripts/klorofil-common.js"></script>
<script src="${pageContext.request.contextPath}/static/layui/layui.js"></script>
</body>

</html>
<script>
    layui.use('laydate', function () {
        var laydate = layui.laydate;
        laydate.render({
            elem: '#test13'
            , format: 'yyyy-MM'
        });
    })
</script>
