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
    <%--    <%@ include file="public_css_js.jsp" %>--%>
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
    <script src="${pageContext.request.contextPath}/static/js/jquery-2.1.4.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/jquery-2.1.4.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/layui/layui.js"></script>
    <script type="text/javascript">
        $(function () {
            $("#ids").click(function () {
                $(":checkbox[name='ids']").prop("checked", this.checked); // this指代的你当前选择的这个元素的JS对象
            });
        })

        function getDetail(id) {
            layer.open({
                type: 2,
                title: '<b><i class="en-mail"/>&nbsp;消息</b>',
                shade: 0.03,
                scrollbar: false,
                fix: false,
                maxmin: false,
                area: ['50%', '40%'],
                content: 'tomessageDetail?id=' + id,
                end: function () {
                    location.reload();
                }
            });
        }

        function deleteMessage(id) {
            layer.confirm("确定删除吗?", {
                btn: ['确定', '取消']
            }, function () {
                $.ajax({
                    type: "get",
                    async: true,
                    url: "delMessage?id=" + id + "&isDelete=1",
                    dataType: "json",
                    success: function (data) {
                        if (data.code === "0000") {
                            layer.msg('删除成功', {
                                icon: 1, time: 1500,
                                end: function () {
                                    window.parent.location.reload();
                                    parent.layer.closeAll('iframe');
                                }
                            }).close;
                        } else {
                            layer.msg(data.message, {icon: 2, time: 1500});
                        }
                    }
                })
            }, function () {
                layer.close()
            });
        }

        function readMessage(id) {
            $.ajax({
                type: "get",
                async: true,
                url: "readMessage?id=" + id + "&status=1",
                dataType: "json",
                success: function (data) {
                    if (data.code === "0000") {
                        window.parent.location.reload();
                        parent.layer.closeAll('iframe');
                    } else {
                        layer.msg(data.message, {icon: 2, time: 1500});
                    }
                }
            })
        }

        function attrIds() {
            var ids = "";
            $("input:checkbox[name='ids']:checked").each(function () {
                ids = ids + $(this).val() + ",";
            });
            $("#ids").val(ids);
            console.log(ids);
        }

        //点击批量删除
        function deleteWithClick() {
            attrIds();
            layer.confirm("确定删除已选择的信息吗？", {
                    btn: ['确定', '取消']//按钮
                }, function () {
                    deleteWithBatch($("#ids").val());
                }, function () {
                    return;
                }
            );
        }

        //批量删除
        function deleteWithBatch(ids) {
            $.ajax({
                type: "post",
                async: true,
                url: "deleteMoreMessage",
                data:
                    {
                        ids: ids,
                        isDelete: 1
                    },
                dataType: "json",
                success: function (data) {
                    if (data.code === "0000") {
                        layer.msg('删除成功', {
                            icon: 1, time: 1500,
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


        function sRead() {
            attrIds();
            var ids = $("#ids").val();
            $.ajax({
                type: "post",
                async: true,
                url: "readMoreMessage",
                data:
                    {
                        ids: ids,
                        status: 1
                    },
                dataType: "json",
                success: function (data) {
                    if (data.code === "0000") {
                        layer.msg('标记成功', {
                            icon: 1, time: 1500,
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
                                        消息中心
                                    </li>
                                </ul>
                                <div class="panel panel-default plain toggle panelClose panelRefresh">
                                    <form action="" id="queryForm">
                                        <div class="panel-body" style="border:1px solid #e4e9eb;">
                                            <button type="button" class="layui-btn" onclick="sRead()">标记为已读</button>
                                            <button type="button" class="layui-btn" onclick="deleteWithClick()">批量删除
                                            </button>
                                            <table class="table table-hover table-bordered non-responsive"
                                                   style="margin-bottom:90px;margin-top: 20px" id="ywInfoTable">
                                                <thead>
                                                <tr id="tab_td">
                                                    <th class="per text-center" style="width: 5%"><input id="ids"
                                                                                                         type="checkbox"
                                                                                                         value=""
                                                                                                         onclick="setCheckBoxListener()">
                                                    </th>
                                                    <th class="per text-center" style="width: 5%"><span value=""
                                                                                                        style="padding:2px 0; margin-right: 10px;">
                                                序号</span></th>
                                                    <th class="per text-center" style="width: 5%"><span value=""
                                                                                                        style="padding:2px 0; margin-right: 10px;">
                                                标题</span></th>
                                                    <th class="per text-center" style="width: 5%"><span value=""
                                                                                                        style="padding:2px 0; margin-right: 10px;">
                                                消息类型</span></th>
                                                    <th class="per text-center" style="width: 10%;"><span value=""
                                                                                                          style="padding:2px 0; margin-right: 10px;">
                                                消息内容</span></th>
                                                    <th class="per text-center" style="width: 5%"><span value=""
                                                                                                        style="padding:2px 0; margin-right: 10px;">
                                                日期</span></th>
                                                    <th class="per text-center" style="width: 5%"><span value="">
                                                操作</span></th>
                                                </tr>
                                                <c:forEach var="messages" items="${pg.pageData}">
                                                    <tr id="tr">
                                                        <td class="per text-center">
                                                            <input name="ids" type="checkbox" value="${messages.id}">
                                                        </td>
                                                        <td class="per text-center">
                                                                ${messages.id}
                                                        </td>
                                                        <td class="per text-center">
                                                                ${messages.msgTitle}
                                                        </td>
                                                        <td class="per text-center">
                                                                ${messages.msgType}
                                                        </td>
                                                        <td class="per text-center"
                                                            style="overflow: hidden;text-overflow: ellipsis;line-height: 28px;display: -webkit-box;-webkit-line-clamp: 1;-webkit-box-orient: vertical;">
                                                            <div style="cursor: pointer" id="${messages.id}"
                                                                 onclick="getDetail(this.id)">${messages.msg}</div>
                                                        </td>
                                                        <td class="per text-center">
                                                                ${messages.updateTime}
                                                        </td>
                                                        <td class="per text-center">
                                                            <span id="${messages.id}" onclick="readMessage(this.id)"
                                                                  style="cursor: pointer">${messages.status eq 0?"未读":"已读"}</span>
                                                            <span id="${messages.id}" onclick="deleteMessage(this.id)"
                                                                  style="cursor: pointer">${messages.isDelete eq 0?"删除":"已删除"}</span>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                                </thead>
                                            </table>
                                            <div id="page" align="center">
                                                <a href="/tomessage?curPage=${pg.firstPage}">首页</a>
                                                <a href="/tomessage?curPage=${pg.currentPage - 1}">上一页</a>
                                                <a href="/tomessage?curPage=${pg.currentPage + 1}">下一页</a>
                                                <a href="/tomessage?curPage=${pg.lastPage}">尾页</a>
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
