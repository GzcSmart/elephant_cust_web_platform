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
                                        开票信息
                                    </li>
                                </ul>
                                <div class="panel panel-default plain toggle panelClose panelRefresh">
                                    <form action="" id="queryForm">
                                        <div class="panel-body" style="border:1px solid #e4e9eb;">
                                            <label>添加发票信息</label>
                                            <div class="layui-form-item">
                                                <label class="layui-form-label" style="padding: 7px 0">* 发票抬头&nbsp;&nbsp;</label>
                                                <div class="layui-input-block">
                                                    <input type="text" name="title" lay-verify="title"
                                                           autocomplete="off" placeholder="" class="layui-input">
                                                </div>
                                            </div>
                                            <div class="layui-form-item">
                                                <label class="layui-form-label" style="padding: 7px 0">* 统一社会信用代码/税务登记号&nbsp;</label>
                                                <div class="layui-input-block">
                                                    <input type="text" name="title" lay-verify="title"
                                                           autocomplete="off" placeholder="" class="layui-input">
                                                </div>
                                            </div>
                                            <div class="layui-form-item">
                                                <label class="layui-form-label" style="padding: 7px 0">* 开户行名称&nbsp;&nbsp;</label>
                                                <div class="layui-input-block">
                                                    <input type="text" name="title" lay-verify="title"
                                                           autocomplete="off" placeholder="" class="layui-input">
                                                </div>
                                            </div>
                                            <div class="layui-form-item">
                                                <label class="layui-form-label" style="padding: 7px 0">* 开户行账号&nbsp;&nbsp;</label>
                                                <div class="layui-input-block">
                                                    <input type="text" name="title" lay-verify="title"
                                                           autocomplete="off" placeholder="" class="layui-input">
                                                </div>
                                            </div>
                                            <div class="layui-form-item">
                                                <label class="layui-form-label" style="padding: 7px 0">* 营业电话&nbsp;&nbsp;</label>
                                                <div class="layui-input-block">
                                                    <input type="text" name="title" lay-verify="title"
                                                           autocomplete="off" placeholder="" class="layui-input">
                                                </div>
                                            </div>
                                            <div class="layui-form-item">
                                                <label class="layui-form-label" style="padding: 7px 0">* 营业地址&nbsp;&nbsp;</label>
                                                <div class="layui-input-block">
                                                    <input type="text" name="title" lay-verify="title"
                                                           autocomplete="off" placeholder="" class="layui-input">
                                                </div>
                                            </div>
                                            <div class="layui-form-item">
                                                <label class="layui-form-label">* 纳税人资格类型</label>
                                                <div class="layui-input-block" style="line-height: 36px">
                                                    小规模纳税人<input type="radio" name="sex" value="小规模纳税人" title="小规模纳税人"
                                                                 checked=""/>
                                                    一般纳税人<input type="radio" name="sex" value="一般纳税人" title="一般纳税人"/>
                                                </div>
                                            </div>
                                            <div class="layui-form-item">
                                                <label class="layui-form-label" style="padding: 7px 0">* 营业执照/税务登记证扫描件&nbsp;&nbsp;</label>
                                                <div class="layui-input-block">
                                                    <input style="display: inline-block;margin-right: 10px" type="text"
                                                           name="title" lay-verify="title" autocomplete="off"
                                                           placeholder="" class="layui-input" disabled="disabled">
                                                    <button type="button" class="layui-btn">上传</button>
                                                    <button type="button" class="layui-btn">预览</button>
                                                </div>
                                            </div>
                                            <div class="layui-form-item">
                                                <label class="layui-form-label" style="padding: 7px 0">一般纳税人资格认证扫描件&nbsp;&nbsp;</label>
                                                <div class="layui-input-block">
                                                    <input style="display: inline-block;margin-right: 10px" type="text"
                                                           name="title" lay-verify="title" autocomplete="off"
                                                           placeholder="" class="layui-input" disabled="disabled">
                                                    <button type="button" class="layui-btn">上传</button>
                                                    <button type="button" class="layui-btn">预览</button>
                                                </div>
                                            </div>
                                            <div class="layui-form-item">
                                                <label class="layui-form-label"
                                                       style="padding: 7px 0">其他文件&nbsp;&nbsp;</label>
                                                <div class="layui-input-block">
                                                    <input style="display: inline-block;margin-right: 10px" type="text"
                                                           name="title" lay-verify="title" autocomplete="off"
                                                           placeholder="" class="layui-input" disabled="disabled">
                                                    <button type="button" class="layui-btn">上传</button>
                                                    <button type="button" class="layui-btn">预览</button>
                                                </div>
                                            </div>
                                            <div class="layui-form-item">
                                                <label class="layui-form-label"
                                                       style="padding: 7px 0">备注&nbsp;&nbsp;</label>
                                                <div class="layui-input-block">
                                                    <input type="text" name="title" lay-verify="title"
                                                           autocomplete="off" placeholder="" class="layui-input">
                                                </div>
                                            </div>
                                            <div class="layui-form-item">
                                                <label class="layui-form-label"
                                                       style="padding: 7px 0">审核状态&nbsp;&nbsp;</label>
                                            </div>
                                            <button type="button" class="layui-btn">提交</button>
                                            <button type="reset" class="layui-btn">重置</button>
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
