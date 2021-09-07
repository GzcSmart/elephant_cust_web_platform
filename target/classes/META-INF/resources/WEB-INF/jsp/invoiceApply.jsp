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
    <script src="${pageContext.request.contextPath}/static/layui/layui.js"></script>
    <script type="text/javascript">
        $(function () {
            if (${count == '1'}) {
                $("#div1").hide();
                $("#div2").hide();
                $("#xinxi").removeAttr("style");
                $("#dizhi").css("color", "#0091f1");
            } else {
                $("#div2").hide();
                $("#div3").hide();
            }
            $("#nextstep1").on('click', function () {
                $("#div2").show();
                $("#div1").hide();
                $("#xinxi").removeAttr("style");
                $("#zhangdan").css("color", "#0091f1");
            });
            $("#previousstep").on('click', function () {
                $("#div1").show();
                $("#div2").hide();
                $("#zhangdan").removeAttr("style");
                $("#xinxi").css("color", "#0091f1");
            });
            $("#nextstep2").on('click', function () {
                $("#div3").show();
                $("#div2").hide();
                $("#zhangdan").removeAttr("style");
                $("#dizhi").css("color", "#0091f1");
            });
            $("#previousstep2").on('click', function () {
                $("#div2").show();
                $("#div3").hide();
                $("#dizhi").removeAttr("style");
                $("#zhangdan").css("color", "#0091f1");
            });
            $('input:radio').click(function () {
                // var $radio = $(this);
                $("input[name='dizhi']:checked").not(this).attr("checked", false);
                // if ($radio.data('checked')){
                //     $radio.prop('checked', false);
                //     $radio.data('checked', false);
                // } else {
                //     $radio.prop('checked', true);
                //     $radio.data('checked', true);
                // }
            });
        })
        var validateAddress = function () {
            var invoiceType = $("#invoiceType").val();
            var customerYwId = $("#customerYwId").val();
            var billId = $("#billId").val();
            var stampType = $("#stampType").val();
            var needBill = $("input[name='needBill1']:checked").val();
            var invoiceCategory = $("#invoiceCategory").val();
            var invoiceAmount = $("#invoiceAmount").val();
            if (invoiceType === "") {
                layer.msg('请选择发票类型', {icon: 7, time: 3000}, function () {
                    $("#invoiceType").focus();
                });
                return false;
            } else if (customerYwId === "") {
                layer.msg('请选择服务名称', {icon: 7, time: 3000}, function () {
                    $("#customerYwId").focus();
                });
                return false;
            } else if (billId === "") {
                layer.msg('请选择开票账单', {icon: 7, time: 3000}, function () {
                    $("#billId").focus();
                });
                return false;
            } else if (stampType === "") {
                layer.msg('请选择盖章类型', {icon: 7, time: 3000}, function () {
                    $("#stampType").focus();
                });
                return false;
            } else if (needBill === "") {
                layer.msg('请选择是否需要对账单', {icon: 7, time: 3000}, function () {
                    $("#needBill").focus();
                });
                return false;
            } else if (!invoiceCategory) {
                layer.msg('请填写发票项目', {icon: 7, time: 3000}, function () {
                    $("#invoiceCategory").focus();
                });
                return false;
            } else if (!invoiceAmount) {
                layer.msg('请填写发票金额', {icon: 7, time: 3000}, function () {
                    $("#invoiceAmount").focus();
                });
                return false;
            } else {
                return true;
            }
        }

        function openAddWindows() {
            var count = 1;
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
                content: '/go2Add?count=' + count
            });
        }

        function openUpdWindows(id) {
            var count = 1;
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
                content: '/go2Upd?id=' + id + '&count=' + count
            });
        }

        function delAddress(v) {
            layer.confirm("确定删除吗?", {
                    btn: ['确定', '取消']
                }, function () {
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
                                        // window.parent.location.reload();
                                        // parent.layer.closeAll('iframe');
                                        // $("#div3").reload();
                                        window.parent.location.href = "/toinvoiceApply?count=1";
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
                }, function () {
                    layer.close()
                }
            )
        }

        function selAddress() {
            if (validateAddress() && $("input[name='dizhi']:checked").val()) {
                console.log($("input[name='dizhi']:checked").val());
                var addressId = $("input[name='dizhi']:checked").val();
                // window.location.href = "addInvoiceApply?addressId=" + addressId;
                var needBill = $("input[name='needBill1']:checked").val();
                $.ajax({
                    type: "POST",
                    url: "addInvoiceApply",
                    dataType: "JSON",
                    data: {
                        'invoiceType': $("#invoiceType").val(),
                        'customerYwId': $("#customerYwId").val(),
                        'billId': $("#billId").val(),
                        'stampType': $("#stampType").val(),
                        'needBill': needBill,
                        'invoiceCategory': $("#invoiceCategory").val(),
                        'invoiceAmount': $("#invoiceAmount").val(),
                        'addressId': addressId
                    },
                    cache: false,
                    success: function (data) {
                        if (data.code === "0000") {
                            layer.msg('提交成功，请耐心等待审核', {
                                icon: 1, time: 3000,
                            }).close;
                        } else {
                            layer.msg(data.message, {icon: 2, time: 3000});
                        }
                    },
                    error: function () {
                        layer.msg("系统内部异常", {icon: 2, time: 3000});
                        layer.closeAll('loading');
                    }
                });
            } else {
                alert("信息未填写完整，不能提交");
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
                                            <div id="xinxi" class="col-lg-3"
                                                 style="/* padding-left:0px; */color:#0091f1;"><i
                                                    class="lnr lnr-pencil"> <strong> 第一步：确认开票信息</strong></i></div>
                                            <div id="zhangdan" class="col-lg-3"><i class="lnr lnr-picture"> 第二步：选择账单</i>
                                            </div>
                                            <div id="dizhi" class="col-lg-3"><i class="lnr lnr-checkmark-circle">
                                                第三步：选择收票地址</i></div>
                                        </div>
                                    </div>
                                    <form action="" id="queryForm">
                                        <div class="panel-body" style="border:1px solid #e4e9eb;" id="div1">
                                            <div class="layui-form-item">
                                                <label class="layui-form-label" style="padding: 7px 0">* 发票抬头&nbsp;&nbsp;</label>
                                                <div class="layui-input-block">
                                                    <input id="invoiceTitle" type="text" name="invoiceTitle"
                                                           lay-verify="title" autocomplete="off" placeholder=""
                                                           class="layui-input"
                                                           value="${invoiceByCustomerId.invoiceTitle}"
                                                           disabled="disabled">
                                                </div>
                                            </div>
                                            <div class="layui-form-item">
                                                <label class="layui-form-label" style="padding: 7px 0">* 统一社会信用代码/税务登记号&nbsp;</label>
                                                <div class="layui-input-block">
                                                    <input id="taxNum" type="text" name="taxRegisterNumber"
                                                           lay-verify="title" autocomplete="off" placeholder=""
                                                           class="layui-input" value="${invoiceByCustomerId.taxNum}"
                                                           disabled="disabled">
                                                </div>
                                            </div>
                                            <div class="layui-form-item">
                                                <label class="layui-form-label" style="padding: 7px 0">* 开户行名称&nbsp;&nbsp;</label>
                                                <div class="layui-input-block">
                                                    <input id="bankName" type="text" name="invoiceBank"
                                                           lay-verify="title" autocomplete="off" placeholder=""
                                                           class="layui-input" value="${invoiceByCustomerId.bankName}"
                                                           disabled="disabled">
                                                </div>
                                            </div>
                                            <div class="layui-form-item">
                                                <label class="layui-form-label" style="padding: 7px 0">* 开户行账号&nbsp;&nbsp;</label>
                                                <div class="layui-input-block">
                                                    <input id="bankNum" type="text" name="bankCardNumber"
                                                           lay-verify="title" autocomplete="off" placeholder=""
                                                           class="layui-input" value="${invoiceByCustomerId.bankNum}"
                                                           disabled="disabled">
                                                </div>
                                            </div>
                                            <div class="layui-form-item">
                                                <label class="layui-form-label" style="padding: 7px 0">* 营业电话&nbsp;&nbsp;</label>
                                                <div class="layui-input-block">
                                                    <input id="mobile" type="text" name="orgMobile" lay-verify="title"
                                                           autocomplete="off" placeholder="" class="layui-input"
                                                           value="${invoiceByCustomerId.mobile}" disabled="disabled">
                                                </div>
                                            </div>
                                            <div class="layui-form-item">
                                                <label class="layui-form-label" style="padding: 7px 0">* 营业地址&nbsp;&nbsp;</label>
                                                <div class="layui-input-block">
                                                    <input id="address" type="text" name="orgAddress" lay-verify="title"
                                                           autocomplete="off" placeholder="" class="layui-input"
                                                           value="${invoiceByCustomerId.address}" disabled="disabled">
                                                </div>
                                            </div>
                                            <div class="layui-form-item">
                                                <label class="layui-form-label">* 纳税人资格类型</label>
                                                <div class="layui-input-block" style="line-height: 36px">
                                                    小规模纳税人<input disabled="disabled" type="radio" value="1"
                                                                 title="小规模纳税人"
                                                                 <c:if test="${invoiceByCustomerId.taxType == 1}">checked</c:if>/>
                                                    一般纳税人<input disabled="disabled" type="radio" value="0" title="一般纳税人"
                                                                <c:if test="${invoiceByCustomerId.taxType == 0}">checked</c:if>/>
                                                </div>
                                            </div>
                                            <div class="layui-form-item">
                                                <label class="layui-form-label" style="padding: 7px 0">* 营业执照/税务登记证扫描件&nbsp;&nbsp;</label>
                                                <div class="layui-input-block">
                                                    <input id="file1" style="display: inline-block;margin-right: 10px"
                                                           type="text" lay-verify="title" autocomplete="off"
                                                           placeholder="" class="layui-input" disabled="disabled"
                                                           value="${invoiceByCustomerId.busLicUrl}" disabled="disabled">
                                                    <button type="button" class="layui-btn" id="licensefile" disabled>
                                                        上传
                                                    </button>
                                                    <button type="button" class="layui-btn">预览</button>
                                                </div>
                                            </div>
                                            <div class="layui-form-item">
                                                <label class="layui-form-label" style="padding: 7px 0">一般纳税人资格认证扫描件&nbsp;&nbsp;</label>
                                                <div class="layui-input-block">
                                                    <input id="file2" style="display: inline-block;margin-right: 10px"
                                                           type="text" lay-verify="title" autocomplete="off"
                                                           placeholder="" class="layui-input" disabled="disabled"
                                                           value="${invoiceByCustomerId.custLicUrl}"
                                                           disabled="disabled">
                                                    <button type="button" class="layui-btn" id="taxpayerfile" disabled>
                                                        上传
                                                    </button>
                                                    <button type="button" class="layui-btn">预览</button>
                                                </div>
                                            </div>
                                            <div class="layui-form-item">
                                                <label class="layui-form-label"
                                                       style="padding: 7px 0">其他文件&nbsp;&nbsp;</label>
                                                <div class="layui-input-block">
                                                    <input id="file3" style="display: inline-block;margin-right: 10px"
                                                           type="text" lay-verify="title" autocomplete="off"
                                                           placeholder="" class="layui-input" disabled="disabled"
                                                           value="${invoiceByCustomerId.otherLicUrl}"
                                                           disabled="disabled">
                                                    <button type="button" class="layui-btn" id="otherfile" disabled>上传
                                                    </button>
                                                    <button type="button" class="layui-btn">预览</button>
                                                </div>
                                            </div>
                                            <div class="layui-form-item">
                                                <label class="layui-form-label"
                                                       style="padding: 7px 0">备注&nbsp;&nbsp;</label>
                                                <div class="layui-input-block">
                                                    <input id="remark" type="text" name="title" lay-verify="title"
                                                           autocomplete="off" placeholder="" class="layui-input"
                                                           value="${invoiceByCustomerId.remark}" disabled="disabled">
                                                </div>
                                            </div>
                                            <div class="layui-form-item">
                                                <label class="layui-form-label"
                                                       style="padding: 7px 0">审核状态&nbsp;&nbsp;</label>
                                                <label style="padding: 7px 0">
                                                    <c:if test="${invoiceByCustomerId.status == 0}">审核中</c:if>
                                                    <c:if test="${invoiceByCustomerId.status == 1}">审核通过</c:if>
                                                    <c:if test="${invoiceByCustomerId.status == 2}">审核拒绝</c:if>
                                                </label>
                                            </div>
                                            <button id="nextstep1" type="button" class="layui-btn" onclick="">下一步
                                            </button>
                                        </div>
                                        <div class="panel-body" style="border:1px solid #e4e9eb;" id="div2">
                                            <div class="layui-form-item">
                                                <label class="layui-form-label" style="padding: 7px 0">*
                                                    发票类型&nbsp;</label>
                                                <div class="layui-input-inline" style="width: 300px;margin-left: 20px">
                                                    <select id="invoiceType" name="invoiceType" lay-verify="required"
                                                            lay-search=""
                                                            style="display: inline-block;height: 35px;width: 250px">
                                                        <option value="">请选择发票类型</option>
                                                        <option value="0">增值税普通发票</option>
                                                        <option value="1">增值税专用发票</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="layui-form-item">
                                                <label class="layui-form-label" style="padding: 7px 0">*
                                                    服务名称&nbsp;</label>
                                                <div class="layui-input-inline" style="width: 300px;margin-left: 20px">
                                                    <select id="customerYwId" name="customerYwId" lay-verify="required"
                                                            lay-search=""
                                                            style="display: inline-block;height: 35px;width: 250px">
                                                        <option value="">请选择服务名称</option>
                                                        <option value="1">一键登录</option>
                                                        <option value="3">短信验证码</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="layui-form-item">
                                                <label class="layui-form-label" style="padding: 7px 0">*
                                                    开票账单&nbsp;</label>
                                                <div class="layui-input-inline" style="width: 300px;margin-left: 20px">
                                                    <select id="billId" name="billId" lay-verify="required"
                                                            lay-search=""
                                                            style="display: inline-block;height: 35px;width: 250px">
                                                        <option value="">请选择开票账单</option>
                                                        <option value="123">123</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="layui-form-item">
                                                <label class="layui-form-label" style="padding: 7px 0">*
                                                    盖章类型&nbsp;</label>
                                                <div class="layui-input-inline" style="width: 300px;margin-left: 20px">
                                                    <select id="stampType" name="stampType" lay-verify="required"
                                                            lay-search=""
                                                            style="display: inline-block;height: 35px;width: 250px">
                                                        <option value="财务章">财务章</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="layui-form-item">
                                                <label class="layui-form-label"
                                                       style="padding: 7px 0;margin-right: 20px">* 纸质对账单</label>
                                                <div class="layui-input-block"
                                                     style="line-height: 36px;margin-left: 20px" id="wrap">
                                                    <input type="radio" name="needBill1" value="0" title="不需要"
                                                           style="display: inline-block;" checked="checked"/>不需要
                                                    <input type="radio" name="needBill1" value="1" title="需要"
                                                           style="display: inline-block;"/>需要
                                                </div>
                                            </div>
                                            <div class="layui-form-item">
                                                <label class="layui-form-label"
                                                       style="padding: 7px 0;margin-right: 20px">*
                                                    发票项目&nbsp;&nbsp;</label>
                                                <div class="layui-input-block">
                                                    <input id="invoiceCategory" style="width: 300px" type="text"
                                                           name="invoiceCategory" lay-verify="title" autocomplete="off"
                                                           placeholder="" class="layui-input" value="信息服务费，通信服务费">
                                                </div>
                                            </div>
                                            <div class="layui-form-item">
                                                <label class="layui-form-label"
                                                       style="padding: 7px 0;margin-right: 20px">*
                                                    发票金额&nbsp;&nbsp;</label>
                                                <input id="invoiceAmount" style="width: 100px" type="text"
                                                       name="invoiceAmount" lay-verify="title" autocomplete="off"
                                                       placeholder="" class="layui-input" value="0.00">
                                            </div>
                                            <button id="previousstep" type="button" class="layui-btn" onclick="">上一步
                                            </button>
                                            <button id="nextstep2" type="button" class="layui-btn" onclick="">下一步
                                            </button>
                                        </div>
                                        <div class="panel-body" style="border:1px solid #e4e9eb;" id="div3">
                                            <input type="hidden" value="1" id="count">
                                            <input type="hidden" id="count_num_p">
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
                                                            <input id="${address.id}" type="radio" name="dizhi"
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
                                                <button id="previousstep2" type="button" class="layui-btn" onclick="">
                                                    上一步
                                                </button>
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
<script src="${pageContext.request.contextPath}/static/layui/layui.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/city-picker.js"></script>
<script type="text/javascript">
    layui.config({
        base: './static/'
    }).extend({
        common: 'js/common'
    });
    layui.use(['form', 'common'], function () {
        var common = layui.common,
            form = layui.form;

        common.showCity('province', 'city', 'district');

        //监听提交
        // form.on('submit(formDemo)', function(data){
        //     var resData = data.field,
        //         province = resData.province,
        //         city = resData.city,
        //         district = resData.district;
        //
        //     console.log(province, city, district);
        //
        //     // 通过地址code码获取地址名称
        //     var address = common.getCity({
        //         province,
        //         city,
        //         district
        //     });
        //     address = JSON.stringify(address);
        //     console.log(address);
        //     $("#address").val(address);
        //     return true;
        // });

    });
    layui.use('upload', function () {
        let upload = layui.upload;
        let $ = layui.$;
        //执行实例
        let uploadInst1 = upload.render({
            elem: '#licensefile' //绑定元素
            , url: 'uploadimg' //上传接口
            , done: function (res) {
                //上传完毕回调
                if (res.code == 1) {
                    layer.msg(res.msg);
                    let imagePath = res.data.src;
                    $("#file1").attr("value", imagePath);
                } else {
                    layer.msg(res.msg);
                }
            }
            , error: function () {
                //请求异常回调
            }
        });
    });

    layui.use('upload', function () {
        let upload = layui.upload;
        let $ = layui.$;
        //执行实例
        let uploadInst2 = upload.render({
            elem: '#taxpayerfile' //绑定元素
            , url: 'uploadimg' //上传接口
            , done: function (res) {
                //上传完毕回调
                if (res.code == 1) {
                    layer.msg(res.msg);
                    let imagePath = res.data.src;
                    $("#file2").attr("value", imagePath);
                } else {
                    layer.msg(res.msg);
                }
            }
            , error: function () {
                //请求异常回调
            }
        });
    });

    layui.use('upload', function () {
        let upload = layui.upload;
        let $ = layui.$;
        //执行实例
        let uploadInst3 = upload.render({
            elem: '#otherfile' //绑定元素
            , url: 'uploadimg' //上传接口
            , done: function (res) {
                //上传完毕回调
                if (res.code == 1) {
                    layer.msg(res.msg);
                    let imagePath = res.data.src;
                    $("#file3").attr("value", imagePath);
                } else {
                    layer.msg(res.msg);
                }
            }
            , error: function () {
                //请求异常回调
            }
        });
    });

</script>
