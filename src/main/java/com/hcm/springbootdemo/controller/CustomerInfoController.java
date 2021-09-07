package com.hcm.springbootdemo.controller;

import com.hcm.springbootdemo.entity.OrgInfo;
import com.hcm.springbootdemo.service.OrgInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/")
public class CustomerInfoController {
    @Autowired
    private OrgInfoService orgInfoService;

    @RequestMapping(value = "get", method = RequestMethod.GET)
    public String getCustomerInfo() {
        return "jsp/customerInfo";
    }

    @RequestMapping(value = "go2UserCenter", method = RequestMethod.GET)
    public String go2UserCenter(Model model, HttpSession session) {
        String customerId = (String) session.getAttribute("customerInfo.customerId");
        OrgInfo orgInfo = orgInfoService.getOrgInfoByCustomerId(customerId);
        model.addAttribute("orgInfo", orgInfo);
        return "jsp/admin";
    }
}
