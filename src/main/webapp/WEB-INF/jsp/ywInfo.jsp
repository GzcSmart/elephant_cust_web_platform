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
    <script src="${pageContext.request.contextPath}/static/js/jquery-2.1.4.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/layui/layui.js"></script>
    <script type="text/javascript">
        var ywId = "••••••••••••••••••••••••••••••••";

        function update(id, v) {
            var url = "updateYwInfo?id=" + id;
            console.log(v);
            if (v === "1") {
                url = url + "&status=0";
                layer.confirm("您确定要暂停服务吗?", {
                    btn: ['确定', '取消']
                    //按钮
                }, function (index) {
                    layer.close(index);
                    $.ajax({
                        type: "post",
                        async: false,
                        dataType: "json",
                        url: url,
                        success: function (data) {
                            if (data.code === 1) {
                                flag = 0;
                                window.location.reload();
                            }
                        }
                    })

                }, function () {
                    return;
                });
            } else {
                url = url + "&status=1";
                layer.confirm("您确定要恢复服务吗?", {
                    btn: ['确定', '取消']
                    //按钮
                }, function (index) {
                    layer.close(index);
                    $.ajax({
                        type: "post",
                        async: false,
                        dataType: "json",
                        url: url,
                        success: function (data) {
                            if (data.code === 1) {
                                flag = 1;
                                window.location.reload();
                            }
                        }
                    })
                }, function () {
                    return;
                });
            }
        }

        function resPwd(value) {
            layer.confirm("您确定要重置密码吗?", {
                    btn: ['确定', '取消']
                    //按钮
                }, function () {
                    $.ajax({
                        type: "post",
                        async: false,
                        dataType: "json",
                        url: "resPwd",
                        data: {
                            id: value
                        },
                        success: function (data) {
                            if (data.code === 1) {
                                window.location.reload();
                            } else {
                                alert("重置密码失败了");
                            }
                        }
                    })
                }, function () {
                    layer.close()
                }
            )
        }

        function help() {
            var screenHeight = document.documentElement.clientHeight;
            var screenWidth = document.documentElement.clientWidth;
            layer.open({
                title: '查看API',
                type: 2,
                area: [screenWidth * 0.6 + 'px', screenHeight * 0.7 + 'px'],
                fixed: false,
                resize: true,
                scrollbar: false,
                shadeClose: true,
                content: "api",
                moveOut: true,
                btn: ['好的，明白了'],
                yes: function (index, layero) {
                    layer.closeAll();
                }
            });
        }

        function getYwId(obj, msg, index) {
            var yw1 = "业务ID：••••••••••••••••••••••••••••••••";
            var yw2 = "业务ID：" + msg;
            var ywIdFlag = $("#ywIdFlag_" + index).val();
            $("#ywId_" + index).empty();
            if (ywIdFlag == 0) {
                $("#ywId_" + index).html(yw2);
                $(obj).attr("src", "/static/images/eyes_blue.png");
                $("#ywIdFlag_" + index).val("1");
            } else {
                $("#ywId_" + index).html(yw1);
                $(obj).attr("src", "/static/images/eyes_gray.png");
                $("#ywIdFlag_" + index).val("0");
            }
        }

        function getYwId2(obj, msg, index) {
            var yw1 = "业务密码：••••••••••••••••••••••••••••••••";
            var yw2 = "业务密码：" + msg;
            var ywPwdFlag = $("#ywPwdFlag_" + index).val();
            $("#ywPwd_" + index).empty();
            if (ywPwdFlag == 0) {
                $("#ywPwd_" + index).html(yw2);
                $(obj).attr("src", "/static/images/eyes_blue.png");
                $("#ywPwdFlag_" + index).val(1);
            } else {
                $("#ywPwd_" + index).html(yw1);
                $(obj).attr("src", "/static/images/eyes_gray.png");
                $("#ywPwdFlag_" + index).val(0);
            }
        }

        // var i = 1;
        // function getYwId(obj,msg){
        //     i = parseInt(i)+1;
        //     /*var ywIdFlag =$("#ywIdFlag").val();
        //     if(ywIdFlag==0){
        //         $("#customerYwId").text(ywId);
        //         $("#id").attr("src","/static/images/eyes_gray.png");
        //         ywIdFlag=1;
        //     }
        //     else{
        //         $("#customerYwId").text(ywId);
        //         $("#id").attr("src","/static/images/eyes_blue.png");
        //         ywIdFlag=0;
        //     }
        //     $("#ywIdFlag").val(ywIdFlag);*/
        //     var yw1 = "业务ID：••••••••••••••••••••••••••••••••";
        //     var yw2 = "业务ID："+msg;
        //     $(obj).parent().find("p").eq(0).empty();
        //     if(i%2>0){
        //         $(obj).parent().find("p").eq(0).html(yw1);
        //         $(obj).attr("src","/static/images/eyes_gray.png");
        //     }else{
        //         $(obj).parent().find("p").eq(0).html(yw2);
        //         $(obj).attr("src","/static/images/eyes_blue.png");
        //     }
        // }
        //
        // var j = 1;
        // function getYwId2(obj,msg){
        //     j = parseInt(j)+1;
        //     /*var ywIdFlag =$("#ywIdFlag").val();
        //     if(ywIdFlag==0){
        //         $("#customerYwId").text(ywId);
        //         $("#id").attr("src","/static/images/eyes_gray.png");
        //         ywIdFlag=1;
        //     }
        //     else{
        //         $("#customerYwId").text(ywId);
        //         $("#id").attr("src","/static/images/eyes_blue.png");
        //         ywIdFlag=0;
        //     }
        //     $("#ywIdFlag").val(ywIdFlag);*/
        //     var yw1 = "业务密码：••••••••••••••••••••••••••••••••";
        //     var yw2 = "业务密码："+msg;
        //     $(obj).parent().find("p").eq(1).empty();
        //     if(j%2>0){
        //         $(obj).parent().find("p").eq(1).html(yw1);
        //         $(obj).attr("src","/static/images/eyes_gray.png");
        //     }else{
        //         $(obj).parent().find("p").eq(1).html(yw2);
        //         $(obj).attr("src","/static/images/eyes_blue.png");
        //     }
        // }

        function fwlx(id) {
            window.location.href = "/getConditionYw?preId=" + id;
        }

        function fwmc1() {
            var preId = $("#fwlx1").val();
            var customerYwName = $("#customerYwName").val();
            window.location.href = "/getConditionYw?preId=" + preId + "&customerYwName=" + encodeURIComponent(customerYwName);
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
                                                        <th class="per text-center" style="width: 3%" hidden><input
                                                                type="checkbox"
                                                                id="ids" value=""></th>
                                                        <th class="per text-center" style="width: 5%"><span value=""
                                                                                                            style="padding:2px 0;float: left; margin-right: 10px;">
                                                序号</span></th>
                                                        <th class="per text-center" style="width: 15%"><span value=""
                                                                                                             style="padding:2px 0;float: left; margin-right: 10px;">
                                                服务类型</span>
                                                            <select id="fwlx1" class="form-control"
                                                                    data-live-search="true"
                                                                    style="height: 26px;padding: 0;width: 45%"
                                                                    onchange="fwlx(this.value)">
                                                                <option value="">全部</option>
                                                                <c:forEach var="ywCategories"
                                                                           items="${ywInfoCategories}">
                                                                    <option value="${ywCategories.id}"
                                                                            <c:if test="${ywCategories.id==ywInfoId}">selected</c:if>>${ywCategories.categoryName}</option>
                                                                </c:forEach>
                                                            </select>
                                                        </th>
                                                        <th class="per text-center" style="width: 15%"><span
                                                                style="padding: 2px 0; float: left
                                                    ;display: inline-block;margin-right: 10px">服务名称
                                            </span>
                                                            <div class="col-lg-5"
                                                                 style="padding: 0;display: inline-block">
                                                                <input id="customerYwName" maxlength="20"
                                                                       style="width: 160%; height: 26px; padding: 1px 1px 1px 5px;"
                                                                       class="form-control" placeholder="请输入服务名称"
                                                                       onblur="fwmc1()" value="${customerYwName}"/>
                                                            </div>
                                                        </th>
                                                        <th class="per text-center"
                                                            style="width: 30%;padding: 12px 10px">业务参数
                                                        </th>
                                                        <th class="per text-center"
                                                            style="width: 10%;padding: 12px 10px;min-width: 64px">状态
                                                        </th>
                                                        <th class="per text-center"
                                                            style="width: 20%;padding: 12px 10px;min-width: 220px;">操作
                                                        </th>
                                                    </tr>
                                                    </thead>
                                                    <c:forEach var="y" items="${pg.pageData}" varStatus="indexStatus">
                                                        <tr>
                                                            <td>
                                                                    ${y.systemYwId}
                                                            </td>
                                                            <td class="per text-center">
                                                                    ${y.categoryName}
                                                            </td>
                                                            <td class="per text-center">
                                                                    ${y.ywName}
                                                            </td>
                                                            <td class="" id="yw_1">
                                                                <input id="ywIdFlag_${indexStatus.index}"
                                                                       hidden="hidden" value="0"/>
                                                                <input id="ywPwdFlag_${indexStatus.index}"
                                                                       hidden="hidden" value="0"/>
                                                                <p style="margin-left: 50px"
                                                                   id="ywId_${indexStatus.index}">
                                                                    业务ID：••••••••••••••••••••••••••••••••</p><img
                                                                    id="${y.systemYwId}"
                                                                    src="${pageContext.request.contextPath}/static/images/eyes_gray.png"
                                                                    style="float: right;cursor: pointer;width: 20px;height: 20px;margin-right: 50px;margin-top:-28px;"
                                                                    onclick="getYwId(this,'${y.customerYwId}',${indexStatus.index})"/>
                                                                <p style="margin-left: 50px"
                                                                   id="ywPwd_${indexStatus.index}">
                                                                    业务密码：••••••••••••••••••••••••••••••••</p><img
                                                                    id="${y.systemYwId}"
                                                                    src="${pageContext.request.contextPath}/static/images/eyes_gray.png"
                                                                    style="float: right;cursor: pointer;width: 20px;height: 20px;margin-right: 50px;margin-top:-28px;"
                                                                    onclick="getYwId2(this,'${y.customerYwPwd}',${indexStatus.index})"/>
                                                            </td>
                                                            <td class="per text-center">
                                                                <c:if test="${y.status eq 0}">服务已关闭</c:if>
                                                                <c:if test="${y.status eq 1}">服务运行中</c:if>
                                                            </td>
                                                            <td>
                                                                <c:if test="${y.status eq 1}">
                                                                    <button type="button" class="btn btn-info"
                                                                            value="${y.status}" id="${y.systemYwId}"
                                                                            onclick="update(this.id,this.value)">暂停
                                                                    </button>
                                                                </c:if>
                                                                <c:if test="${y.status eq 0}">
                                                                    <button type="button" class="btn btn-warning"
                                                                            value="${y.status}" id="${y.systemYwId}"
                                                                            onclick="update(this.id,this.value)">恢复
                                                                    </button>
                                                                </c:if>
                                                                <button type="button" class="btn btn-info"
                                                                        onclick="resPwd(this.value)"
                                                                        value="${y.systemYwId}">重置密码
                                                                </button>
                                                                <li class="dropdown" style="display: inline-block">
                                                                    <a href="#" class="dropdown-toggle"
                                                                       data-toggle="dropdown">
                                                                        <button type="button" class="btn btn-info">
                                                                            使用帮助
                                                                        </button>
                                                                    </a>
                                                                    <ul class="dropdown-menu" style="min-width: 110px">
                                                                        <li><a href="#" onclick="help()"><i
                                                                                class="lnr lnr-download"></i> <span>查看API</span></a>
                                                                        </li>
                                                                        <li><a href="downloadFile?type=1"><i
                                                                                class="lnr lnr-exit"></i>
                                                                            <span>下载demo</span></a></li>
                                                                    </ul>
                                                                </li>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                </table>
                                            </div>
                                            <div id="page" align="center">
                                                <a href="/getConditionYw?curPage=${pg.firstPage}">首页</a>
                                                <a href="/getConditionYw?curPage=${pg.currentPage - 1}">上一页</a>
                                                <a href="/getConditionYw?curPage=${pg.currentPage + 1}">下一页</a>
                                                <a href="/getConditionYw?curPage=${pg.lastPage}">尾页</a>
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


</div>
<!-- END WRAPPER -->
<!-- Javascript -->
<script src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/jquery.easy-pie-chart/jquery.easypiechart.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/chartist/js/chartist.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/scripts/klorofil-common.js"></script>
<script src="${pageContext.request.contextPath}/static/layui/layui.js"></script>
</body>

</html>

