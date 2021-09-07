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
        function resetr() {
            $("#invoiceType").val("");
            $("#auditStatus").val("");
            $("#invoiceTitle").val("");
            $("#taxRegisterNumber").val("");
            $("#invoiceCategory").val("");
            selApply();
        }

        function selApply() {
            var invoiceTitle = $("#invoiceTitle").val();
            var taxRegisterNumber = $("#taxRegisterNumber").val();
            var invoiceCategory = $("#invoiceCategory").val();
            var invoiceType = $("#invoiceType").val();
            var auditStatus = $("#auditStatus").val();
            window.location.href = "selInvoiceApply?invoiceTitle=" + encodeURIComponent(invoiceTitle) + "&taxRegisterNumber=" + encodeURIComponent(taxRegisterNumber) + "&invoiceCategory=" + encodeURIComponent(invoiceCategory) + "&invoiceType=" + invoiceType + "&auditStatus=" + auditStatus;
        }

        function openDetailsWindows(id) {
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
                title: '<i class="br-address-book" style="color:#828ea2">  <b>发票申请详情</b></i>',
                area: [screenWidth + 'px', screenHeight + 'px'],
                shade: 0.03,
                scrollbar: false,
                fix: false,
                maxmin: false,
                content: '/toinvoiceDetails?id=' + id
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
                                        发票记录
                                    </li>
                                </ul>
                                <div class="panel panel-default plain toggle panelClose panelRefresh">
                                    <form action="" id="queryForm">
                                        <div class="panel-body" style="border:1px solid #e4e9eb;">
                                            <button type="reset" class="layui-btn" onclick="resetr()">重置</button>
                                            <button type="button" class="layui-btn" onclick="selApply()">查询</button>
                                            <input id="invoiceTitle"
                                                   style="display: inline-block;width: 150px;height: 30px;margin-left: 10px"
                                                   placeholder="请输入发票抬头" value="${invoiceTitle}"/>
                                            <input id="taxRegisterNumber"
                                                   style="display: inline-block;width: 150px;height: 30px;margin-left: 10px"
                                                   placeholder="请输入税务登记号" value="${taxRegisterNumber}"/>
                                            <input id="invoiceCategory"
                                                   style="display: inline-block;width: 150px;height: 30px;margin-left: 10px"
                                                   placeholder="请输入发票项目" value="${invoiceCategory}"/>
                                            <select id="invoiceType" class="form-control"
                                                    style="width: 150px;display: inline-block;margin-left: 10px"
                                                    onchange="">
                                                <option value="">发票类型(全部)</option>
                                                <option value="0" <c:if test="${invoiceType == 0}">selected</c:if>>
                                                    普通发票
                                                </option>
                                                <option value="1" <c:if test="${invoiceType == 1}">selected</c:if>>
                                                    专用发票
                                                </option>
                                            </select>
                                            <select id="auditStatus" class="form-control"
                                                    style="width: 150px;display: inline-block;margin-left: 5px"
                                                    onchange="">
                                                <option value="">审核状态(全部)</option>
                                                <option value="0" <c:if test="${auditStatus == 0}">selected</c:if>>待审核
                                                </option>
                                                <option value="1" <c:if test="${auditStatus == 1}">selected</c:if>>
                                                    审核通过
                                                </option>
                                                <option value="2" <c:if test="${auditStatus == 2}">selected</c:if>>
                                                    审核拒绝
                                                </option>
                                            </select>
                                            <table class="table table-hover table-bordered non-responsive"
                                                   style="margin-bottom:90px;margin-top: 20px" id="ywInfoTable">
                                                <thead>
                                                <tr id="tab_td">
                                                    <th class="per text-center" style="width: 5%"><span value=""
                                                                                                        style="padding:2px 0; margin-right: 10px;">
                                                序号</span></th>
                                                    <th class="per text-center" style="width: 5%"><span value=""
                                                                                                        style="padding:2px 0; margin-right: 10px;">
                                                发票抬头</span></th>
                                                    <th class="per text-center" style="width: 5%"><span value=""
                                                                                                        style="padding:2px 0; margin-right: 10px;">
                                                税务登记号</span></th>
                                                    <th class="per text-center" style="width: 5%"><span value=""
                                                                                                        style="padding:2px 0; margin-right: 10px;">
                                                发票类型</span></th>
                                                    <th class="per text-center" style="width: 5%"><span value=""
                                                                                                        style="padding:2px 0; margin-right: 10px;">
                                                发票项目</span></th>
                                                    <th class="per text-center" style="width: 5%"><span value=""
                                                                                                        style="padding:2px 0; margin-right: 10px;">
                                                开票总额(元)</span></th>
                                                    <th class="per text-center" style="width: 5%"><span value=""
                                                                                                        style="padding:2px 0; margin-right: 10px;">
                                                申请时间</span></th>
                                                    <th class="per text-center" style="width: 5%"><span value=""
                                                                                                        style="padding:2px 0; margin-right: 10px;">
                                                审核状态</span></th>
                                                    <th class="per text-center" style="width: 5%"><span value=""
                                                                                                        style="padding:2px 0; margin-right: 10px;">
                                                审核备注</span></th>
                                                    <th class="per text-center" style="width: 5%"><span value="">
                                                操作</span></th>
                                                </tr>
                                                <c:forEach var="invoiceApply" items="${pg.pageData}">
                                                    <tr id="tr">
                                                        <td class="per text-center">
                                                                ${invoiceApply.invoiceApplyId}
                                                        </td>
                                                        <td class="per text-center">
                                                                ${invoiceApply.invoiceTitle}
                                                        </td>
                                                        <td class="per text-center">
                                                                ${invoiceApply.taxRegisterNumber}
                                                        </td>
                                                        <td class="per text-center">
                                                            <c:if test="${invoiceApply.invoiceType == 0}">普通发票</c:if>
                                                            <c:if test="${invoiceApply.invoiceType == 1}">专用发票</c:if>
                                                        </td>
                                                        <td class="per text-center">
                                                                ${invoiceApply.invoiceCategory}
                                                        </td>
                                                        <td class="per text-center">
                                                                ${invoiceApply.invoiceAmount}
                                                        </td>
                                                        <td class="per text-center">
                                                                ${invoiceApply.insertTime}
                                                        </td>
                                                        <td class="per text-center">
                                                            <c:if test="${invoiceApply.auditStatus == 0}">待审核</c:if>
                                                            <c:if test="${invoiceApply.auditStatus == 1}">审核通过</c:if>
                                                            <c:if test="${invoiceApply.auditStatus == 2}">审核拒绝</c:if>
                                                        </td>
                                                        <td class="per text-center">
                                                                ${invoiceApply.auditRemark}
                                                        </td>
                                                        <td class="per text-center">
                                                            <button type="button" class="btn btn-info"
                                                                    id="${invoiceApply.invoiceApplyId}"
                                                                    onclick="openDetailsWindows(this.id)">详情
                                                            </button>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                                </thead>
                                            </table>
                                            <div id="page" align="center">
                                                <a href="/selInvoiceApply?curPage=${pg.firstPage}">首页</a>
                                                <a href="/selInvoiceApply?curPage=${pg.currentPage - 1}">上一页</a>
                                                <a href="/selInvoiceApply?curPage=${pg.currentPage + 1}">下一页</a>
                                                <a href="/selInvoiceApply?curPage=${pg.lastPage}">尾页</a>
                                                当前第${pg.currentPage}页/共${pg.totalPage}页
                                                每页显示${pg.pageSize}条
                                            </div>
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

</script>
</body>

</html>
