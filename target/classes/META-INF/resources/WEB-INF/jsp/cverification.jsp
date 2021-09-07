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
    <script src="${pageContext.request.contextPath}/static/layui/layui.js"></script>
    <script src="${pageContext.request.contextPath}/static/layui/css/layui.css"></script>
    <script src="${pageContext.request.contextPath }/static/js/jquery-2.1.4.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $("#ids").change(function () {//判断全选框的改变
                var flage = $(this).is(":checked");//全选选中为true，否则为false
                $("input[type=checkbox]").each(function () {
                    $(this).prop("checked", flage);
                })
            })
        })

        function cttrIds() {
            var ids = "";
            $("input:checkbox[name='ids']:checked").each(function () {
                ids = ids + $(this).val() + ",";
            });
            $("#ids").val(ids);
            console.log(ids);
        }

        function deleteCttrClick() {
            cttrIds();
            layer.confirm("确定删除已选择吗？", {
                    btn: ['确定', '取消']//按钮
                }, function () {
                    deleteWithCatch($("#ids").val());
                }, function () {
                    return;
                }
            );
        }

        //批量删除
        function deleteWithCatch(ids) {
            $.ajax({
                type: "post",
                async: true,
                url: "delCverificationAppInfo",
                data:
                    {
                        ids: ids,
                    },
                dataType: "json",
                success: function (data) {
                    if (data.code === "0000") {
                        layer.msg('删除成功', {
                            icon: 1, time: 2000,
                            end: function () {
                                window.parent.location.reload();
                                parent.layer.closeAll('iframe');
                            }
                        }).close;
                    } else {
                        layer.msg(data.message, {icon: 2, time: 1500});
                    }
                }
            });
        }

        function selApp() {
            var appId = $("#appId").val();
            var appName = $("#yymc").val();
            var appPlatform = $("#able").val();
            var status = $("#status").val();
            window.location.href = "/cverification?appName=" + encodeURIComponent(appName) + "&appId=" + encodeURIComponent(appId) + "&appPlatform=" + appPlatform + "&auditStatus=" + status;
        }

        function queryReset() {
            $("#appId").val("");
            $("#yymc").val("");
            $("#able").val("");
            $("#status").val("");
            selApp();
        }

        // function selappId(){
        //     var appId = $("#appId").val();
        //     var appName = $("#yymc").val();
        //     window.location.href = "/selAppId?appId=" + appId + "&appName" + appName;
        // }
        //
        // function platform(appPlatform){
        //   window.location.href = "/cverification?appPlatform=" + appPlatform;
        // }
        //
        // function examineStatus(status){
        //   window.location.href = "/cverification?auditStatus=" + status;
        // }

        function openUpd(value) {
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
                title: '<i class="br-address-book" style="color:#828ea2">  <b>应用配置</b></i>',
                area: [screenWidth + 'px', screenHeight + 'px'],
                shade: 0.03,
                scrollbar: false,
                fix: false,
                maxmin: false,
                content: '/getAuthConfigDetail?value=' + value
            });
        }

        function openIns() {
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
                title: '<i class="br-address-book" style="color:#828ea2">  <b>应用配置</b></i>',
                area: [screenWidth + 'px', screenHeight + 'px'],
                shade: 0.03,
                scrollbar: false,
                fix: false,
                maxmin: false,
                content: '/insCverificationApp'
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
                                        服务管理
                                        <i class="lnr lnr-chevron-right"></i>
                                    </li>
                                    <li>
                                        服务配置
                                        <i class="lnr lnr-chevron-right"></i>
                                    </li>
                                    <li>
                                        统一认证
                                    </li>
                                </ul>
                                <div class="panel panel-default plain toggle panelClose panelRefresh">
                                    <form action="" id="queryForm">
                                        <div class="panel-body" style="border:1px solid #e4e9eb;">
                                            <button type="button" class="btn btn-info" style="margin-right: 10px"
                                                    onclick="deleteCttrClick()">删除
                                            </button>
                                            <button type="button" class="btn btn-info" style="margin-right: 10px"
                                                    onclick="openIns()">新增
                                            </button>
                                            <button type="reset" class="btn btn-info" onclick="queryReset()">重置</button>
                                            <div class="table-responsive" style="margin-top: 10px;">
                                                <table class="table table-hover table-bordered non-responsive"
                                                       style="margin-bottom:90px" id="ywInfoTable">
                                                    <thead>
                                                    <tr id="tab_td">
                                                        <th class="per text-center" style="width: 3%"><input
                                                                type="checkbox"
                                                                id="ids" onclick=""></th>
                                                        <th class="per text-center" style="width: 5%"><span value=""
                                                                                                            style="padding:2px 0;">
                                                序号</span></th>
                                                        <th class="per text-center" style="width: 15%"><span
                                                                style="padding: 2px 0; float: left
                                                    ;display: inline-block;margin-right: 10px">应用名称
                                            </span>
                                                            <div class="col-lg-5"
                                                                 style="padding: 0;display: inline-block">
                                                                <input id="yymc" maxlength="20"
                                                                       style="width: 160%; height: 26px; padding: 1px 1px 1px 5px;"
                                                                       class="form-control" placeholder="请输入应用名称"
                                                                       value="${appName}"/>
                                                            </div>
                                                        </th>
                                                        <th class="per text-center" style="width: 15%"><span
                                                                style="padding: 2px 0; float: left
                                                    ;display: inline-block;margin-right: 10px">appID
                                            </span>
                                                            <div class="col-lg-5"
                                                                 style="padding: 0;display: inline-block">
                                                                <input id="appId" maxlength="20"
                                                                       style="width: 160%; height: 26px; padding: 1px 1px 1px 5px;"
                                                                       class="form-control" placeholder="请输入appID"
                                                                       value="${appId}"/>
                                                            </div>
                                                        </th>
                                                        <th class="per text-center" style="width: 15%"><span value=""
                                                                                                             style="padding:2px 0;float: left; margin-right: 10px;">
                                                平台</span>
                                                            <select id="able" class="form-control"
                                                                    data-live-search="true"
                                                                    style="height: 26px;padding: 0;width: 45%"
                                                                    onchange="selApp()">
                                                                <option value="">全部</option>
                                                                <option value="ios"
                                                                        <c:if test="${appPlatform == 'ios'}">selected</c:if>>
                                                                    ios
                                                                </option>
                                                                <option value="安卓"
                                                                        <c:if test="${appPlatform == '安卓'}">selected</c:if>>
                                                                    安卓
                                                                </option>
                                                            </select>
                                                        </th>
                                                        <th class="per text-center"
                                                            style="width: 10%;padding: 12px 10px;min-width: 64px">应用能力
                                                        </th>
                                                        <th class="per text-center" style="width: 15%"><span value=""
                                                                                                             style="padding:2px 0;float: left; margin-right: 10px;">
                                                审核状态</span>
                                                            <select id="status" class="form-control"
                                                                    data-live-search="true"
                                                                    style="height: 26px;padding: 0;width: 45%"
                                                                    onchange="selApp()">
                                                                <option value="">全部</option>
                                                                <option value="2"
                                                                        <c:if test="${auditStatus == 2}">selected</c:if>>
                                                                    待审核
                                                                </option>
                                                                <option value="1"
                                                                        <c:if test="${auditStatus == 1}">selected</c:if>>
                                                                    审核通过
                                                                </option>
                                                                <option value="0"
                                                                        <c:if test="${auditStatus == 0}">selected</c:if>>
                                                                    审核拒绝
                                                                </option>
                                                            </select>
                                                        </th>
                                                        <th class="per text-center"
                                                            style="width: 20%;padding: 12px 10px;min-width: 220px;">操作
                                                        </th>
                                                    </tr>
                                                    </thead>
                                                    <c:forEach var="c" items="${cverificationCusAppInfos}">
                                                        <tr>
                                                            <td class="per text-center" style="width: 3%"><input
                                                                    type="checkbox" name="ids" value="${c.id}"></td>
                                                            <td class="per text-center">
                                                                    ${c.id}
                                                            </td>
                                                            <td class="per text-center">
                                                                    ${c.appName}
                                                            </td>
                                                            <td class="per text-center">
                                                                    ${c.appId}
                                                            </td>
                                                            <td class="per text-center">
                                                                    ${c.appPlatform}
                                                            </td>
                                                            <td class="per text-center">
                                                                    ${c.appDescription}
                                                            </td>
                                                            <td class="per text-center">
                                                                <c:if test="${c.auditStatus == 0}">审核拒绝</c:if>
                                                                <c:if test="${c.auditStatus == 1}">审核通过</c:if>
                                                                <c:if test="${c.auditStatus == 2}">审核中</c:if>
                                                            </td>
                                                            <td class="per text-center">
                                                                <button type="button" class="btn btn-info"
                                                                        value="${c.id}" onclick="openUpd(this.value)">修改
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
