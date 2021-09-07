package com.hcm.springbootdemo.controller;

import com.fasterxml.jackson.annotation.JsonTypeInfo;
import com.hcm.springbootdemo.entity.ApiRecord;
import com.hcm.springbootdemo.entity.YwInfo;
import com.hcm.springbootdemo.entity.YwInfoCategory;
import com.hcm.springbootdemo.service.ApiRecordService;
import com.hcm.springbootdemo.service.YwInfoCategoryService;
import com.hcm.springbootdemo.service.YwInfoService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class ApiRecordController {
    @Autowired
    private ApiRecordService apiRecordService;
    @Autowired
    private YwInfoService ywInfoService;
    @Autowired
    private YwInfoCategoryService ywInfoCategoryService;

    @RequestMapping("tostatistics")
    public String tostatistics(Model model, HttpSession httpSession, HttpServletRequest request, String statementDate) {
        String id = request.getParameter("id");
        String customerYwId = request.getParameter("customerYwId");
        if (id == null || id == "") {
            id = "-1";
        }
        if (StringUtils.isNotEmpty(statementDate)) {
            statementDate = statementDate.substring(0, 7);
        }
        String customerId = (String) httpSession.getAttribute("customerId");
        List<ApiRecord> allRecord = apiRecordService.findAllRecord(customerId, statementDate);
        List<YwInfo> allYwInfoList = ywInfoService.getAllYwInfoList(Integer.parseInt(id), customerYwId);
        List<YwInfoCategory> ywInfoCategories = ywInfoCategoryService.selAllYwCategory();
//        List<YwInfo> ywInfos = ywInfoService.selAllYwInfoList();
        model.addAttribute("customerYwId", customerYwId);
        model.addAttribute("ywInfoId", id);
        model.addAttribute("allRecord", allRecord);
        model.addAttribute("allYwInfoList", allYwInfoList);
        model.addAttribute("ywInfoCategories", ywInfoCategories);
        model.addAttribute("statementDate", statementDate);
//        model.addAttribute("allYwInfo",ywInfos);
        return "jsp/dataStatistics";
    }

    @RequestMapping("viewStatistics")
    public String viewStatistics(String id, Model model) {
        ApiRecord idRecord = apiRecordService.findIdRecord(Integer.parseInt(id));
        model.addAttribute("idRecord", idRecord);
        return "jsp/statisticsDetails";
    }
}
