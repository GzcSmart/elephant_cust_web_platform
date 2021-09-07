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
    <script src="${pageContext.request.contextPath}/static/js/jquery-2.1.4.min.js"></script>
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
                <input type="hidden" id="onLineUrl" value="${onLineUrl}">
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
                                        额度调配
                                    </li>
                                </ul>
                                <div class="panel panel-default plain toggle panelClose panelRefresh">
                                    <form action="" id="queryForm">
                                        <div class="panel-body" style="border:1px solid #e4e9eb;">
                                            <div style="margin-bottom: 10px;" hidden>
                                                <button type="button" id="deletePro" onclick="deleteMore();"
                                                        class="btn btn-default" style="border-color: #d8d8d5;"><i
                                                        class="im-remove2">&nbsp;</i>批量删除
                                                </button>
                                            </div>
                                            <div class="table-responsive" style="margin-top: 10px;">
                                                <table class="table table-hover table-bordered non-responsive"
                                                       style="margin-bottom:90px" id="ywInfoTable">
                                                    <thead>
                                                    <tr id="tab_td">
                                                        <th class="per text-center" style="width: 3%"><input
                                                                type="checkbox"
                                                                id="ids" value=""></th>
                                                        <th class="per text-center" style="width: 5%"><span value=""
                                                                                                            style="padding:2px 0;float: left; margin-right: 10px;">
                                                序号</span></th>
                                                        <th class="per text-center" style="width: 5%"><span value=""
                                                                                                            style="padding:2px 0;float: left; margin-right: 10px;">
                                                企业ID</span></th>
                                                        <th class="per text-center" style="width: 5%"><span value=""
                                                                                                            style="padding:2px 0;float: left; margin-right: 10px;">
                                                企业名称</span></th>
                                                        <th class="per text-center" style="width: 5%"><span value=""
                                                                                                            style="padding:2px 0;float: left; margin-right: 10px;">
                                                余额(元)</span></th>
                                                        <th class="per text-center" style="width: 5%"><span value=""
                                                                                                            style="padding:2px 0;float: left; margin-right: 10px;">
                                                企业状态</span></th>
                                                        <th class="per text-center"
                                                            style="width: 20%;padding: 12px 10px;min-width: 220px;">操作
                                                        </th>
                                                    </tr>
                                                    </thead>
                                                    <c:forEach var="b" items="${balanceInfos}">
                                                        <tr>
                                                            <td class="per text-center" style="width: 3%"><input
                                                                    type="checkbox" value=""></td>
                                                            <td>
                                                                    ${b.id}
                                                            </td>
                                                            <td class="per text-center">
                                                                    ${b.orgId}
                                                            </td>
                                                            <td class="per text-center">
                                                                    ${b.orgName}
                                                            </td>
                                                            <td class="per text-center">
                                                                    ${b.orgBalance}
                                                            </td>
                                                            <td class="per text-center">
                                                                    ${b.orgStatus eq  1 ? '正常' : '异常'}
                                                            </td>
                                                            <td class="per text-center">
                                                                <button type="button" class="btn btn-info" onclick="">
                                                                    额度调配
                                                                </button>
                                                            </td>
                                                        </tr>
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
