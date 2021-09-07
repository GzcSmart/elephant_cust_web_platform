package com.hcm.springbootdemo.controller;

import com.alibaba.fastjson.JSONObject;
import com.hcm.springbootdemo.entity.CustomerAddress;
import com.hcm.springbootdemo.entity.CustomerInvoice;
import com.hcm.springbootdemo.entity.CustomerInvoiceApply;
import com.hcm.springbootdemo.service.CustomerAddressService;
import com.hcm.springbootdemo.service.CustomerInvoiceApplyService;
import com.hcm.springbootdemo.service.CustomerInvoiceService;
import com.hcm.springbootdemo.utils.ElephantResultEnum;
import com.hcm.springbootdemo.utils.PageBeanUtils;
import com.hcm.springbootdemo.utils.ResultUtils;
import com.hcm.springbootdemo.utils.UUIDUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class CustomerInvoiceApplyController {

    @Autowired
    private CustomerInvoiceApplyService customerInvoiceApplyService;

    @Autowired
    private CustomerInvoiceService customerInvoiceService;

    @Autowired
    private CustomerAddressService customerAddressService;

    @RequestMapping("selInvoiceApply")
    public String selInvoiceApply(Model model, HttpServletRequest request) {
        String invoiceTitle = request.getParameter("invoiceTitle");
        String taxRegisterNumber = request.getParameter("taxRegisterNumber");
        String invoiceCategory = request.getParameter("invoiceCategory");
        String invoiceType = request.getParameter("invoiceType");
        if (invoiceType == null || invoiceType.equals("")) {
            invoiceType = "-1";
        }
        String auditStatus = request.getParameter("auditStatus");
        if (auditStatus == null || auditStatus.equals("")) {
            auditStatus = "-1";
        }
        CustomerInvoiceApply customerInvoiceApply = new CustomerInvoiceApply();
        customerInvoiceApply.setInvoiceTitle(invoiceTitle);
        customerInvoiceApply.setTaxRegisterNumber(taxRegisterNumber);
        customerInvoiceApply.setInvoiceCategory(invoiceCategory);
        customerInvoiceApply.setInvoiceType(Integer.parseInt(invoiceType));
        customerInvoiceApply.setAuditStatus(Integer.parseInt(auditStatus));
        int currentPage = 1;
        try {
            currentPage = Integer.parseInt(request.getParameter("curPage"));
            if (currentPage <= 0) {
                currentPage = 1;
            }
        } catch (Exception e) {
            currentPage = 1;
        }
        int pageSize = 10;
        int totalData = customerInvoiceApplyService.getInvoiceTotal(customerInvoiceApply);
        int totalPage = (int) Math.ceil((double) totalData / pageSize);
        if (totalData > 0) {
            if (currentPage > totalPage) {
                currentPage = totalPage;
            }
        }
        List<CustomerInvoiceApply> customerInvoiceApplies = customerInvoiceApplyService.selConditionApply(customerInvoiceApply, currentPage, pageSize);
        PageBeanUtils pg = new PageBeanUtils(currentPage, pageSize, totalData);
        pg.setPageData(customerInvoiceApplies);
        model.addAttribute("pg", pg);
        model.addAttribute("invoiceType", invoiceType);
        model.addAttribute("auditStatus", auditStatus);
        model.addAttribute("invoiceTitle", invoiceTitle);
        model.addAttribute("taxRegisterNumber", taxRegisterNumber);
        model.addAttribute("invoiceCategory", invoiceCategory);
        return "jsp/customerInvoiceApply";
    }

    @RequestMapping("toinvoiceApply")
    public String toinvoiceApply(HttpSession httpSession, Model model, CustomerInvoiceApply customerInvoiceApply, String count) {
        model.addAttribute("count", count);
        String customerId = (String) httpSession.getAttribute("customerId");
        CustomerInvoice invoiceByCustomerId = customerInvoiceService.getInvoiceByCustomerId(customerId);
        model.addAttribute("invoiceByCustomerId", invoiceByCustomerId);
        List<CustomerAddress> customerAddresses = customerAddressService.selAllAddress(customerId);
        for (CustomerAddress address : customerAddresses) {
            JSONObject jsonObject = JSONObject.parseObject(address.getArea());
            String provinceName = (String) jsonObject.get("provinceName");
            String cityName = (String) jsonObject.get("cityName");
            String districtName = (String) jsonObject.get("districtName");
            address.setProvinceName(provinceName);
            address.setCityName(cityName);
            address.setDistrictName(districtName);
        }
        model.addAttribute("customerAddresses", customerAddresses);
        return "jsp/invoiceApply";
    }

//    @RequestMapping("toselectBill")
//    public String toselectBill(){
//        return "jsp/selectBill";
//    }

//    @RequestMapping("toselectAddress")
//    public String toselectAddress(HttpSession httpSession,Model model,CustomerInvoiceApply customerInvoiceApply){
//        httpSession.setAttribute("customerInvoiceApply2",customerInvoiceApply);
//        String customerId = (String) httpSession.getAttribute("customerId");
//        List<CustomerAddress> customerAddresses = customerAddressService.selAllAddress(customerId);
//        for(CustomerAddress address : customerAddresses){
//            JSONObject jsonObject = JSONObject.parseObject(address.getArea());
//            String provinceName = (String) jsonObject.get("provinceName");
//            String cityName = (String) jsonObject.get("cityName");
//            String districtName = (String) jsonObject.get("districtName");
//            address.setProvinceName(provinceName);
//            address.setCityName(cityName);
//            address.setDistrictName(districtName);
//        }
//        model.addAttribute("customerAddresses",customerAddresses);
//        return "jsp/selectAddress";
//    }

    @RequestMapping(value = "addInvoiceApply", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, String> addInvoiceApply(CustomerInvoiceApply customerInvoiceApply, HttpSession httpSession, HttpServletRequest request, String addressId) {
        Map<String, String> resMap = new HashMap<>(16);
        String customerId = (String) httpSession.getAttribute("customerId");
        CustomerInvoice invoiceByCustomerId = customerInvoiceService.getInvoiceByCustomerId(customerId);
        CustomerAddress address = customerAddressService.selIdAddress(Integer.parseInt(addressId));
        customerInvoiceApply.setInvoiceApplyId(UUIDUtils.getUUID());
        String orgId = invoiceByCustomerId.getOrgId();
        String orgName = invoiceByCustomerId.getOrgName();
        String invoiceTitle = invoiceByCustomerId.getInvoiceTitle();
        String taxNum = invoiceByCustomerId.getTaxNum();
        String bankName = invoiceByCustomerId.getBankName();
        String bankNum = invoiceByCustomerId.getBankNum();
        String mobile = invoiceByCustomerId.getMobile();
        String address1 = invoiceByCustomerId.getAddress();
        String detailedArea = address.getDetailedArea();
        String name = address.getName();
        String phone = address.getPhone();
        customerInvoiceApply.setReceiver(name);
        customerInvoiceApply.setReceivedAddress("详细地址：" + detailedArea);
        customerInvoiceApply.setReceivedPhone(phone);
        customerInvoiceApply.setOrgId(orgId);
        customerInvoiceApply.setOrgName(orgName);
        customerInvoiceApply.setInvoiceTitle(invoiceTitle);
        customerInvoiceApply.setTaxRegisterNumber(taxNum);
        customerInvoiceApply.setInvoiceBank(bankName);
        customerInvoiceApply.setBankCardNumber(bankNum);
        customerInvoiceApply.setOrgMobile(mobile);
        customerInvoiceApply.setOrgAddress(address1);
        customerInvoiceApply.setAuditStatus(0);
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String format = df.format(new Date());
        customerInvoiceApply.setInsertTime(format);
        int i = customerInvoiceApplyService.insInvoiceApply(customerInvoiceApply);
        if (i == 1) {
            ResultUtils.returnCode(resMap, ElephantResultEnum.SUCCESS);
        } else {
            ResultUtils.failWithMsg(resMap, "发票申请失败");
        }
        return resMap;
    }

    @RequestMapping("toinvoiceDetails")
    public String toinvoiceDetails(String id, Model model) {
        CustomerInvoiceApply customerInvoiceApply = customerInvoiceApplyService.selAllInvoiceApplyById(id);
        model.addAttribute("customerInvoiceApply", customerInvoiceApply);
        return "jsp/invoiceDetails";
    }
}
