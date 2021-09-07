package com.hcm.springbootdemo.controller;

import com.hcm.springbootdemo.entity.YwInfo;
import com.hcm.springbootdemo.entity.YwInfoCategory;
import com.hcm.springbootdemo.entity.YwRecord;
import com.hcm.springbootdemo.service.YwInfoCategoryService;
import com.hcm.springbootdemo.service.YwInfoService;
import com.hcm.springbootdemo.service.YwRecordService;
import com.hcm.springbootdemo.utils.ExcelUtil;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.tagext.PageData;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.util.List;

@Controller
public class YwRecordController {
    @Autowired
    private YwInfoService ywInfoService;
    @Autowired
    private YwRecordService ywRecordService;
    @Autowired
    private YwInfoCategoryService ywInfoCategoryService;

    @RequestMapping("ywDetail")
    public String ywDetail(String code, YwRecord ywRecord, Model model, HttpServletRequest request) {
        String ywInfoCategories1 = request.getParameter("ywInfoCategories");
        if (ywInfoCategories1 == null || ywInfoCategories1.equals("")) {
            ywInfoCategories1 = "-1";
        }
        String ywInfos1 = request.getParameter("ywInfos");
        List<YwInfoCategory> ywInfoCategories =
            ywInfoCategoryService.selYwCategoryById(Integer.parseInt(ywInfoCategories1));
        List<YwInfo> ywInfos = ywInfoService.ywByCustomerOptionId(ywInfos1);
        List<YwRecord> ywRecords = ywRecordService.ywConditionQuery(ywRecord);
        model.addAttribute("ywRecords", ywRecords);
        model.addAttribute("ywInfoCategories", ywInfoCategories);
        model.addAttribute("ywInfos", ywInfos);
        model.addAttribute("ywInfoCategories1", ywInfoCategories1);
        model.addAttribute("ywInfos1", ywInfos1);
        model.addAttribute("serialNumber", ywRecord.getSerialNumber());
        model.addAttribute("returnCode", ywRecord.getReturnCode());
        model.addAttribute("returnCodeDescribe", ywRecord.getReturnCodeDescribe());
        model.addAttribute("operator", ywRecord.getOperator());
        model.addAttribute("receivingNumber", ywRecord.getReceivingNumber());
        model.addAttribute("appName", ywRecord.getAppName());
        model.addAttribute("appId", ywRecord.getAppId());
        model.addAttribute("startTime", ywRecord.getStartTime());
        model.addAttribute("endTime", ywRecord.getEndTime());
        model.addAttribute("code", code);
        return "jsp/dataDetails";
    }

    // 导出excel
    @RequestMapping(value = "/exportExcel", method = RequestMethod.GET)
    @ResponseBody
    public void exportExcel(String id) throws IOException {
        ServletRequestAttributes servletRequestAttributes =
            (ServletRequestAttributes)RequestContextHolder.getRequestAttributes();
        HttpServletResponse response = servletRequestAttributes.getResponse();;
        // 对应类的查找所有数据方法
        List<YwRecord> resultList = ywRecordService.ywRecordById(Integer.parseInt(id));
        long t1 = System.currentTimeMillis();
        // 核心代码
        ExcelUtil.writeExcel(response, resultList, YwRecord.class);
        long t2 = System.currentTimeMillis();
    }

}
