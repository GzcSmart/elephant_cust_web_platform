<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="taglib.jsp" %>
<html>
<head>
    <script src="${pageContext.request.contextPath}/static/js/user-password.js"></script>
    <script src="${pageContext.request.contextPath}/static/layui/layui.all.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/jquery-2.1.4.min.js"></script>
    <!-- NAVBAR -->
    <nav class="navbar navbar-default navbar-fixed-top">
        <div class="brand">
            <a href="jsp/index.jsp"><img src="static/images/logo1.png" width="139px" alt="Klorofil Logo"
                                         class="img-responsive logo"></a>
        </div>
        <div class="container-fluid">
            <div class="navbar-btn">
                <button type="button" class="btn-toggle-fullwidth"><i class="lnr lnr-arrow-left-circle"></i></button>
            </div>
            <%--            <div class="navbar-btn navbar-btn-right">--%>
            <%--                <a class="btn btn-success update-pro" href="#downloads/klorofil-pro-bootstrap-admin-dashboard-template/?utm_source=klorofil&utm_medium=template&utm_campaign=KlorofilPro" title="Upgrade to Pro" target="_blank"><i class="fa fa-rocket"></i> <span>UPGRADE TO PRO</span></a>--%>
            <%--            </div>--%>
            <div id="navbar-menu">
                <ul class="nav navbar-nav navbar-right">
                    <li class="dropdown">
                        <a href="tomessage">
                            <i class="lnr lnr-alarm"></i>
                        </a>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><img
                                src="${sessionScope.customerInfo.headImgUrl}" class="img-circle" alt="Avatar"> <span>
              <c:if test="${sessionScope.customerInfo != null}">
                  ${sessionScope.customerInfo.customerName}
              </c:if>
              <c:if test="${sessionScope.customerInfo == null}">
                  <a href="/login/tologin" id="login">登录</a>
              </c:if>
            </span><i class="icon-submenu lnr lnr-chevron-down"></i>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="javaScript:void(0)" onclick="openCustomer();"><i class="lnr lnr-user"></i>
                                <span>个人资料</span></a></li>
                            <li><a href="/downloadFile?type=0"><i class="lnr lnr-download"></i> <span>用户手册下载</span></a>
                            </li>
                            <li><a href="/login/logOut"><i class="lnr lnr-exit"></i> <span>退出</span></a></li>
                        </ul>
                    </li>
                    <!-- <li>
                        <a class="update-pro" href="#downloads/klorofil-pro-bootstrap-admin-dashboard-template/?utm_source=klorofil&utm_medium=template&utm_campaign=KlorofilPro" title="Upgrade to Pro" target="_blank"><i class="fa fa-rocket"></i> <span>UPGRADE TO PRO</span></a>
                    </li> -->
                </ul>
            </div>
        </div>
    </nav>
</head>
<body>

</body>
</html>
