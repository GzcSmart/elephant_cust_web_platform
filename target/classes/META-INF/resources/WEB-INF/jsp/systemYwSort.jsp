<%@ page pageEncoding="UTF-8" %>
<%@ include file="taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>大象能力平台</title>
    <link href="../../static/css/bootstrap.min.css" rel="stylesheet">
    <link href="../../static/css/font-awesome.min.css" rel="stylesheet">
    <link href="../../static/css/animations.css" rel="stylesheet">
    <link href="../../static/css/style.css" rel="stylesheet">
    <link href="../../static/css/custom.css" rel="stylesheet">
    <script src="../../static/js/jquery-2.1.4.min.js"></script>
    <script src="../../static/layui/layui.all.js"></script>
    <script type="text/javascript">
        function directToSort(type, sortName, url) {
            var screenHeight = document.documentElement.clientHeight;
            var screenWidth = document.documentElement.clientWidth;
            layer.open({
                title: '<b><i class="st-book2"/>' + sortName + '</b>',
                type: 2,
                area: [screenWidth * 1 + 'px', screenHeight * 1 + 'px'],
                fixed: false,
                resize: true,
                scrollbar: false,
                shadeClose: true,
                content: url + "/index/showApi?type=" + type + "&index=0",
                moveOut: true,
                anim: -1,
                btn: ['返回'],
                yes: function (index, layero) {
                    layer.closeAll();
                }
            });
            $(".layui-layer-btn0").css("float", "left");
            $(".layui-layer-setwin").css("display", "none");
        }
    </script>
    <style>
        .layerBody {
            z-index: 19891015;
            width: 100%;
            height: 100%;
            position: absolute;
            top: 0px;
            left: 0px;
        }
    </style>
</head>
<body>
<div class="grid-item col-md-4 col-sm-4 col-xs-12 ill">
    <div class="work-item">
        <img src="../../static/images/ptg3MFare.jpg" alt="">
        <div class="work-inner">
            <a class="work-zoom" href="javascript:void(0);"
               onclick="directToSort('1','一键登录','${pageContext.request.contextPath}')"><i class="fa fa-search"></i></a>
        </div>
    </div>
    <div class="blog-item-text" style="background-color: aliceblue;">
        <p>一键登录</p>
    </div>
</div>
<div class="grid-item col-md-4 col-sm-4 col-xs-12 ill">
    <div class="work-item">
        <img src="../../static/images/phonecheck.jpg" alt="">
        <div class="work-inner">
            <a class="work-zoom" href="javascript:void(0);"
               onclick="directToSort('2','本机号码校验','${pageContext.request.contextPath}')"><i
                    class="fa fa-search"></i></a>
        </div>
    </div>
    <div class="blog-item-text" style="background-color: aliceblue;">
        <p>本机号码校验</p>
    </div>
</div>

</body>
</html>
