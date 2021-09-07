<%--
  Created by IntelliJ IDEA.
  User: zhuzeyong
  Date: 2021/8/17
  Time: 17:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style type="text/css">
        .tr1 {
            height: 60px;
            background: #dddddd;
        }

        .td1 {
            width: 350px;
            word-break: break-all;
        }

        .p1 {
            font-size: 30px;
            font-weight: bolder;
        }

        table {
            width: 100%;
        }

        table td {
            border-bottom: 2px solid #f3f5f6;
            border-right: 2px solid #f3f5f6;
            line-height: 35px;
        }
    </style>
</head>
<body>
<p class="p1">1.2​ 本机号码校验</p>
<table>
    <tr>
        <td>接口描述</td>
        <td>短信验证码</td>
    </tr>
    <tr>
        <td width="200px;">接口地址</td>
        <td>https://api.capcplus.com/requestCaptchaClient.do</td>
    </tr>
    <tr>
        <td>调用方式</td>
        <td>POST</td>
    </tr>
    <tr>
        <td>Content-Type</td>
        <td>application/x-www-form-urlencoded</td>
    </tr>
    <tr>
        <td>Charset</td>
        <td>UTF-8</td>
    </tr>
</table>
<p class="p1">1.2​ 请求参数说明</p>
<table>
    <tr class="tr1">
        <td>参数</td>
        <td>参数名称</td>
        <td>类型</td>
        <td class="td1">参数说明</td>
        <td>是否必填</td>
    </tr>
    <tr>
        <td>mobile</td>
        <td>用户手机号码</td>
        <td>String</td>
        <td class="td1">多个号码用半角英文逗号隔开,一次最多不能超过1000个</td>
        <td>是</td>
    </tr>
    <tr>
        <td>smsTemplateId</td>
        <td class="td1">下发短信模板id</td>
        <td>String</td>
        <td class="td1">平台通过审核的下发短信模板id值,一次只能填一个</td>
        <td>是</td>
    </tr>
    <tr>
        <td>smsSignatureId</td>
        <td class="td1">下发短信签名id，用于区分签名，不传则使用默认签名</td>
        <td>String</td>
        <td class="td1">平台通过审核的下发短信签名id值，一次只能填一个</td>
        <td>否</td>
    </tr>
    <tr>
        <td>ywId</td>
        <td>业务ID</td>
        <td>String</td>
        <td class="td1">大象提供,可在"大象能力平台-服务管理-服务列表"查询</td>
        <td>是</td>
    </tr>
    <tr>
        <td>authz</td>
        <td>鉴权校验码</td>
        <td>String</td>
        <td class="td1">ywId和业务密码(大象提供,可在"大象能力平台-服务管理-服务列表"查询)拼接后计算MD5校验码</td>
        <td>是</td>
    </tr>
    <tr>
        <td>smsParam</td>
        <td>下发短信变量</td>
        <td>String</td>
        <td class="td1">短信变量用json格式,如{"name":"张三","place":"北京天安门"}用以替换短信模板对应的变量
            合成短信内容的长度不超过1000个汉字(包括1000字),每个英文或阿拉伯字符算1个汉字
        </td>
        <td>否</td>
    </tr>
    <tr>
        <td>msgId</td>
        <td class="td1">用户发送短信自己定义的短信id,用于处理群发状态报告,参数名必须填写,参数值可为空</td>
        <td>String</td>
        <td class="td1">英文和数字的组合总长度不超过50个字符</td>
        <td>是</td>
    </tr>
</table>
<p>
    注意：请求数据采用x-www-form-urlencoded这种POST数据默认编码格式。而不是application/json、multipart/form-data或者text/xml格式。另外charset=UTF-8。</p>

<p class="p1">1.3​ result响应码说明</p>
<table>
    <tr class="tr1">
        <td>返回代码</td>
        <td>代码说明</td>
    </tr>
    <tr>
        <td>0#数字</td>
        <td>提交成功的手机数</td>
    </tr>
    <tr>
        <td>-4</td>
        <td>ywId未填写或者值为空、格式不正确、用户不存在</td>
    </tr>
    <tr>
        <td>-5</td>
        <td>authz未填写或者值为空、用户业务密码错误</td>
    </tr>
    <tr>
        <td>-10</td>
        <td>余额不足</td>
    </tr>
    <tr>
        <td>-11</td>
        <td>用户异常</td>
    </tr>
    <tr>
        <td>-12</td>
        <td>短信内容超过1000字或为空</td>
    </tr>
    <tr>
        <td>-13</td>
        <td>手机号码超过1000个或手机号码为空</td>
    </tr>
    <tr>
        <td>-14</td>
        <td>msg_id错误</td>
    </tr>
    <tr>
        <td>-18</td>
        <td>访问ip错误</td>
    </tr>
    <tr>
        <td>-19</td>
        <td>用户业务关闭</td>
    </tr>
    <tr>
        <td>-23</td>
        <td>模板变量未填写或者值为空、格式不正确</td>
    </tr>
    <tr>
        <td>-24</td>
        <td>模板数量不对</td>
    </tr>
    <tr>
        <td>-25</td>
        <td>模板io异常</td>
    </tr>
    <tr>
        <td>-26</td>
        <td>模板变量不匹配</td>
    </tr>
    <tr>
        <td>-27</td>
        <td>签名审核没通过</td>
    </tr>
    <tr>
        <td>-28</td>
        <td>模板id未填写或者为空
            模板id没有对应的模板或者对应模板内容空
            模板id对应模板的状态是待审核或者审核拒绝
        </td>
    </tr>
    <tr>
        <td>30004</td>
        <td>无效手机号码，如手机号码与通道代码正则不匹配</td>
    </tr>
    <tr>
        <td>30005</td>
        <td>手机号码无法和业务匹配</td>
    </tr>
    <tr>
        <td>404</td>
        <td>访问地址不存在</td>
    </tr>
    <tr>
        <td>206</td>
        <td>系统异常</td>
    </tr>
</table>
<p class="p1">2.1​ 接口描述</p>
<table>
    <tr class="tr1">
        <td colspan="2">主动获取状态报告</td>
    </tr>
    <tr>
        <td>接口描述</td>
        <td>主动获取状态报告</td>
    </tr>
    <tr>
        <td width="200px;">接口地址</td>
        <td>https://api.capcplus.com/requestCaptchaReportClient.do</td>
    </tr>
    <tr>
        <td>调用方式</td>
        <td>POST</td>
    </tr>
    <tr>
        <td>Content-Type</td>
        <td>application/x-www-form-urlencoded</td>
    </tr>
    <tr>
        <td>Charset</td>
        <td>UTF-8</td>
    </tr>
</table>
<p class="p1">2.2​ 请求参数说明</p>
<table>
    <tr class="tr1">
        <td>参数</td>
        <td>参数名称</td>
        <td>类型</td>
        <td class="td1">参数说明</td>
        <td>是否必填</td>
    </tr>
    <tr>
        <td>ywId</td>
        <td>业务ID</td>
        <td>String</td>
        <td class="td1">大象提供,可在"大象能力平台-服务管理-服务列表"查询</td>
        <td>是</td>
    </tr>
    <tr>
        <td>authz</td>
        <td>鉴权校验码</td>
        <td>String</td>
        <td class="td1">ywId和业务密码(大象提供,可在"大象能力平台-服务管理-服务列表"查询)拼接后计算MD5校验码</td>
        <td>是</td>
    </tr>
</table>
<p>注意：请求数据采用x-www-form-urlencoded这种POST数据默认编码格式。而不是application/json、multipart/form-data或者text/xml格式。另外charset=UTF-8。</p>
<p class="p1"> 2.3​ 返回参数说明</p>
<table>
    <tr class="tr1">
        <td>返回代码</td>
        <td>代码说明</td>
    </tr>
    <tr>
        <td>0</td>
        <td>暂时没有数据</td>
    </tr>
    <tr>
        <td>404</td>
        <td>访问地址不存在</td>
    </tr>
    <tr>
        <td>-4</td>
        <td>ywId未填写或者值为空,格式不正确,用户不存在</td>
    </tr>
    <tr>
        <td>-5</td>
        <td>authz未填写或者值为空,用户业务密码错误</td>
    </tr>
    <tr>
        <td>-11</td>
        <td>用户异常</td>
    </tr>
    <tr>
        <td>-18</td>
        <td>不支持客户主动获取</td>
    </tr>
    <tr>
        <td>-19</td>
        <td>用户访问超过我方限制频率(间隔200毫秒访问一次)</td>
    </tr>
    <tr>
        <td>108</td>
        <td>指定访问IP错误</td>
    </tr>
    <tr>
        <td>206</td>
        <td>系统异常
            Xml格式字符串
            有待推送的状态报告,并且状态报告以xml格式的字符串返回
        </td>
    </tr>
</table>
<p class="p1">3.1​ 接口描述</p>
<table>
    <tr class="tr1">
        <td colspan="2">主动获取上行信息</td>
    </tr>
    <tr>
        <td>接口描述</td>
        <td>主动获取上行信息</td>
    </tr>
    <tr>
        <td>接口地址</td>
        <td>https://api.capcplus.com/requestCaptchaDeliverMsgClient.do</td>
    </tr>
    <tr>
        <td>调用方式</td>
        <td>POST</td>
    </tr>
    <tr>
        <td>Content-Type</td>
        <td>application/x-www-form-urlencoded</td>
    </tr>
    <tr>
        <td>Charset</td>
        <td>UTF-8</td>
    </tr>
</table>
<p class="p1"> 3.2​ 请求参数说明</p>
<table>
    <tr class="tr1">
        <td>参数</td>
        <td>参数名称</td>
        <td>类型</td>
        <td class="td1">参数说明</td>
        <td>是否必填</td>
    </tr>
    <tr>
        <td>ywId</td>
        <td>业务ID</td>
        <td>String</td>
        <td class="td1">大象提供,可在"大象能力平台-服务管理-服务列表"查询</td>
        <td>是</td>
    </tr>
    <tr>
        <td>authz</td>
        <td>鉴权校验码</td>
        <td>String</td>
        <td class="td1">ywId和业务密码(大象提供,可在"大象能力平台-服务管理-服务列表"查询)拼接后计算MD5校验码</td>
        <td>是</td>
    </tr>
</table>
<p class="p1">3.3​ result响应码说明</p>
<table>
    <tr class="tr1">
        <td>返回代码</td>
        <td>代码说明</td>
    </tr>
    <tr>
        <td>0</td>
        <td>暂时没有待推送的数据</td>
    </tr>
    <tr>
        <td>404</td>
        <td>访问地址不存在</td>
    </tr>
    <tr>
        <td>-4</td>
        <td>ywId未填写或者值为空,格式不正确,用户不存在</td>
    </tr>
    <tr>
        <td>-5</td>
        <td>authz未填写或者值为空,用户业务密码错误</td>
    </tr>
    <tr>
        <td>-11</td>
        <td>用户异常</td>
    </tr>
    <tr>
        <td>-18</td>
        <td>不支持客户主动获取</td>
    </tr>
    <tr>
        <td>-19</td>
        <td>用户访问超过我方限制频率(间隔200毫秒访问一次)</td>
    </tr>
    <tr>
        <td>108</td>
        <td>指定访问IP错误</td>
    </tr>
    <tr>
        <td>206</td>
        <td>系统异常
            Xml格式字符串
            有待推送的上行信息,并且上行信息以xml格式的字符串返回。一条上行xml字符串可包含10个节点
        </td>
    </tr>
</table>
</body>
</html>
