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
        <td width="15%" style="text-align: right;">&nbsp;&nbsp;发信人：</td>
        <td>${message.createdBy}</td>
    </tr>
    <tr>
        <td width="15%" style="text-align: right;">&nbsp;&nbsp;收信人：</td>
        <td>${sessionScope.customerInfo.customerName}</td>
    </tr>
    <tr>
        <td width="15%" style="text-align: right;">&nbsp;&nbsp;标题：</td>
        <td>${message.msgTitle}</td>
    </tr>
    <tr>
        <td width="15%" style="text-align: right;">&nbsp;&nbsp;发送时间：</td>
        <td>${message.insertTime}</td>
    </tr>
    <tr>
        <td width="15%" style="text-align: right;">&nbsp;&nbsp;内容：</td>
        <td><span>${message.msg}</span></td>
    </tr>
    <tr>
    </tr>
    </tbody>
</table>
</body>
</html>