<%@ page language="java" pageEncoding="UTF-8" %>
<%@ include file="taglib.jsp" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<base href="<%=basePath%>">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link href="${pageContext.request.contextPath}/static/css/content.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/static/css/public.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/static/css/page.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/assets/css/bootstrap-select.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/static/css/datepicker.min.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/static/js/jquery-2.1.4.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/jquery-sortable.js"></script>
<script src="${pageContext.request.contextPath}/static/js/elephant.js"></script>
<!-- validate begin-->
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery.validate.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/validate.method.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/messages_zh.min.js"></script>
<!-- validate begin-->
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/goSMS.js"></script>
<!-- layer begin-->
<script type="text/javascript" src="${pageContext.request.contextPath}/static/layui/layui.all.js"></script>
<!-- layer end-->
<!-- bootstrap begin -->
<script src="${pageContext.request.contextPath}/static/js/bootstrap-select.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/static/js/bootstrap.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/static/js/datepicker.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/static/js/datepicker.zh-CN.js" type="text/javascript"></script>
<!-- bootstrap end -->
<!-- areaSelect begin -->
<script src="${pageContext.request.contextPath}/static/js/data.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/static/js/jquery.city.select.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/static/js/prettify.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/static/js/layui-page.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/static/js/activityConstant.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css" media="all">
<!-- areaSelect end -->
<script>
    $(document).ready(function () {
        $("#searchInfo").click(function () {
            $("#queryForm").submit();
        });

        $("#back_btn").click(function () {
            window.history.back(-1);
        });
        //列表选择checkbox，实现多选
        $("#ids").click(function () {
            if ($(this).attr("checked") == true || $(this).attr("checked") == 'checked') {
                $("input[type='checkbox']").each(function () {
                    if ($(this).attr("disabled") == null) {
                        $(this).attr("checked", true);
                    }
                });
            } else {
                $("input[type='checkbox']").attr("checked", false);
                $("#ids").val("");
            }
        });

    });

    /**
     * 复选框全选和取消全选
     */
    function setCheckBoxListener() {
        $("#ids").attr("checked", false);
        $("#ids").val("");
        $("input[type='checkbox'][name='ids']").each(function () {
            $(this).click(function () {
                var selected = 1;
                $("input[type='checkbox'][name='ids']").each(function () {
                    console.log($(this));
                    if ($(this).attr("checked") !== "checked"
                        || $(this).checked === false) {
                        selected = 0;
                    }
                });
                if (selected === 0) {
                    $("#ids").attr("checked", false);
                } else {
                    $("#ids").attr("checked", true);
                }
            })
        });
    }
</script>
