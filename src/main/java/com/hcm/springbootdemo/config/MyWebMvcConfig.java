package com.hcm.springbootdemo.config;

import com.hcm.springbootdemo.interceptor.LoginHandlerInterceptor;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.*;

@Configuration
public class MyWebMvcConfig implements WebMvcConfigurer {

    //配置视图跳转
    @Override
    public void addViewControllers(ViewControllerRegistry registry) {
        registry.addViewController("/").setViewName("/jsp/login");
    }

    //将登录拦截器配置到容器中
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(new LoginHandlerInterceptor())
                .addPathPatterns("/**")
                .excludePathPatterns("/login/*", "/index/*", "/jsp/*.jsp", "/**/*.css", "/**/*.js", "/**/*.woff",
                        "/**/*.ttf", "/**/*.jpg", "/**/*.png");
    }


}