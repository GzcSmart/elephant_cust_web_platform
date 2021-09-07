package com.hcm.springbootdemo.controller;

import com.hcm.springbootdemo.entity.BalanceInfo;
import com.hcm.springbootdemo.service.BalanceInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class BalanceInfoController {
    @Autowired
    private BalanceInfoService balanceInfoService;

    @RequestMapping("balanceChild")
    public String balanceChild(HttpSession httpSession, Model model) {
        String customerId = (String) httpSession.getAttribute("customerId");
        List<BalanceInfo> balanceInfos = balanceInfoService.balanceById(customerId);
        model.addAttribute("balanceInfos", balanceInfos);
        return "jsp/balanceInfo";
    }
}
