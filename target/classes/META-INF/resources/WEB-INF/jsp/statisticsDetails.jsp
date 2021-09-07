<%@ page pageEncoding="UTF-8" %>
<%@ include file="taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="${pageContext.request.contextPath}/static/css/icons.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" rel="stylesheet"/>
    <title></title>
</head>
<body>
<table class="table table-hover">
    <tbody>
    <tr>
        <td width="20%" style="text-align: right;">&nbsp;&nbsp;使用总量：</td>
        <td>${idRecord.apiTotal}次</td>
    </tr>
    <tr>
        <td width="20%" style="text-align: right;">&nbsp;&nbsp;使用成功量：</td>
        <td>${idRecord.successTimes}次</td>
    </tr>
    <tr>
        <td width="20%" style="text-align: right;">&nbsp;&nbsp;未知使用量：</td>
        <td>${idRecord.unknownTimes}次</td>
    </tr>
    <tr>
        <td width="20%" style="text-align: right;">&nbsp;&nbsp;失败使用量：</td>
        <td>${idRecord.failTimes}次</td>
    </tr>
    <tr>
        <td width="20%" style="text-align: right;">&nbsp;&nbsp;总花费：</td>
        <td>${idRecord.totalCost}元</td>
    </tr>
    <tr>
        <td width="20%" style="text-align: right;">&nbsp;&nbsp;测试费用：</td>
        <td>${idRecord.testCost}元</td>
    </tr>
    <tr>
        <td width="20%" style="text-align: right;">&nbsp;&nbsp;返现费用：</td>
        <td>${idRecord.backCost}元</td>
    </tr>
    <tr>
        <td width="20%" style="text-align: right;">&nbsp;&nbsp;实际费用：</td>
        <td>${idRecord.actualCost}元</td>
    </tr>
    <tr>
        <td width="20%" style="text-align: right;">&nbsp;&nbsp;结算总价：</td>
        <td>${idRecord.settleTotalPrice}元</td>
    </tr>
    <tr>
        <td width="20%" style="text-align: right;">&nbsp;&nbsp;结算返还：</td>
        <td>${idRecord.settleBackPrice}元</td>
    </tr>
    <tr>
    </tr>
    </tbody>
</table>
</body>
</html>