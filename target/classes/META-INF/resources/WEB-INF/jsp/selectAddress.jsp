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
    <script src="${pageContext.request.contextPath }/static/js/jquery-2.1.4.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/jquery-2.1.4.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/layui/layui.js"></script>
    <script type="text/javascript">
        $(function () {
            $('input:radio').click(function () {
                var $radio = $(this);
                if ($radio.data('checked')) {
                    $radio.prop('checked', false);
                    $radio.data('checked', false);
                } else {
                    $radio.prop('checked', true);
                    $radio.data('checked', true);
                }
            });
        })

        function openAddWindows() {
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
                title: '<i class="br-address-book" style="color:#828ea2">  <b>新增地址信息</b></i>',
                area: [screenWidth + 'px', screenHeight + 'px'],
                shade: 0.03,
                scrollbar: false,
                fix: false,
                maxmin: false,
                content: '/go2Add'
            });
        }

        function openUpdWindows(id) {
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
                title: '<i class="br-address-book" style="color:#828ea2">  <b>修改地址信息</b></i>',
                area: [screenWidth + 'px', screenHeight + 'px'],
                shade: 0.03,
                scrollbar: false,
                fix: false,
                maxmin: false,
                content: '/go2Upd?id=' + id
            });
        }

        function delAddress(v) {
            $.ajax({
                type: "POST",
                url: "delAddress",
                dataType: "JSON",
                data: {
                    'id': $("#id2").val(),
                },
                cache: false,
                success: function (data) {
                    layer.closeAll('loading');
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

                },
                error: function () {
                    layer.msg("系统内部异常", {icon: 2, time: 1500});
                    layer.closeAll('loading');
                }
            });
        }

        function selAddress() {
            console.log($('input:radio:checked').val());
            var addressId = $('input:radio:checked').val();
            window.location.href = "addInvoiceApply?addressId=" + addressId;
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
                                        发票申请
                                    </li>
                                </ul>
                                <div class="panel panel-default plain toggle panelClose panelRefresh">
                                    <div class="panel-body" style="">
                                        <div class="col-lg-12"
                                             style="padding-left:0px;padding-top:0px;font-size:16px;">
                                            <div class="col-lg-3"><i
                                                    class="lnr lnr-pencil"> <strong> 第一步：确认开票信息</strong></i></div>
                                            <div class="col-lg-3"><i class="lnr lnr-picture"> 第二步：选择账单</i></div>
                                            <div class="col-lg-3" style="/* padding-left:0px; */color:#0091f1;"><i
                                                    class="lnr lnr-checkmark-circle"> 第三步：选择收票地址</i></div>
                                        </div>
                                    </div>
                                    <form action="" id="queryForm">
                                        <div class="panel-body" style="border:1px solid #e4e9eb;">
                                            <button type="button" class="layui-btn" onclick="openAddWindows()">新增地址
                                            </button>
                                            <table class="table table-hover table-bordered non-responsive"
                                                   style="margin-bottom:90px;margin-top: 20px" id="ywInfoTable">
                                                <thead>
                                                <tr id="tab_td">
                                                    <th class="per text-center" style="width: 5%"><span value=""
                                                                                                        style="padding:2px 0; margin-right: 10px;">
                                                选择</span></th>
                                                    <th class="per text-center" style="width: 5%"><span value=""
                                                                                                        style="padding:2px 0; margin-right: 10px;">
                                                收货人姓名</span></th>
                                                    <th class="per text-center" style="width: 5%"><span value=""
                                                                                                        style="padding:2px 0; margin-right: 10px;">
                                                所在地区</span></th>
                                                    <th class="per text-center" style="width: 5%"><span value=""
                                                                                                        style="padding:2px 0; margin-right: 10px;">
                                                详细地址</span></th>
                                                    <th class="per text-center" style="width: 5%"><span value=""
                                                                                                        style="padding:2px 0; margin-right: 10px;">
                                                手机号码</span></th>
                                                    <th class="per text-center" style="width: 5%"><span value=""
                                                                                                        style="padding:2px 0; margin-right: 10px;">
                                                电话号码</span></th>
                                                    <th class="per text-center" style="width: 5%"><span value=""
                                                                                                        style="padding:2px 0; margin-right: 10px;">
                                                邮政编码</span></th>
                                                    <th class="per text-center" style="width: 5%"><span value=""
                                                                                                        style="padding:2px 0; margin-right: 10px;">
                                                是否默认地址</span></th>
                                                    <th class="per text-center" style="width: 5%"><span value="">
                                                操作</span></th>
                                                </tr>
                                                <c:forEach var="address" items="${customerAddresses}">
                                                    <tr id="tr">
                                                        <td class="per text-center">
                                                            <input id="${address.id}" type="radio" name=""
                                                                   value="${address.id}" title="">
                                                        </td>
                                                        <td class="per text-center">
                                                                ${address.name}
                                                        </td>
                                                        <td class="per text-center">
                                                                ${address.provinceName}
                                                                ${address.cityName}
                                                                ${address.districtName}
                                                        </td>
                                                        <td class="per text-center">
                                                                ${address.detailedArea}
                                                        </td>
                                                        <td class="per text-center">
                                                                ${address.phone}
                                                        </td>
                                                        <td class="per text-center">
                                                                ${address.telephone}
                                                        </td>
                                                        <td class="per text-center">
                                                                ${address.postalCode}
                                                        </td>
                                                        <td class="per text-center">
                                                                ${address.isDefaultAddress eq 1 ? '是' : '否'}
                                                        </td>
                                                        <td class="per text-center">
                                                            <button type="button" class="btn btn-info"
                                                                    id="${address.id}"
                                                                    onclick="openUpdWindows(this.id)">修改
                                                            </button>
                                                            <button type="button" class="btn btn-info" id="id2"
                                                                    value="${address.id}"
                                                                    onclick="delAddress(this.value)">删除
                                                            </button>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                                </thead>
                                            </table>
                                            <div style="display: flex;justify-content:center;">
                                                <a href="toselectBill">
                                                    <button type="button" class="layui-btn" onclick="">上一步</button>
                                                </a>
                                                <button style="margin-left: 20px" type="button" class="layui-btn"
                                                        onclick="selAddress()">提交
                                                </button>
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
