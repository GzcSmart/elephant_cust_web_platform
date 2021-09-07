package com.hcm.springbootdemo.controller;

import com.alibaba.fastjson.JSONObject;
import com.hcm.springbootdemo.entity.CustomerAddress;
import com.hcm.springbootdemo.entity.CustomerInvoice;
import com.hcm.springbootdemo.service.CustomerAddressService;
import com.hcm.springbootdemo.service.CustomerInvoiceService;
import com.hcm.springbootdemo.utils.ElephantResultEnum;
import com.hcm.springbootdemo.utils.ResultUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class CustomerInvoiceController {

    @Autowired
    private CustomerAddressService customerAddressService;

    @Autowired
    private CustomerInvoiceService customerInvoiceService;

    @RequestMapping("go2Update")
    public String go2InvoiceUpdate(HttpSession httpSession, Model model) {
        String customerId = (String) httpSession.getAttribute("customerId");
        CustomerInvoice invoiceByCustomerId = customerInvoiceService.getInvoiceByCustomerId(customerId);
        model.addAttribute("invoiceByCustomerId", invoiceByCustomerId);
        return "jsp/update";
    }

    @RequestMapping(value = "goAddress", method = RequestMethod.GET)
    public String address(HttpSession httpSession, Model model) {
        String customerId = (String) httpSession.getAttribute("customerId");
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
        return "jsp/address";
    }

    @RequestMapping("go2Add")
    public String go2Add(String count, Model model) {
        model.addAttribute("count", count);
        return "jsp/add";
    }

    //添加
    @RequestMapping(value = "updateAddress", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, String> updateAddress(String count_num, CustomerAddress customerAddress, HttpSession httpSession, HttpServletResponse response, Model model) throws ServletException, IOException {
        Map<String, String> resMap = new HashMap<>(16);
        if (customerAddress.getArea() != null) {
            String customerId = (String) httpSession.getAttribute("customerId");
            customerAddress.setCustomerId(customerId);
            int i = customerAddressService.insAddress(customerAddress);
            if (i == 1) {
//                httpSession.setAttribute("count_num",count_num);
                ResultUtils.returnCode(resMap, ElephantResultEnum.SUCCESS);
            } else {
                ResultUtils.failWithMsg(resMap, "设置地址出错啦");
            }
        } else {
            ResultUtils.failWithMsg(resMap, "设置地址出错啦");
        }
        return resMap;
    }

    @RequestMapping(value = "updateInvoice", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, String> updateInvoice(CustomerInvoice customerInvoice, HttpSession httpSession) {
        String customerId = (String) httpSession.getAttribute("customerId");
        Map<String, String> resMap = new HashMap<>(16);
        customerInvoice.setCustomerId(customerId);
        customerInvoice.setStatus(0);
        Integer integer = customerInvoiceService.updateInvoice(customerInvoice);
        if (integer == 1) {
            ResultUtils.returnCode(resMap, ElephantResultEnum.SUCCESS);
        } else {
            ResultUtils.failWithMsg(resMap, "修改发票信息出错了");
        }
        return resMap;
    }

    @RequestMapping("go2Upd")
    public String go2Upd(int id, Model model, String count) {
        CustomerAddress customerAddress1 = customerAddressService.selIdAddress(id);
        JSONObject object = JSONObject.parseObject(customerAddress1.getArea());
        String provinceName = (String) object.get("provinceName");
        String cityName = (String) object.get("cityName");
        String districtName = (String) object.get("districtName");
        customerAddress1.setProvinceName(provinceName);
        customerAddress1.setCityName(cityName);
        customerAddress1.setDistrictName(districtName);
        model.addAttribute("customerAddress1", customerAddress1);
        model.addAttribute("count", count);
        return "jsp/upd";
    }

    //修改
    @RequestMapping(value = "updAddress", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, String> updAddress(CustomerAddress customerAddress, HttpSession httpSession) {
        String customerId = (String) httpSession.getAttribute("customerId");
        customerAddress.setCustomerId(customerId);
        Map<String, String> resMap = new HashMap<>(16);
        int i = customerAddressService.updAddress(customerAddress);
        if (i == 1) {
            ResultUtils.returnCode(resMap, ElephantResultEnum.SUCCESS);
        } else {
            ResultUtils.failWithMsg(resMap, "设置默认地址出错啦");
        }
        return resMap;
    }

    //删除
    @RequestMapping(value = "delAddress", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, String> delAddress(int id) {
        Map<String, String> resMap = new HashMap<>(16);
        int i = customerAddressService.delIdAddress(id);
        if (i == 1) {
            ResultUtils.returnCode(resMap, ElephantResultEnum.SUCCESS);
        } else {
            ResultUtils.failWithMsg(resMap, "设置默认地址出错啦");
        }
        return resMap;
    }
}
