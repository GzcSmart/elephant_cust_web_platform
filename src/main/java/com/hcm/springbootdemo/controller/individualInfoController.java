package com.hcm.springbootdemo.controller;

import com.hcm.springbootdemo.entity.BalanceInfo;
import com.hcm.springbootdemo.entity.CustomerInfo;
import com.hcm.springbootdemo.entity.IndividualInfo;
import com.hcm.springbootdemo.service.BalanceInfoService;
import com.hcm.springbootdemo.service.IndividualInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class individualInfoController {
    @Autowired
    private IndividualInfoService individualInfoService;

    //    @RequestMapping(value = "/judgeOrgAudit", method = RequestMethod.GET)
//    public String judgeOrgAudit(ModelMap modelMap, HttpSession session) {
//        CustomerInfo customerInfo = (CustomerInfo) session.getAttribute("customerInfo");
//        OrgInfoDO orgInfoAudit = orgInfoAuditService.getOrgInfoAudit(customerInfoVO);
//        if (null != orgInfoAudit) {
//            if (2 == orgInfoAudit.getAuditStatus()) {
//                //审核拒绝
//                List<String> errorList = orgInfoAuditService.getAuditRemark(orgInfoAudit.getOrgId());
//                modelMap.addAttribute("errorList", errorList);
//                modelMap.addAttribute(KEY_AUDIT_MSG_HEAD, "3333");
//                modelMap.addAttribute(KEY_BTN_MSG, "再次申请");
//            } else if (1 == orgInfoAudit.getAuditStatus()) {
//                //审核通过
//                modelMap.addAttribute(KEY_AUDIT_MSG_HEAD, "2222");
//                modelMap.addAttribute(KEY_BTN_MSG, "查看企业信息");
//
//            } else if (3 == orgInfoAudit.getAuditStatus()) {
//                //待审核
//                modelMap.addAttribute(KEY_AUDIT_MSG_HEAD, "1111");
//            } else {
//                //未提交
//                modelMap.addAttribute(KEY_AUDIT_MSG_HEAD, "4444");
//                modelMap.addAttribute(KEY_BTN_MSG, "继续填写");
//            }
//        } else {
//            //未申请
//            modelMap.addAttribute(KEY_AUDIT_MSG_HEAD, "0000");
//            modelMap.addAttribute(KEY_BTN_MSG, "立即申请");
//        }
//        return URL_APPLY_STATEMENT;
//    }
    @RequestMapping("addIndividualInfo")
    public String addIndividualInfo(HttpSession httpSession) {
        String customerId = (String) httpSession.getAttribute("customerId");
        IndividualInfo individualInfo = individualInfoService.addIndividualById(customerId);
        if (individualInfo != null) {
            int i = individualInfoService.selStatus(customerId);
            if (i == 0) {
                return "jsp/failInfo";
            } else if (i == 2) {
                return "jsp/review";
            } else {
                return "jsp/reviewSuccess";
            }
        }
        return "jsp/addIndividual";
    }

    @RequestMapping("toaddIndividual")
    public String toaddIndividual() {
        return "jsp/addIndividual";
    }

    @RequestMapping("addIndividual")
    public String addIndividual(IndividualInfo individualInfo, HttpSession httpSession) {
        httpSession.setAttribute("individualInfo", individualInfo);
        return "jsp/pass";
    }

    @RequestMapping("addAllIndividual")
    public String addAllIndividual(HttpSession httpSession, String img_src) {
        String customerId = (String) httpSession.getAttribute("customerId");
        IndividualInfo individualInfo = (IndividualInfo) httpSession.getAttribute("individualInfo");
        individualInfo.setCustomerId(customerId);
        individualInfo.setOrgImg(img_src);
        individualInfo.setAuditStatus("2");
        int i = individualInfoService.updateindividualInfo(individualInfo);
        if (i == 1) {
            return "jsp/submitSuccess";
        }
        return "jsp/error";
    }

    @RequestMapping("findAllIndividual")
    public String findAllIndividual(HttpSession httpSession) {
        String customerId = (String) httpSession.getAttribute("customerId");
        IndividualInfo individualInfo = individualInfoService.addIndividualById(customerId);
        httpSession.setAttribute("individualInfo", individualInfo);
        return "jsp/showIndividual";
    }

    @RequestMapping("toreviewSuccess")
    public String toreviewSuccess() {
        return "jsp/reviewSuccess";
    }
}
