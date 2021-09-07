package com.hcm.springbootdemo.controller;

import com.hcm.springbootdemo.entity.Result;
import com.hcm.springbootdemo.entity.YwInfo;
import com.hcm.springbootdemo.entity.YwInfoCategory;
import com.hcm.springbootdemo.service.YwInfoCategoryService;
import com.hcm.springbootdemo.service.YwInfoService;
import com.hcm.springbootdemo.utils.PageBeanUtils;
import org.apache.commons.lang.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileInputStream;
import java.util.List;


@Controller
public class YwInfoController {
    @Autowired
    private YwInfoService ywInfoService;

    @Autowired
    private YwInfoCategoryService ywInfoCategoryService;

//    @RequestMapping(value = "go2Index", method = RequestMethod.GET)
//    public String go2YwInfoIndex(HttpSession httpSession, Model model, String id) {
//        String customerId = (String)httpSession.getAttribute("customerId");
//        List<YwInfo> ywInfos = ywInfoService.ywByCustomerId(customerId);
//        model.addAttribute("ywInfos", ywInfos);
//        List<YwInfoCategory> ywInfoCategories = ywInfoCategoryService.selAllYwCategory();
//        model.addAttribute("ywInfoCategories",ywInfoCategories);
//        if (id == null || id.equals("")){
//            id = "-1";
//        }
//        List<YwInfo> ywInfos1 = ywInfoService.selConditionId(Integer.parseInt(id));
//        model.addAttribute("ywInfoId",id);
//        model.addAttribute("ywInfos", ywInfos1);
//        return "jsp/ywInfo";
//    }

    @RequestMapping(value = "updateYwInfo", method = RequestMethod.POST)
    @ResponseBody
    public Result updateYwInfo(String id, String status) {
        Result result = new Result();
        int i = Integer.parseInt(id);
        int s = Integer.parseInt(status);
        int y = ywInfoService.updateYwInfo(i, s);
        if (y == 1) {
            result.setCode(1);
            result.setMassage("成功");
        }
        return result;
    }

    @RequestMapping("api")
    public String toapi() {
        return "jsp/Api";
    }

    @RequestMapping(value = "/downloadFile")
    public void downloadSysFile(String type, HttpServletResponse response, HttpServletRequest request) throws Exception {
        // 拿到响应输出流
        ServletOutputStream outputStream = response.getOutputStream();
        String filename = "";
        String url = "";
        if ("0".equals(type)) {
            filename = "attachment;filename=" + new String("大象能力平台功能说明手册V2.0.docx".getBytes(), "ISO-8859-1");
            url = request.getSession().getServletContext().getRealPath("/doc/大象能力平台功能说明手册V2.0.docx");
        } else {
            filename = "attachment; filename=elephant-captcha-demo.rar";
            url = request.getSession().getServletContext().getRealPath("/doc/elephant-captcha-demo.rar");
        }
        // 构建要输出给客户端的数据
        File f = new File(url);
        // 设置响应数据需保存为文件，同时指定下载信息。
        response.setCharacterEncoding("utf-8");
        response.setHeader("Content-Disposition", filename);
        // 典型的流操作代码
        FileInputStream fi = new FileInputStream(f);
        byte[] data = new byte[1024];
        int dataSize = 0;
        while ((dataSize = fi.read(data)) != -1) {
            outputStream.write(data, 0, dataSize);
        }
        outputStream.flush();
        fi.close();
    }

    @RequestMapping("customerYwList")
    @ResponseBody
    public List<YwInfo> getCustomerYwList(HttpSession httpSession) {
        String customerId = (String) httpSession.getAttribute("customerId");
        return ywInfoService.getYwInfoList(customerId);
    }

    @RequestMapping("getConditionYw")
    public String getConditionYw(HttpServletRequest request, HttpSession httpSession, String preId, String customerYwName, Model model) {
//        String customerId = (String)httpSession.getAttribute("customerId");
//        List<YwInfo> ywInfos = ywInfoService.ywByCustomerId(customerId);
//        model.addAttribute("ywInfos", ywInfos);
        List<YwInfoCategory> ywInfoCategories = ywInfoCategoryService.selAllYwCategory();
        model.addAttribute("ywInfoCategories", ywInfoCategories);
        if (preId == null || preId.equals("")) {
            preId = "-1";
        }
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
        int totalData = ywInfoService.getTotalNum(Integer.parseInt(preId), customerYwName);
        int totalPage = (int) Math.ceil((double) totalData / pageSize);
        if (totalData > 0) {
            if (currentPage > totalPage) {
                currentPage = totalPage;
            }
        }
        List<YwInfo> ywInfos2 = ywInfoService.selConditionYw(Integer.parseInt(preId), customerYwName, currentPage, pageSize);
        PageBeanUtils pg = new PageBeanUtils(currentPage, pageSize, totalData);
        pg.setPageData(ywInfos2);
        model.addAttribute("ywInfoId", preId);
        model.addAttribute("customerYwName", customerYwName);
        model.addAttribute("pg", pg);
        return "jsp/ywInfo";
    }

//    @RequestMapping("getConditionId")
//    public String getConditionId(String id,Model model){
//        if (id == null || id.equals("")){
//            id = "-1";
//        }
//        List<YwInfo> ywInfos = ywInfoService.selConditionId(Integer.parseInt(id));
//        model.addAttribute("ywInfoId",id);
//        model.addAttribute("ywInfos", ywInfos);
//        return "jsp/ywInfo";
//    }

    @RequestMapping(value = "resPwd", method = RequestMethod.POST)
    @ResponseBody
    public Result resPwd(HttpServletRequest request) {
        Result result = new Result();
        String id = request.getParameter("id");
        String password = RandomStringUtils.randomAlphanumeric(10);
        int i = ywInfoService.updPwd(Integer.parseInt(id), password);
        if (i == 1) {
            result.setCode(1);
            result.setMassage("成功");
        } else {
            result.setCode(0);
            result.setMassage("失败");
        }
        return result;
    }
}
