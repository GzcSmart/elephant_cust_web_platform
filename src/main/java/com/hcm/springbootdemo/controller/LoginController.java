package com.hcm.springbootdemo.controller;

import com.hcm.springbootdemo.entity.Result;
import com.hcm.springbootdemo.entity.CustomerInfo;
import com.hcm.springbootdemo.service.LoginService;
import com.hcm.springbootdemo.utils.CookieUtils;
import com.hcm.springbootdemo.utils.PhoneCode;
import org.apache.commons.lang.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Objects;


@Controller
@RequestMapping("/login")
public class LoginController {

    @Autowired
    private LoginService loginService;

    public static final String CAPTCHA_KEY = "session_captcha";

    @RequestMapping("tologin")
    public String tologin() {
        return "jsp/login";
    }

    @RequestMapping("captcha")
    public void captcha(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {
        response.setHeader("Pragma", "No-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", 0);
        response.setContentType("image/jpeg");

        // 生成随机字串
        String verifyCode = VerifyCodeUtils.generateVerifyCode(4);

        // 生成图片
        int w = 135, h = 40;
        VerifyCodeUtils.outputImage(w, h, response.getOutputStream(), verifyCode);

        // 将验证码存储在session以便登录时校验
        session.setAttribute(CAPTCHA_KEY, verifyCode.toLowerCase());
    }

    @RequestMapping(value = "login", method = RequestMethod.POST)
    @ResponseBody
    public Result login(HttpSession session, HttpServletRequest request, HttpServletResponse response, Model model) throws IOException, ServletException {
        Result result = new Result();
        String userName = request.getParameter("customerName");
        String password = request.getParameter("customerPwd");
        String ca = request.getParameter("code").toLowerCase();
        String sesionCode = (String) request.getSession().getAttribute(CAPTCHA_KEY);
        if (!ca.equals(sesionCode.toLowerCase())) {
            result.setCode(0);
            result.setMassage("验证码输入错误!");
            return result;
        }
        CustomerInfo customerInfo = loginService.login(userName, password);
        if (Objects.isNull(customerInfo)) {
            result.setCode(2);
            result.setMassage("账号或密码错误!");
            return result;
        }
//        Object sessionId=session.getAttribute("userId");
//        if(sessionId==customerInfo.getCustomerId()){
//            result.setCode(3);
//            result.setMassage("当前用户已经登录了；不能重复登录");
//            session.setAttribute("thisuser", customerInfo);
//            return result;
//        }
        session.setAttribute("customerId", customerInfo.getCustomerId());
        session.setAttribute("customerInfo", customerInfo);
        result.setCode(1);
        result.setMassage("登录成功");
        return result;
    }

    @RequestMapping(value = "sendCode", produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String sendCode(String mobile, HttpServletResponse response) {
        PhoneCode phoneCode = new PhoneCode();
        com.hcm.springbootdemo.utils.Result result = phoneCode.getPhonemsg(mobile);
        response.setHeader("Access-Control-Allow-Origin", "*");
        System.out.println(result.getMessage() + "------------");
        return result.getMessage();
    }

    @RequestMapping("phoneLogin")
    @ResponseBody
    public Result phoneLogin(HttpServletRequest request, HttpServletResponse response, String phone, String verifiedCode, HttpSession httpSession) throws IOException, ServletException {
        Object vcode = request.getSession().getAttribute("vcode");
        Result result = new Result();
        if (verifiedCode.equals(vcode)) {
            CustomerInfo customerInfo = loginService.phoneLogin(phone);
            if (customerInfo != null) {
                httpSession.setAttribute("customerId", customerInfo.getCustomerId());
                httpSession.setAttribute("customerInfo", customerInfo);
                result.setCode(1);
                result.setMassage("登录成功");
            } else {
                result.setCode(0);
                result.setMassage("手机号未注册");
            }
        } else {
            result.setCode(2);
            result.setMassage("验证码错误");
        }
        return result;
    }

    @RequestMapping("toregister")
    public String toregister() {
        return "jsp/register";
    }

    @RequestMapping("codeVerify")
    @ResponseBody
    public Result codeVerify(String verifiedCode, String phone, HttpServletRequest request) {
        Result result = new Result();
        Object vcode = request.getSession().getAttribute("vcode");
        CustomerInfo customerInfo = loginService.phoneLogin(phone);
        if (customerInfo != null) {
            result.setCode(2);
            result.setMassage("该手机号已被注册");
        }else if (verifiedCode.equals(vcode)) {
            result.setCode(1);
            result.setMassage("校验成功");
        } else {
            result.setCode(0);
            result.setMassage("校验失败");
        }
        return result;
    }

    @RequestMapping("toregister2")
    public String toregister2() {
        return "jsp/register2";
    }

    @RequestMapping("register")
    @ResponseBody
    public Result register(String phone, String username, String password) {
        Result result = new Result();
        if (phone != null && phone != "" && username != null && username != "" && password != null && password != "") {
            CustomerInfo customerInfo = new CustomerInfo();
            customerInfo.setCustomerTel(phone);
            customerInfo.setCustomerName(username);
            customerInfo.setPassword(password);
            customerInfo.setCustomerId(RandomStringUtils.randomAlphanumeric(6));
            int i = loginService.insUser(customerInfo);
            if (i == 1) {
                result.setCode(1);
                result.setMassage("注册成功");
            }
        } else {
            result.setCode(0);
            result.setMassage("注册失败");
        }
        return result;
    }

    @RequestMapping("logOut")
    public String logOut(HttpServletRequest request, HttpServletResponse response) {
        //1.清空session
        request.getSession().invalidate();
        //2.获取cookie信息并且修改生命周期为0
        Cookie autoLoginCk = CookieUtils.getCookieByName("autoLogin", request.getCookies());
        if (null != autoLoginCk) {
            autoLoginCk.setMaxAge(0);
            autoLoginCk.setPath("/");
            response.addCookie(autoLoginCk);
        }
        //3.重定向到首页
        try {
            response.sendRedirect(request.getContextPath() + "/");
        } catch (IOException e) {
            e.printStackTrace();
        }
        // 默认返回null
        return null;
    }
}
