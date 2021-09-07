<%@ page pageEncoding="UTF-8" %>
<%@ include file="taglib.jsp" %>
<div id="sidebar-nav" class="sidebar">
    <div class="sidebar-scroll">
        <nav>
            <ul class="nav">
                <li><a href="${pageContext.request.contextPath }/go2UserCenter" class="active"><i
                        class="lnr lnr-home"></i> <span>用户中心</span></a></li>
                <li>
                    <a href="#subPages" data-toggle="collapse" class="collapsed"><i
                            class="lnr lnr-text-align-justify"></i> <span>服务管理</span> <i
                            class="icon-submenu lnr lnr-chevron-left"></i></a>
                    <div id="subPages" class="collapse ">
                        <ul class="nav">
                            <li><a href="getConditionYw" class="">服务列表</a></li>
                            <li><a href="#subPages1" data-toggle="collapse" class="collapsed"><i
                                    class="lnr lnr-cog"></i> <span>服务配置</span> <i
                                    class="icon-submenu lnr lnr-chevron-left"></i></a>
                                <div id="subPages1" class="collapse ">
                                    <ul class="nav">
                                        <li><a href="cverification" class="">统一认证</a></li>
                                    </ul>
                                </div>
                            </li>
                        </ul>
                    </div>
                </li>
                <li><a href="tostatistics" class=""><i class="lnr lnr-chart-bars"></i> <span>数据统计</span></a></li>
                <li>
                    <a href="#subPages3" data-toggle="collapse" class="collapsed"><i class="lnr lnr-database"></i>
                        <span>数据详情</span> <i class="icon-submenu lnr lnr-chevron-left"></i></a>
                    <div id="subPages3" class="collapse ">
                        <ul class="nav">
                            <li><a href="ywDetail" class="">数据调用详情</a></li>
                        </ul>
                    </div>
                </li>
                <li>
                    <a href="#subPages4" data-toggle="collapse" class="collapsed"><i class="lnr lnr-calendar-full"></i>
                        <span>发票管理</span> <i class="icon-submenu lnr lnr-chevron-left"></i></a>
                    <div id="subPages4" class="collapse ">
                        <ul class="nav">
                            <li><a href="go2Update" class="">开票信息</a></li>
                        </ul>
                        <ul class="nav">
                            <li><a href="goAddress" class="">地址管理</a></li>
                        </ul>
                        <ul class="nav">
                            <li><a href="toinvoiceApply" class="">发票申请</a></li>
                        </ul>
                        <ul class="nav">
                            <li><a href="selInvoiceApply" class="">发票记录</a></li>
                        </ul>
                    </div>
                </li>
                <li><a href="tomessage" class=""><i class="lnr lnr-alarm"></i> <span>消息中心</span></a></li>
            </ul>
        </nav>
    </div>
</div>