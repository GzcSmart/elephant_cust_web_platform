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
    <script src="${pageContext.request.contextPath}/static/js/jquery-2.1.4.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/layui/layui.js"></script>
    <script type="text/javascript">
        $(function () {
            tCode(${code});
        })

        function rset(){
            $("#ywInfoCategories").val("");
            $("#ywInfos").val("");
            $("#serialNumber").val("");
            $("#vCode").val("0");
            tCode(0);
            $("#returnCode").val("");
            $("#returnCodeDescribe").val("");
            $("#operator").val("");
            $("#receivingNumber").val("");
            $("#appName").val("");
            $("#appId").val("");
            $("#test11").val("");
            $("#test12").val("");
            selDetails();
        }

        function selDetails() {
            var ywInfoCategories = $("#ywInfoCategories").val();
            var ywInfos = $("#ywInfos").val();
            var serialNumber = $("#serialNumber").val();
            var code = $("#vCode").val();
            var returnCode = $("#returnCode").val();
            var returnCodeDescribe = $("#returnCodeDescribe").val();
            var operator = $("#operator").val();
            var receivingNumber = $("#receivingNumber").val();
            var appName = $("#appName").val();
            var appId = $("#appId").val();
            var startTime = $("#test11").val();
            var endTime = $("#test12").val();
            window.location.href = "ywDetail?ywInfoCategories=" + ywInfoCategories + "&ywInfos=" + ywInfos + "&serialNumber=" + encodeURIComponent(serialNumber) + "&returnCode=" + encodeURIComponent(returnCode) + "&returnCodeDescribe=" + encodeURIComponent(returnCodeDescribe) + "&operator=" + operator
                + "&receivingNumber=" + encodeURIComponent(receivingNumber) + "&appName=" + encodeURIComponent(appName) + "&appId=" + encodeURIComponent(appId) + "&startTime=" + startTime + "&endTime=" + endTime + "&code=" + code;
        }

        function importExcel(id) {
            window.location.href = "/exportExcel?id=" + id;
        }

        function tCode(value) {
            if (value == 0 || value == null) {
                $("#returnCode").show();
                $("#returnCodeDescribe").hide();
                $("#returnCodeDescribe").val("");
            } else {
                $("#returnCode").hide();
                $("#returnCodeDescribe").show();
                $("#returnCode").val("");
            }
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
                                        数据详情
                                        <i class="lnr lnr-chevron-right"></i>
                                    </li>
                                    <li>
                                        服务调用详情
                                    </li>
                                </ul>
                                <div class="panel panel-default plain toggle panelClose panelRefresh">
                                    <form action="" id="queryForm">
                                        <div class="panel-body" style="border:1px solid #e4e9eb;">
                                            <label>服务类型：</label><select id="ywInfoCategories" class="form-control"
                                                                        style="width: 150px;display: inline-block">
                                            <option value="">全部</option>
                                            <c:forEach var="ywCate" items="${ywInfoCategories}">
                                                <option value="${ywCate.id}"
                                                        <c:if test="${ywCate.id == ywInfoCategories1}">selected</c:if>>${ywCate.categoryName}</option>
                                            </c:forEach>
                                        </select>
                                            <label style="margin-left: 10px">服务名称：</label><select id="ywInfos"
                                                                                                  class="form-control"
                                                                                                  style="width: 150px;display: inline-block">
                                            <option value="">全部</option>
                                            <c:forEach var="ywInfos" items="${ywInfos}">
                                                <option value="${ywInfos.customerYwId}"
                                                        <c:if test="${ywInfos.customerYwId == ywInfos1}">selected</c:if>>${ywInfos.ywName}</option>
                                            </c:forEach>
                                        </select>
                                            <label style="margin-left: 10px">流水号：</label>
                                            <input id="serialNumber" style="display: inline-block;width: 150px"
                                                   placeholder="请输入流水号" value="${serialNumber}"/>
                                            <select id="vCode" class="form-control"
                                                    style="width: 130px;display: inline-block"
                                                    onchange="tCode(this.value)">
                                                <option value="0" <c:if test="${code == 0}">selected</c:if>>返回码</option>
                                                <option value="1" <c:if test="${code == 1}">selected</c:if>>返回码描述
                                                </option>
                                            </select>
                                            <input id="returnCode" style="width: 150px" placeholder="请输入返回码"
                                                   value="${returnCode}"/>
                                            <input id="returnCodeDescribe" style="width: 150px" placeholder="请输入返回码描述"
                                                   value="${returnCodeDescribe}"/>
                                            <label style="margin-left: 10px">运营商属性：</label>
                                            <select id="operator" class="form-control"
                                                    style="width: 150px;display: inline-block">
                                                <option value="">全部</option>
                                                <c:forEach var="ywR" items="${ywRecords}">
                                                    <option value=""
                                                            <c:if test="${ywR.operator == operator}">selected</c:if>>${ywR.operator}</option>
                                                </c:forEach>
                                            </select>
                                            <label style="margin-left: 10px">接受号码：</label>
                                            <input id="receivingNumber" style="display: inline-block;width: 150px"
                                                   placeholder="请输入接受号码" value="${receivingNumber}"/>
                                            <div style="margin-top: 20px"><label style="margin-left: 10px">应用名称：</label>
                                                <input id="appName" style="display: inline-block;width: 150px"
                                                       placeholder="请输入应用名称" value="${appName}"/>
                                                <label style="margin-left: 10px">appId：</label>
                                                <input id="appId" style="display: inline-block;width: 150px"
                                                       placeholder="请输入appId" value="${appId}"/>
                                                <div class="" style="display: inline-block">
                                                    <label class="">开始时间：</label>
                                                    <div class="" style="display: inline-block">
                                                        <input type="text" id="test11" placeholder="yyyy-MM-dd"
                                                               value="${startTime}">
                                                    </div>
                                                </div>
                                                <div class="" style="display: inline-block">
                                                    <label class="">结束时间：</label>
                                                    <div class="" style="display: inline-block">
                                                        <input type="text" id="test12" placeholder="yyyy-MM-dd"
                                                               value="${endTime}">
                                                    </div>
                                                </div>
                                                <button type="button" class="btn btn-info" onclick="selDetails()"
                                                        style="margin-left: 450px">查询
                                                </button>
                                                <button type="reset" class="btn btn-info" onclick="rset()">重置</button>
                                            </div>
                                            <div class="table-responsive" style="margin-top: 10px;">
                                                <table class="table table-hover table-bordered non-responsive"
                                                       style="margin-bottom:90px" id="ywInfoTable">
                                                    <thead>
                                                    <tr id="tab_td">
                                                        <th class="per text-center" style="width: 5%"><span value=""
                                                                                                            style="padding:2px 0; margin-right: 10px;">
                                                序号</span></th>
                                                        <th class="per text-center" style="width: 5%"><span value=""
                                                                                                            style="padding:2px 0; margin-right: 10px;">
                                                服务类型</span></th>
                                                        <th class="per text-center" style="width: 5%"><span value=""
                                                                                                            style="padding:2px 0; margin-right: 10px;">
                                                服务名称</span></th>
                                                        <th class="per text-center" style="width: 5%"><span value=""
                                                                                                            style="padding:2px 0; margin-right: 10px;">
                                                接收手机号</span></th>
                                                        <th class="per text-center" style="width: 5%"><span value=""
                                                                                                            style="padding:2px 0; margin-right: 10px;">
                                                返回码</span></th>
                                                        <th class="per text-center" style="width: 5%"><span value=""
                                                                                                            style="padding:2px 0; margin-right: 10px;">
                                                请求时间</span></th>
                                                        <th class="per text-center" style="width: 5%"><span value=""
                                                                                                            style="padding:2px 0; margin-right: 10px;">
                                                消费金额</span></th>
                                                        <th class="per text-center" style="width: 5%"><span value=""
                                                                                                            style="padding:2px 0; margin-right: 10px;">
                                                运营商属性</span></th>
                                                        <th class="per text-center" style="width: 5%"><span value="">
                                                操作</span></th>
                                                    </tr>
                                                    </thead>
                                                    <c:forEach var="ywRecords" items="${ywRecords}">
                                                        <c:forEach var="ywCate" items="${ywInfoCategories}">
                                                            <c:forEach var="ywInfo" items="${ywInfos}">
                                                                <tr id="tr">
                                                                    <c:if test="${ywRecords.categoryId == ywCate.id}">
                                                                        <c:if test="${ywRecords.customerYwId == ywInfo.customerYwId}">
                                                                            <td class="per text-center">
                                                                                    ${ywRecords.id}
                                                                            </td>
                                                                            <td class="per text-center">
                                                                                    ${ywCate.categoryName}
                                                                            </td>
                                                                            <td class="per text-center">
                                                                                    ${ywInfo.ywName}
                                                                            </td>
                                                                            <td class="per text-center">
                                                                                    ${ywRecords.receivingNumber}
                                                                            </td>
                                                                            <td class="per text-center">
                                                                                    ${ywRecords.returnCodeDescribe}
                                                                            </td>
                                                                            <td class="per text-center">
                                                                                    ${ywRecords.startTime}
                                                                            </td>
                                                                            <td class="per text-center">
                                                                                    ${ywRecords.consumption}
                                                                            </td>
                                                                            <td class="per text-center">
                                                                                    ${ywRecords.operator}
                                                                            </td>
                                                                            <td class="per text-center">
                                                                                <button type="button"
                                                                                        class="btn btn-info"
                                                                                        value="${ywRecords.id}"
                                                                                        onclick="importExcel(this.value)">
                                                                                    导出
                                                                                </button>
                                                                            </td>
                                                                        </c:if>
                                                                    </c:if>
                                                                </tr>
                                                            </c:forEach>
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
<script>
    layui.use('laydate', function () {
        var laydate = layui.laydate;
        laydate.render({
            elem: '#test11'
            , format: 'yyyy-MM-dd'
        });
        laydate.render({
            elem: '#test12'
            , format: 'yyyy-MM-dd'
        });
    })
</script>
</body>

</html>
