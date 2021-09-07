package com.hcm.springbootdemo.interceptor;

import org.springframework.stereotype.Component;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;

@Component        //声明为springBoot的一个组件，但是并不能起作用，需要在springBoot的配置类中注入
public class TimeInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        System.out.println("TimeInterceptor 进入 Controller 某个方法之前");
        System.out.println("Controller Name:" + ((HandlerMethod) handler).getBean().getClass().getName());
        System.out.println("Controller Method Name:" + ((HandlerMethod) handler).getMethod().getName());
        request.setAttribute("startTime", new Date().getTime());

        /**
         * boolean 值： 确定了拦截器其余两方法是否执行
         */
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
                           ModelAndView modelAndView) throws Exception {
        System.out.println("TimeInterceptor 运行 Controller 某个方法时，方法抛出异常将不进入此方法");
        long start = (long) request.getAttribute("startTime");
        System.out.println("TimeInterceptor 处理时长为：" + (new Date().getTime() - start));

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
            throws Exception {
        System.out.println("TimeInterceptor 完成 Controller 某个方法");
        long start = (long) request.getAttribute("startTime");
        System.out.println("TimeInterceptor 处理时长为：" + (new Date().getTime() - start));

    }

}
