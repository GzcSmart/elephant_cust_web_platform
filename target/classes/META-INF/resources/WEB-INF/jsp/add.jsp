<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="icon" href="../../../../elephant_images/favicon.png" type="image/x-icon">
    <title>大象能力平台</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css" media="all">
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/layui/layui.all.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-2.1.4.min.js"></script>
    <script>
        $(function () {
            //提交
            $("#submit_address").click(function () {
                if (validateAddress()) {
                    // layer.load(1);
                    saveAddress();
                }
            })
        });
        var validateAddress = function () {
            var name = $("#name").val();
            var province = $("#province").val();
            var city = $("#city").val();
            var district = $("#district").val();
            var detailedArea = $("#detailedArea").val();
            var postcode = $("#postcode").val();
            var postcode_test = /(^[0-9]{5,6}$)|(^$)/;
            var phone = $("#phone").val();
            var phone_test = /^0{0,1}1[0-9]{10}$/;
            var mobile = $("#mobile").val();
            var mobile_test = /(^[0-9]{3,4}\-[0-9]{7,8}$)|(^$)/;
            if (phone && phone.startsWith("+86")) {
                phone = phone.substring(3, phone.length);
            }
            if (!name) {
                layer.msg('请填写收货人姓名', {icon: 7, time: 1500}, function () {
                    $("#name").focus();
                });
                return false;
            } else if ($.trim(province) === "" || "0" === province) {
                layer.msg('选择所在地区', {icon: 7, time: 1500}, function () {
                    $("#province").focus();
                });
                return false;
            } else if (city !== "" && "0" === city) {
                layer.msg('所在地区请选择完整', {icon: 7, time: 1500}, function () {
                    $("#city").focus();
                });
                return false;
            } else if (district !== "" && "0" === district) {
                layer.msg('所在地区请选择完整', {icon: 7, time: 1500}, function () {
                    $("#district").focus();
                });
                return false;
            } else if (!detailedArea) {
                layer.msg('请填写详细地址', {icon: 7, time: 1500}, function () {
                    $("#detailedArea").focus();
                });
                return false;
            } else if (!postcode) {
                layer.msg('请填写邮政编码', {icon: 7, time: 1500}, function () {
                    $("#postcode").focus();
                });
                return false;
            } else if (!postcode_test.test(postcode)) {
                layer.msg('请填写正确的邮政编码', {icon: 7, time: 1500}, function () {
                    $("#postcode").focus();
                });
                return false;
            } else if (!phone) {
                layer.msg('请填写手机号码', {icon: 7, time: 1500}, function () {
                    $("#phone").focus();
                });
                return false;
            } else if (!phone_test.test(phone)) {
                layer.msg('请填写正确的手机号码', {icon: 7, time: 1500}, function () {
                    $("#phone").focus();
                });
                return false;
            } else if (!mobile) {
                if (!mobile_test.test(mobile)) {
                    layer.msg('电话格式不规范,请按照010-83578808格式填写', {icon: 7, time: 1500}, function () {
                        $("#mobile").focus();
                    });
                    return false;
                } else {
                    return true;
                }
            } else {
                return true;
            }
        }

        function initAddress() {
            // let prov = $("#province").val();
            // alert(prov);
            var common = layui.common;
            let province = $("#prov").val();
            let city = $("#city").val();
            let district = $("#district").val();
            var address = common.getCity({
                province,
                city,
                district
            });
            address = JSON.stringify(address);
            return address;
        }

        function saveAddress() {
            var pre_address = initAddress();
            var count = ${count};
            layer.load(1);
            $.ajax({
                type: "POST",
                url: "updateAddress",
                dataType: "JSON",
                data: {
                    'name': $("#name").val(),
                    'area': pre_address,
                    'detailedArea': $("#detailedArea").val(),
                    'postalCode': $("#postcode").val(),
                    'phone': $("#phone").val(),
                    'telephone': $("#mobile").val(),
                    "isDefaultAddress": $("input[name='DefaultAddress']:checked").val()
                },
                cache: false,
                success: function (data) {
                    layer.closeAll('loading');
                    if (data.code === "0000") {
                        layer.msg('添加成功', {
                            icon: 1, time: 1500,
                            end: function () {
                                if (count == 1) {
                                    window.parent.location.href = "/toinvoiceApply?count=" + count;
                                    parent.layer.closeAll('iframe');
                                } else {
                                    window.parent.location.reload();
                                    parent.layer.closeAll('iframe');
                                }
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
    </script>
    <style>
        .form-group {
            margin-top: 10px;
        }
    </style>
</head>
<body style="overflow-x:hidden ">
<!-- Start #content -->
<div id="content">
    <!-- Start .content-wrapper -->
    <div class="content-wrapper">
        <div class="outlet notSortable">
            <!-- Start .outlet -->
            <div class="row">
                <!-- Start .row -->
                <div class="col-lg-3">
                    <!-- Start col-lg-12 -->
                    <div class="panel panel-default toggle">
                        <!-- Start .panel -->
                        <div class="panel-body" style="border:none;text-align: center">
                            <form class="layui-form" action="" method="post">
                                <%--                                <input type="hidden" value="${count}" id="count_num">--%>
                                <div class="layui-form-item" style="margin-top: 10px">
                                    <label class="layui-form-label">收货人姓名</label>
                                    <div class="layui-input-block">
                                        <input id="name" name="name" style="width: 300px" type="text" lay-verify="title"
                                               autocomplete="off" placeholder="请填写收货人姓名" class="layui-input">
                                    </div>
                                </div>
                                <div class="layui-row" style="margin-bottom: 20px">
                                    <label class="layui-form-label">选择地区：</label>
                                    <div class="layui-col-sm4" style="margin-right: 5px; width: auto">
                                        <%--                                            <div class="layui-inline layui-select-default">--%>
                                        <%--                                                <select id="province" name="province" data-area="" lay-filter="province">--%>
                                        <%--                                                    <option value="">请选择省</option>--%>
                                        <%--                                                </select>--%>
                                        <%--                                            </div>--%>
                                        <select id="province" name="province" data-area="" lay-filter="province">
                                            <option value="">请选择省</option>
                                        </select>
                                        <input type="hidden" id="prov">
                                    </div>
                                    <div class="layui-col-sm4" style="margin-right: 5px; width: auto">
                                        <div class="layui-inline layui-select-default">
                                            <select id="city" name="city" data-area="" lay-filter="city">
                                                <option value="">请选择市</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="layui-col-sm4" style="width: auto">
                                        <div class="layui-inline layui-select-default">
                                            <select id="district" name="district" data-area="" lay-filter="district">
                                                <option value="">请选择区</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <input name="address" id="address" type="hidden"/>
                                <div class="layui-form-item">
                                    <label class="layui-form-label">详细地址</label>
                                    <div class="layui-input-block">
                                        <input id="detailedArea" name="detailedArea" style="width: 500px" type="text"
                                               lay-verify="title" autocomplete="off" placeholder="请填写详细地址"
                                               class="layui-input">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label">邮政编码</label>
                                    <div class="layui-input-block">
                                        <input id="postcode" name="postalCode" style="width: 300px" type="text"
                                               lay-verify="title" autocomplete="off" placeholder="请填写邮政编码"
                                               class="layui-input">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label">手机号码</label>
                                    <div class="layui-input-block">
                                        <input id="phone" name="phone" style="width: 300px" type="text"
                                               lay-verify="title" autocomplete="off" placeholder="请填写手机号码"
                                               class="layui-input">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label">电话号码</label>
                                    <div class="layui-input-block">
                                        <input id="mobile" name="telephone" style="width: 300px" type="text"
                                               lay-verify="title" autocomplete="off" placeholder="请填写电话号码"
                                               class="layui-input">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label" style="width: 85px">是否默认地址</label>
                                    <div class="layui-input-block" style="text-align: left">
                                        <input type="radio" name="DefaultAddress" value="1" title="是" checked="">
                                        <input type="radio" name="DefaultAddress" value="0" title="否">
                                    </div>
                                </div>
                                <button type="button" class="layui-btn" lay-submit lay-filter="formDemo"
                                        id="submit_address" onclick="">提交
                                </button>
                            </form>
                        </div>
                    </div>
                    <!-- End .panel -->
                </div>
                <!-- End col-lg-12 -->
            </div>
            <!-- End .row -->
            <!-- Page End here -->
        </div>
        <!-- End .outlet -->
    </div>
</div>
<!-- End #content -->
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/layui/layui.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/city-picker.js"></script>
<script>
    layui.config({
        base: './static/'
    }).extend({
        common: 'js/common'
    });

    layui.use(['form', 'common'], function () {
        var common = layui.common,
            form = layui.form;

        common.showCity('province', 'city', 'district');

        // console.log(data.field.province.code);

        // 监听提交
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
        //     $("#address").val(address);
        //     return true;
        // });

    });
</script>
</html>