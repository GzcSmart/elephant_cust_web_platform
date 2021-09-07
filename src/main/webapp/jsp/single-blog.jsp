<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <title>大象能力平台</title>
    <meta charset="UTF-8">
    <meta name="description" content="Guru Portfolio Template">
    <meta name="keywords" content="personal, portfolio">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Favicon -->
    <link href="../static/images/favicon.ico" rel="shortcut icon"/>

    <!-- Stylesheets -->
    <link rel="stylesheet" href="../static/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="../static/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="../static/css/owl.carousel.css"/>
    <link rel="stylesheet" href="../static/css/magnific-popup.css"/>
    <link rel="stylesheet" href="../static/css/reset.css"/>
    <link rel="stylesheet" href="../static/css/style.css"/>


    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

    <!-- ==== MODERNIZR ==== -->
    <script src="js/modernizr.js"></script>
    <script src="../static/js/jquery-2.1.4.min.js"></script>
    <script src="../static/layui/layui.all.js"></script>
    <script type="text/javascript">
        function directToSort(type, sortName, url) {
            var screenHeight = document.documentElement.clientHeight;
            var screenWidth = document.documentElement.clientWidth;
            var width;
            var height;
            if (screenWidth < 768 && screenWidth < 1024) {
                width = screenWidth * 0.9;
                height = screenHeight * 0.9;
            } else {
                width = screenWidth * 0.7;
                height = screenHeight * 0.8;
            }
            layer.open({
                title: '<b><i class="st-book2"/>' + sortName + '</b>',
                type: 2,
                area: [width + 'px', height + 'px'],
                fixed: false,
                resize: true,
                scrollbar: false,
                shadeClose: true,
                content: url + "/index/showSort?type=" + type + "&index=0",
                moveOut: true,
                anim: -1,
                btn: ['关闭'],
                yes: function (index, layero) {
                    layer.closeAll();
                }
            });
        }

        function faq(type, sortName, url) {
            var screenHeight = document.documentElement.clientHeight;
            var screenWidth = document.documentElement.clientWidth;
            var width;
            var height;
            if (screenWidth < 768 && screenWidth < 1024) {
                width = screenWidth * 0.9;
                height = screenHeight * 0.9;
            } else {
                width = screenWidth * 0.7;
                height = screenHeight * 0.8;
            }
            layer.open({
                title: '<b><i class="st-book2"/>' + sortName + '</b>',
                type: 2,
                area: [width + 'px', height + 'px'],
                fixed: false,
                resize: true,
                scrollbar: false,
                shadeClose: true,
                content: url + "/index/showSort2?type=" + type + "&index=0",
                moveOut: true,
                anim: -1,
                btn: ['关闭'],
                yes: function (index, layero) {
                    layer.closeAll();
                }
            });
        }
    </script>
</head>
<body>
<!-- ==== Preloader Section Start ==== -->
<div id="preloader">
    <div class="pre-container">
        <div class="spinner">
            <div class="double-bounce1"></div>
            <div class="double-bounce2"></div>
        </div>
    </div>
</div>
<!-- ==== Preloader Section End ==== -->

<!-- ==== Navigation Start ==== -->
<nav class="subpage-nav">
    <div class="row">
        <div class="container">
            <div class="logo">
                <img src="../static/images/logo1.png" alt="" style="width: 180px;"><!-- Logo -->
            </div>
            <div class="mobile-bar"><span></span></div>
            <ul class="nav-menu">
                <li><a href="index.jsp">首页</a></li>
                <li><a href="#about">产品特性</a></li>
                <li><a href="#portfolio">产品优势</a></li>
                <li><a href="#blog">接口文档</a></li>
                <li><a href="#blog2">常见FAQ</a></li>
                <li>
						<span>
                        <c:if test="${sessionScope.customerInfo != null}">
				           <a href="/toadmin">
								   ${sessionScope.customerInfo.customerName}
							<img src="${sessionScope.customerInfo.headImgUrl}" class="img-circle" style="height: 50px"
                                 alt="Avatar">
						   </a>
                        </c:if>
                        <c:if test="${sessionScope.customerInfo == null}">
                            <a href="/login/tologin" id="login">登录</a>
                        </c:if>
						</span>
                    <i class="icon-submenu lnr lnr-chevron-down"></i>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- ==== About Section Start ==== -->
<section class="about-section spad" id="about">
    <div class="container">
        <div class="about-text" style="position: relative;margin-bottom: 100px;">
            <h2 style="font-size: 30px;position: absolute;left: 50%;transform: translate(-50%,0);">产品特性</h2>
        </div>
        <div class="col-md-6 col-sm-12 about-image">
            <img src="../static/images/product1.jpg" class="img-responsive" alt="">
        </div>
        <div class="col-md-6 col-sm-12">
            <div class="skills"><!-- Skills -->
                <div class="single-progress-item" id="item1">
                    <p style="height: 50px;line-height: 50px;font-size: 20px;">一键登录三网合一</p>
                    <p style="margin-bottom: 30px;">
                        “一键授权，便捷秒登”。应用客户端中植入运营商认证的集成SDK后，在注册或登录阶段，用户同意授权即可完成本机号码免密登录，可以说是一种APP登录方式的革新，可以真正体验到“秒级登录”的快感。</p>
                </div>
                <div class="single-progress-item" id="item2">
                    <p style="height: 50px;line-height: 50px;font-size: 20px;">相比短信更便捷与安全</p>
                    <p style="margin-bottom: 30px;">
                        操作简单，助力注册拉新/登录留存，替代目前行业普遍采用短信验证码的方式，短验存在等待时间长、步骤较多、文本泄露等问题，使用一键登录极大提升用户体验。</p>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- ==== Single Blog Section End ==== -->


<!-- ==== Testinonial Section Start ==== -->
<section class="testinonial-section spad" id="portfolio">
    <div class="container">
        <div class="section-title">
            <h2 style="font-size: 30px;">产品优势</h2>
        </div>
        <div class="testinonial-carousel" style="display: flex;justify-content: center;margin-bottom: 50px">
            <div class="brand-item" style="text-align: center;margin-right: 30px">
                <img src="../static/images/quicksend.png" alt="" style="height: 50%;width: 50%;margin-left: 45px">
                <p>快速验证</p>
                <p>优质通道支持确保快速验证</p>
            </div>
            <div class="brand-item" style="text-align: center;margin-right: 30px">
                <img src="../static/images/selfcontrol.png" alt="" style="height: 50%;width: 50%;margin-left: 45px">
                <p>免密快捷</p>
                <p>助力用户留存，本机号码校验免密更快捷</p>
            </div>
            <div class="brand-item" style="text-align: center;">
                <img src="../static/images/highcrash.png" alt="" style="height: 50%;width: 50%;margin-left: 45px">
                <p>高效对接</p>
                <p>支持IOS\安卓三网合一SDK开发工具快速对接</p>
            </div>
        </div>
        <div class="section-title" id="blog">
            <h2 style="font-size: 30px;">接口文档</h2>
        </div>
        <div style="display: flex;justify-content: center">
            <div class="grid-item col-md-4 col-sm-4 col-xs-12 ill">
                <div class="work-item">
                    <img src="../static/images/category-10000001.jpg" alt="">
                    <div class="work-inner">
                        <a class="work-zoom" href="javascript:void(0);"
                           onclick="directToSort('10000006','统一认证类','${pageContext.request.contextPath}')"><i
                                class="fa fa-search"></i></a>
                    </div>
                </div>
                <div class="blog-item-text" style="background-color: aliceblue;">
                    <p>统一认证</p>
                </div>
            </div>
        </div>
        <div class="section-title" style="margin-top: 50px" id="blog2">
            <h2 style="font-size: 30px;">常见FAQ</h2>
        </div>
        <div style="display: flex;justify-content: center">
            <div class="grid-item col-md-4 col-sm-4 col-xs-12 ill">
                <div class="work-item">
                    <img src="../static/images/serverAgreement.png" alt="">
                    <div class="work-inner">
                        <a class="work-zoom" href="javascript:void(0);"
                           onclick="faq('10000006','faq','${pageContext.request.contextPath}')"><i
                                class="fa fa-search"></i></a>
                    </div>
                </div>
                <div class="blog-item-text" style="background-color: aliceblue;">
                    <p>大象能力平台通信技术服务协议</p>
                </div>
            </div>
        </div>
    </div>
</section>


<!-- ==== Footer Start ==== -->
<footer>
    <div class="container">
        <div class="social">
            <a href=""><i class="fa fa-facebook"></i></a>
            <a href=""><i class="fa fa-twitter"></i></a>
            <a href=""><i class="fa fa-vimeo"></i></a>
            <a href=""><i class="fa fa-twitter"></i></a>
            <a href="#"><i class="fa fa-behance"></i></a>
            <a href="#"><i class="fa fa-dribbble"></i></a>
        </div>
        <p>Copyright © 2017 Guru, All rights Reserved.<br>Created by BootExpress</p>
    </div>
</footer>
<!-- ==== Footer End ==== -->


<!-- ==== Jquery and other scripts ==== -->
<script src="../static/js/jquery-2.1.4.min.js"></script>
<script src="../static/js/jquery.nav.js"></script>
<script src="../static/js/imagesloaded.pkgd.min.js"></script>
<script src="../static/js/isotope.pkgd.min.js"></script>
<script src="../static/js/owl.carousel.min.js"></script>
<script src="../static/js/magnific-popup.min.js"></script>
<script src="../static/js/main.js"></script>
</body>
</html>
