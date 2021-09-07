<%@ page pageEncoding="utf-8" %>
<%@ include file="taglib.jsp" %>
<c:choose>
    <c:when test="${sessionScope.orgAgentInfo eq 2}">
    </c:when>
    <c:otherwise>
        <div align="center" style="margin-top:20px;margin-bottom:30px;">
            <div id="footer" style="font-size: 14px;"> Copyright &copy; <a
                    href="http://www.jiweitech.com/">厦门集微科技有限公司</a>版权所有
                &nbsp;技术支持：厦门集微技术部 &nbsp;&nbsp;闽ICP备16001831号-3
            </div>
            <div style="width:300px;margin:0 auto; ">
                <a target="_blank" href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=35021102000401"
                   style="display:inline-block;text-decoration:none;height:20px;line-height:20px;"><img
                        src="${pageContext.request.contextPath}/static/images/police.png" alt="police"
                        style="float:left;"/>
                    <p style="float:left;height:20px;line-height:20px;margin: 0 0 0 5px;color: #939393; ">闽公网安备
                        35021102000401号</p></a>
            </div>
                <%--            <p class="text-center" style="margin-bottom: 0">联系电话：0592-6190616-506</p>--%>
                <%--            <p class="text-center" style="margin-bottom: 30px;">E-mail：daxiang_sysPostmaster@jiweitech.com</p>--%>

        </div>
    </c:otherwise>
</c:choose>
