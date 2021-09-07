package com.hcm.springbootdemo.controller;

import com.alibaba.fastjson.JSON;
import com.hcm.springbootdemo.entity.CustomerInfo;
import com.hcm.springbootdemo.entity.DataJson;
import com.hcm.springbootdemo.service.CustomerInfoService;
import com.hcm.springbootdemo.utils.UploadUtil;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;

@Controller
public class UserController {

    @Autowired
    private CustomerInfoService customerInfoService;

    @RequestMapping(value = "/getCustomerInfo", method = RequestMethod.GET)
    public String getCustomerInfo(Model model, HttpSession httpSession) {
        // 从session获取用户信息
        String customerId = (String)httpSession.getAttribute("customerId");
        if (customerId != null && customerId != "") {
            CustomerInfo customerInfo = customerInfoService.selUser(customerId);
            httpSession.setAttribute("customerInfo", customerInfo);
            return "jsp/customerInfo";
        } else {
            return null;
        }
    }

    @RequestMapping("upface")
    @ResponseBody
    public DataJson upface(HttpSession httpSession, @RequestParam(value = "file") MultipartFile multipartFile,
        HttpServletRequest request) {
        String imagePath = UploadUtil.upload(multipartFile, request);
        DataJson dataJson = new DataJson();
        if (imagePath != null) {
            CustomerInfo customerInfo = (CustomerInfo)httpSession.getAttribute("customerInfo");
            customerInfo.setHeadImgUrl(imagePath);
            int i = customerInfoService.updUser(customerInfo);
            // CustomerInfo customerInfo1 = customerInfoService.selUser(customerInfo.getCustomerId());
            // httpSession.setAttribute("customerInfo",customerInfo1);
            if (i == 1) {
                dataJson.setCode(1);
                dataJson.setMsg("修改成功,刷新页面后生效");
                HashMap<String, String> map = new HashMap<>();
                map.put("src", imagePath);
                dataJson.setData(map);
            } else {
                dataJson.setCode(0);
                dataJson.setMsg("上传失败");
            }
        } else {
            dataJson.setCode(0);
            dataJson.setMsg("上传失败");
        }
        return dataJson;
    }

    @RequestMapping(value = "upPwd", method = RequestMethod.POST)
    @ResponseBody
    public DataJson upPwd(String password, HttpSession httpSession) {
        DataJson dataJson = new DataJson();
        CustomerInfo customerInfo = (CustomerInfo)httpSession.getAttribute("customerInfo");
        if (password != null && password != "") {
            customerInfo.setPassword(password);
            int i = customerInfoService.updUser(customerInfo);
            if (i == 1) {
                dataJson.setCode(1);
                dataJson.setMsg("修改成功,三秒后跳转登录页面");
            } else {
                dataJson.setCode(2);
                dataJson.setMsg("修改失败");
            }
        } else {
            dataJson.setCode(0);
            dataJson.setMsg("密码不能为空");
        }
        return dataJson;
    }

}
