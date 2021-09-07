package com.hcm.springbootdemo.controller;

import com.hcm.springbootdemo.entity.Message;
import com.hcm.springbootdemo.service.MessageService;
import com.hcm.springbootdemo.utils.ElephantResultEnum;
import com.hcm.springbootdemo.utils.PageBeanUtils;
import com.hcm.springbootdemo.utils.ResultUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class MessageController {

    @Autowired
    private MessageService messageService;

    @RequestMapping("tomessage")
    public String tomessage(HttpSession httpSession, Model model, HttpServletRequest request) {
        String customerId = (String) httpSession.getAttribute("customerId");
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
        int totalData = messageService.getMassageTotal(customerId);
        int totalPage = (int) Math.ceil((double) totalData / pageSize);
        if (totalData > 0) {
            if (currentPage > totalPage) {
                currentPage = totalPage;
            }
        }
        List<Message> messages = messageService.selAllMessage(customerId, currentPage, pageSize);
        PageBeanUtils pg = new PageBeanUtils(currentPage, pageSize, totalData);
        pg.setPageData(messages);
        model.addAttribute("pg", pg);
        return "jsp/message";
    }

    @RequestMapping("tomessageDetail")
    public String tomessageDetail(HttpServletRequest request, Model model) {
        String id = request.getParameter("id");
        Message message = messageService.selByIdMessage(Integer.parseInt(id));
        messageService.readMessage(1, Integer.parseInt(id));
        model.addAttribute("message", message);
        return "jsp/messageDetail";
    }

    @RequestMapping("delMessage")
    @ResponseBody
    public Map<String, String> delMessage(HttpServletRequest request) {
        Map<String, String> resMap = new HashMap<>(16);
        String id = request.getParameter("id");
        String isDelete = request.getParameter("isDelete");
        messageService.delMessage(Integer.parseInt(isDelete), Integer.parseInt(id));
        ResultUtils.success(resMap);
        return resMap;
    }

    @RequestMapping("readMessage")
    @ResponseBody
    public Map<String, String> readMessage(HttpServletRequest request) {
        Map<String, String> resMap = new HashMap<>(16);
        String id = request.getParameter("id");
        String status = request.getParameter("status");
        messageService.readMessage(Integer.parseInt(status), Integer.parseInt(id));
        ResultUtils.success(resMap);
        return resMap;
    }

    @RequestMapping("deleteMoreMessage")
    @ResponseBody
    public Map<String, String> deleteMoreMessage(String ids, String isDelete) {
        Map<String, String> resMap = new HashMap<>(16);
        if (ids != null && ids.length() != 0) {
            String[] list = ids.split(",");
            for (int i = 0; i < list.length; i++) {
                messageService.delMessage(Integer.parseInt(isDelete), Integer.parseInt(list[i]));
            }
            ResultUtils.success(resMap);
        }

        return resMap;
    }

    @RequestMapping("readMoreMessage")
    @ResponseBody
    public Map<String, String> readMoreMessage(String ids, String status) {
        Map<String, String> resMap = new HashMap<>(16);
        if (ids != null && ids.length() != 0) {
            String[] list = ids.split(",");
            for (int i = 0; i < list.length; i++) {
                messageService.readMessage(Integer.parseInt(status), Integer.parseInt(list[i]));
            }
            ResultUtils.success(resMap);
        }
        return resMap;
    }
}
