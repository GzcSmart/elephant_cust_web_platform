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
    <script src="../static/js/jquery-2.1.4.min.js"></script>
    <script src="../static/layui/layui.all.js"></script>
    <script type="text/javascript">
        $(function () {
            $("#item1").bind({
                mouseenter: function () {
                    $("#img1").attr('src', '../static/images/work1_1.png');
                },
                mouseleave: function () {
                    $("#img1").attr('src', '../static/images/work1.png');
                }
            })
            $("#item2").bind({
                mouseenter: function () {
                    $("#img2").attr('src', '../static/images/work2_2.png');
                },
                mouseleave: function () {
                    $("#img2").attr('src', '../static/images/work2.png');
                }
            })
            $("#item3").bind({
                mouseenter: function () {
                    $("#img3").attr('src', '../static/images/work3_3.png');
                },
                mouseleave: function () {
                    $("#img3").attr('src', '../static/images/work3.png');
                }
            })
            $("#item4").bind({
                mouseenter: function () {
                    $("#img4").attr('src', '../static/images/work4_4.png');
                },
                mouseleave: function () {
                    $("#img4").attr('src', '../static/images/work4.png');
                }
            })
        })

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
    </script>
</head>
<style>
    .img-circle {
        height: 50px;
    }
</style>
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
<nav>
    <div class="row">
        <div class="container">
            <div class="logo">
                <img src="../static/images/logo1.png" alt="" style="width: 180px;"><!-- Logo -->
            </div>
            <div class="mobile-bar"><span></span></div>
            <ul class="nav-menu">
                <li><a href="#home">首页</a></li>
                <li><a href="#about">应用场景</a></li>
                <li><a href="#portfolio">产品服务</a></li>
                <li><a href="#blog">接口API</a></li>
                <li>
						<span>
                        <c:if test="${sessionScope.customerInfo != null}">
				           <a href="/toadmin">
								   ${sessionScope.customerInfo.customerName}
							<img src="${sessionScope.customerInfo.headImgUrl}" class="img-circle" alt="Avatar">
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
<!-- ==== Navigation End ==== -->


<!-- ==== Intro Section Start ==== -->
<section class="intro-section" id="home">
    <div class="intro-content">
        <h1>大象能力平台</h1>
    </div>
    <a href="#about" class="down">
        <i class="fa fa-angle-down"></i>
    </a>
</section>
<!-- ==== Intro Section End ==== -->


<!-- ==== About Section Start ==== -->
<section class="about-section spad" id="about">
    <div class="container">
        <div class="col-md-6 col-sm-12 about-image">
            <img src="../static/images/banner1-img.png" class="img-responsive" alt="">
        </div>
        <div class="col-md-6 col-sm-12">
            <div class="about-text">
                <h3 style="font-size: 30px;">应用场景</h3>
            </div>
            <div class="skills"><!-- Skills -->
                <div class="single-progress-item" id="item1">
                    <img src="../static/images/work1.png" style="float: left;" id="img1"/>
                    <p style="height: 50px;line-height: 50px;">&nbsp;用户注册</p>
                    <p style="margin-bottom: 30px;">
                        一键登录：用户注册时，一键登录用于验证用户手机号码是否本机，杜绝恶意注册，确保用户的真实性，相比短信验证码更迅速便捷，确保用户不会轻易流失。</p>
                </div>
                <div class="single-progress-item" id="item2">
                    <img src="../static/images/work2.png" style="float: left;" id="img2"/>
                    <p style="height: 50px;line-height: 50px;">&nbsp;支付认证</p>
                    <p style="margin-bottom: 30px;">一键登录：支付环节，需要验证号码是否对应本机，确保资金安全，如确认支付、快捷支付、闪付等，可以使用一键登录快捷验证。</p>
                </div>
                <div class="single-progress-item" id="item3">
                    <img src="../static/images/work3.png" style="float: left;" id="img3"/>
                    <p style="height: 50px;line-height: 50px;">&nbsp;用户快速登录</p>
                    <p style="margin-bottom: 30px;">本机号码校验：通过用户注册时的预留手机号，通过本机号码校验，确认用户身份，完成登录，也可以用于密码重置。</p>
                </div>
                <div class="single-progress-item" id="item4">
                    <img src="../static/images/work4.png" style="float: left;" id="img4"/>
                    <p style="height: 50px;line-height: 50px;">&nbsp;账号认证</p>
                    <p>一键登录：用户账号在使用手机号码异常登录网站或者APP时，通过一键登录及时号码认证，制止账号异常登录，进行安全防护。</p>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- ==== About Section End ==== -->


<!-- ==== Services Section Start ==== -->
<section class="services-section spad">
    <div class="container">
        <!-- Services Items -->
        <div class="row">
            <!-- item -->
            <div class="col-md-3 col-sm-6 service-item">
                <div class="icon">
                    <i class="fa fa-magic"></i>
                    <span></span>
                </div>
                <h4>GRPHICE</h4>
                <p>We are gives you best graphic and website services. </p>
            </div>
            <!-- item -->
            <div class="col-md-3 col-sm-6 service-item">
                <div class="icon">
                    <i class="fa fa-leaf"></i>
                    <span></span>
                </div>
                <h4>BRANDING</h4>
                <p>We are gives you best graphic and website services.</p>
            </div>
            <!-- item -->
            <div class="col-md-3 col-sm-6 service-item">
                <div class="icon">
                    <i class="fa fa-camera"></i>
                    <span></span>
                </div>
                <h4>PHOTOGRAPHY</h4>
                <p>We are gives you best graphic and website services.</p>
            </div>
            <!-- item -->
            <div class="col-md-3 col-sm-6 service-item">
                <div class="icon">
                    <i class="fa fa-cog"></i>
                    <span></span>
                </div>
                <h4>CUSTOMIZATION</h4>
                <p>We are gives you best graphic and website services.</p>
            </div>
        </div>
    </div>
</section>
<!-- ==== Services Section End ==== -->


<!-- ==== Portfolios Section Start ==== -->
<section class="portfolios-section spad" id="portfolio">
    <div class="container">
        <div class="section-title">
            <h2 style="font-size: 30px;">产品与服务</h2>
            <p>Out believe has request not how comfort evident. Up delight cousins we feeling<br>minutes. Genius has
                looked end piqued spring.</p>
        </div>
        <ul class="portfolio-filter">
            <li class="filter" data-filter="*">ALL</li>
            <li class="filter" data-filter=".ill">ILLUSTRATIONS</li>
            <li class="filter" data-filter=".brand">BRANDING</li>
            <li class="filter" data-filter=".fs">FASHION</li>
        </ul>
        <!-- Portfolio items -->
        <div class="row portfolio_container">
            <!-- item -->
            <div class="grid-item col-md-4 col-sm-4 col-xs-12 ill">
                <div class="work-item">
                    <img src="../static/images/product6.jpg" alt="">
                    <div class="work-inner">
                        <a class="work-zoom" href="#workID-1"><i class="fa fa-search"></i></a>
                    </div>
                </div>
                <div id="workID-1" class="mfp-hide work-popup">
                    <img src="../static/images/product6.jpg" alt="">
                    <div class="work-popup-content">
                        <h3>统一认证</h3>
                        <p>In media, which includes textual, audio, and visual content, free licensing schemes such as
                            some of the licenses made by Creative Commons have allowed for the dissemination of works
                            under a clear set of legal permissions.</p>
                    </div>
                </div>
            </div>
            <div class="grid-item col-md-4 col-sm-4 col-xs-12 ill">
                <h3>统一认证</h3>
                <p style="color: #000000;margin-top: 20px;">● 一键登录，一个按钮替代短信验证多步骤</p>
                <p style="color: #000000;">● 登录注册，验证更安全</p>
                <p style="color: #000000;">● 极速认证，操作更便捷</p>
                <p style="color: #000000;">● 优质资源确保高效、安全</p>
                <div style="height: 20px;"></div>
                <a href="single-blog.jsp" class="site-button">查看详情</a>
            </div>
        </div>
    </div>
</section>
<!-- ==== Portfolios Section End ==== -->


<!-- ==== Testinonial Section Start ==== -->
<section class="testinonial-section spad">
    <div class="container">
        <div class="section-title">
            <h2>CLINTS</h2>
            <p>Out believe has request not how comfort evident. Up delight cousins we feeling<br>minutes. Genius has
                looked end piqued spring.</p>
        </div>
        <div class="testinonial-carousel">
            <div class="brand-item">
                <a href="">
                    <img src="../static/images/brand/1.svg" alt="">
                </a>
            </div>
            <div class="brand-item">
                <a href="">
                    <img src="../static/images/brand/2.svg" alt="">
                </a>
            </div>
            <div class="brand-item">
                <a href="">
                    <img src="../static/images/brand/3.svg" alt="">
                </a>
            </div>
            <div class="brand-item">
                <a href="">
                    <img src="../static/images/brand/4.svg" alt="">
                </a>
            </div>
            <div class="brand-item">
                <a href="">
                    <img src="../static/images/brand/5.svg" alt="">
                </a>
            </div>
            <div class="brand-item">
                <a href="">
                    <img src="../static/images/brand/6.svg" alt="">
                </a>
            </div>
            <div class="brand-item">
                <a href="">
                    <img src="../static/images/brand/7.svg" alt="">
                </a>
            </div>
            <div class="brand-item">
                <a href="">
                    <img src="../static/images/brand/8.svg" alt="">
                </a>
            </div>
        </div>
    </div>
</section>
<!-- ==== Testinonial Section End ==== -->


<!-- ==== Blogs Section Start ==== -->
<section class="blog-section spad" id="blog">
    <div class="container">
        <div class="section-title">
            <h2 style="font-size: 30px;">接口API</h2>
            <p style="font-size: 20px;">大象能力平台主要产品服务API说明</p>
        </div>
        <div class="filters text-center">
            <ul class="nav nav-pills text-center">
                <li class="active"><a href="javacript:void(0);" data-filter="*">全部</a></li>
                <li><a href="javacript:void(0);" data-filter=".site-building">统一认证类</a></li>
            </ul>
        </div>
        <div class="row" style="margin-top: 30px;">
            <!-- single-post -->
            <div class="col-md-4">
            </div>
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
            <!-- single-post -->
            <div class="col-md-4">
            </div>
        </div>
    </div>
</section>
<!-- ==== Blogs Section End ==== -->

<!-- ==== Contact Section End ==== -->


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
