<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html >
<html style="overflow-x:hidden">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css" media="all">
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-2.1.4.min.js"></script>
    <script type="text/javascript">
        function insConfig() {
            var systemYwId = $("input[name='systemYwId']:checked").map(function () {
                return $(this).val();
            }).get().join(',');
            var appName = $("#appName").val();
            var appImg = $("#img_src").val();
            var appDescription = $("#appDescription").val();
            var appPlatform = $("#appPlatform").val();
            $.ajax({
                type: "post",
                url: "addCverificationAppInfo",
                dataType: "json",
                data: {
                    'systemYwId': systemYwId,
                    'appName': appName,
                    'appImg': appImg,
                    'appDescription': appDescription,
                    'appPlatform': appPlatform
                },
                success: function (data) {
                    if (data.code === "0000") {
                        layer.msg('添加配置成功', {
                            icon: 1, time: 3000,
                            end: function () {
                                window.parent.location.reload();
                                parent.layer.closeAll('iframe');
                            }
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
        }
    </script>
    <style>
        .layui-form-select {
            display: none;
        }
    </style>
</head>
<body>
<div class="row">
    <!-- Start col-lg-12 -->
    <div class="panel-body">
        <div class="main" style="margin-top: 20px;">
            <form class="layui-form" action="">
                <input id="authId" value="" type="hidden">
                <input value="" id="img_src" type="hidden" name="img_src"/>
                <div class="layui-form-item" style="margin-top: 10px">
                    <label class="layui-form-label"><span style="color: #FF0000">*</span>归属</label>
                    <div class="layui-input-block">
                        <input disabled style="width: 300px" type="text" lay-verify="title" autocomplete="off"
                               placeholder="厦门集微科技有限公司专用" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item" pane="">
                    <div class="layui-input-block" style="margin-left: 0px">
                        <label class="layui-form-label"><span style="color: #FF0000">*</span>服务分类：</label>
                        <input type="checkbox" name="systemYwId" lay-skin="primary" title="一键登录" value="一键登录">
                        <input type="checkbox" name="systemYwId" lay-skin="primary" title="本机号码校验" value="本机号码校验">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label"><span style="color: #FF0000">*</span>应用名称</label>
                    <div class="layui-input-block">
                        <input id="appName" name="appName" style="width: 500px" type="text" lay-verify="title"
                               autocomplete="off" value="" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label"><span style="color: #FF0000">*</span>应用图片</label>
                    <img id="pic-individual1" class="lazy" alt="" width="130" height="100"
                         style="margin:0 auto;margin-right: 15px"/>
                    <div id="detail3"
                         style="position:absolute;top:0; display:inline-block;width:130px;height:100px;margin-left: -146px;margin-top: 179px; background:rgba(0,0,0,0.5);padding: 0;cursor: pointer">
                        <p style="color:#fff;line-height:14px;text-align:center;font-size:14px;margin-top:43px;"></p>
                        <button type="button" class="layui-btn" id="upload-button"
                                style="margin-top: 19px;width: 130px">
                            <i class="layui-icon">&#xe67c;</i>图片上传
                        </button>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label"><span style="color: #FF0000">*</span>应用简介</label>
                    <div class="layui-input-block">
                        <input id="appDescription" name="appDescription" style="width: 300px" type="text"
                               lay-verify="title" autocomplete="off" value="" class="layui-input">
                    </div>
                </div>
                <div class="">
                    <label class="layui-form-label"><span style="color: #FF0000">*</span>应用平台</label>
                    <select id="appPlatform" name="appPlatform" data-area=""
                            style="display: inline-block;width: 100px;height: 35px">
                        <option value="安卓">安卓</option>
                        <option value="ios">ios</option>
                    </select>
                </div>
                <button style="float: right;margin-right: 10px" type="button" class="layui-btn" onclick="insConfig()">
                    添加
                </button>
            </form>
        </div>
    </div>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/layui/layui.all.js"></script>
<script type="text/javascript">
    layui.use('upload', function () {
        let upload = layui.upload;
        let $ = layui.$;
        //执行实例
        let uploadInst = upload.render({
            elem: '#upload-button' //绑定元素
            , url: 'uploadimg' //上传接口
            , done: function (res) {
                //上传完毕回调
                if (res.code == 1) {
                    layer.msg(res.msg);
                    let imagePath = res.data.src;
                    $("#pic-individual1").attr("src", imagePath);
                    $("#img_src").attr("value", imagePath);
                } else {
                    layer.msg(res.msg);
                }
            }
            , error: function () {
                //请求异常回调
            }
        });
    });
    layui.use(['form', 'layedit', 'laydate'], function () {
        var form = layui.form
            , layer = layui.layer
            , layedit = layui.layedit
            , laydate = layui.laydate;

        //日期
        laydate.render({
            elem: '#date'
        });
        laydate.render({
            elem: '#date1'
        });

        //创建一个编辑器
        var editIndex = layedit.build('LAY_demo_editor');

        //自定义验证规则
        form.verify({
            title: function (value) {
                if (value.length < 5) {
                    return '标题至少得5个字符啊';
                }
            }
            , pass: [
                /^[\S]{6,12}$/
                , '密码必须6到12位，且不能出现空格'
            ]
            , content: function (value) {
                layedit.sync(editIndex);
            }
        });

        //监听指定开关
        form.on('switch(switchTest)', function (data) {
            layer.msg('开关checked：' + (this.checked ? 'true' : 'false'), {
                offset: '6px'
            });
            layer.tips('温馨提示：请注意开关状态的文字可以随意定义，而不仅仅是ON|OFF', data.othis)
        });

        //监听提交
        form.on('submit(demo1)', function (data) {
            layer.alert(JSON.stringify(data.field), {
                title: '最终的提交信息'
            })
            return false;
        });

        //表单赋值
        layui.$('#LAY-component-form-setval').on('click', function () {
            form.val('example', {
                "username": "贤心" // "name": "value"
                , "password": "123456"
                , "interest": 1
                , "like[write]": true //复选框选中状态
                , "close": true //开关状态
                , "sex": "女"
                , "desc": "我爱 layui"
            });
        });

        //表单取值
        layui.$('#LAY-component-form-getval').on('click', function () {
            var data = form.val('example');
            alert(JSON.stringify(data));
        });

    });
</script>
</body>
</html>
