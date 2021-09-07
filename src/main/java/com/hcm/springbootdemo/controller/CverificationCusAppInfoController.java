package com.hcm.springbootdemo.controller;

import com.hcm.springbootdemo.entity.CverificationCusAppInfo;
import com.hcm.springbootdemo.service.CverificationCusAppInfoService;
import com.hcm.springbootdemo.utils.ElephantResultEnum;
import com.hcm.springbootdemo.utils.RandomUtil;
import com.hcm.springbootdemo.utils.ResultUtils;
import com.hcm.springbootdemo.utils.UUIDUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class CverificationCusAppInfoController {
    @Autowired
    private CverificationCusAppInfoService cusAppInfoService;

    @RequestMapping("cverification")
    public String cverification(HttpSession httpSession, Model model, String appPlatform, String auditStatus, String appName, String appId) {
        if (auditStatus == null || auditStatus.equals("")) {
            auditStatus = "-1";
        }
        String customerId = (String) httpSession.getAttribute("customerId");
        CverificationCusAppInfo cverificationCusAppInfo = new CverificationCusAppInfo();
        cverificationCusAppInfo.setCustomerId(customerId);
        cverificationCusAppInfo.setAppPlatform(appPlatform);
        cverificationCusAppInfo.setAuditStatus(Integer.parseInt(auditStatus));
        cverificationCusAppInfo.setAppName(appName);
        cverificationCusAppInfo.setAppId(appId);
        List<CverificationCusAppInfo> cverificationCusAppInfos1 = cusAppInfoService.selCondition(cverificationCusAppInfo);
        model.addAttribute("cverificationCusAppInfos", cverificationCusAppInfos1);
        model.addAttribute("appPlatform", appPlatform);
        model.addAttribute("auditStatus", auditStatus);
        model.addAttribute("appName", appName);
        model.addAttribute("appId", appId);
        return "jsp/cverification";
    }

//    @RequestMapping("selAppName")
//    public String selAppName(String appName,Model model){
//        List<CverificationCusAppInfo> cverificationCusAppInfos = cusAppInfoService.selAppName(appName);
//        model.addAttribute("cverificationCusAppInfos",cverificationCusAppInfos);
//        model.addAttribute("appName",appName);
//        return "jsp/cverification";
//    }
//
//    @RequestMapping("selAppId")
//    public String selAppId(String appId,Model model){
//        List<CverificationCusAppInfo> cverificationCusAppInfos = cusAppInfoService.selAppId(appId);
//        model.addAttribute("cverificationCusAppInfos",cverificationCusAppInfos);
//        model.addAttribute("appId",appId);
//        return "jsp/cverification";
//    }

    @RequestMapping("getAuthConfigDetail")
    public String getAuthConfigDetail(String value, Model model) {
        CverificationCusAppInfo cverificationCusAppInfo = cusAppInfoService.cverificationId(Integer.parseInt(value));
        model.addAttribute("cverificationCusAppInfo", cverificationCusAppInfo);
        return "jsp/authAppInfoView";
    }

    @RequestMapping(value = "updAppInfo", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, String> updCverificationApp(CverificationCusAppInfo cverificationCusAppInfo) {
        Map<String, String> resMap = new HashMap<>(16);
        int i = cusAppInfoService.updCverification(cverificationCusAppInfo);
        if (i == 1) {
            ResultUtils.returnCode(resMap, ElephantResultEnum.SUCCESS);
        } else {
            ResultUtils.failWithMsg(resMap, "修改配置失败");
        }
        return resMap;
    }

    @RequestMapping("insCverificationApp")
    public String insCverificationApp() {
        return "jsp/addCverificationApp";
    }

    @RequestMapping(value = "addCverificationAppInfo", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, String> addCverificationAppInfo(CverificationCusAppInfo cverificationCusAppInfo, HttpSession httpSession) {
        Map<String, String> resMap = new HashMap<>(16);
        String customerId = (String) httpSession.getAttribute("customerId");
        cverificationCusAppInfo.setAppId(RandomUtil.getRandom(19));
        cverificationCusAppInfo.setCustomerId(customerId);
        cverificationCusAppInfo.setAuditStatus(2);
        int i = cusAppInfoService.addCverification(cverificationCusAppInfo);
        if (i == 1) {
            ResultUtils.returnCode(resMap, ElephantResultEnum.SUCCESS);
        } else {
            ResultUtils.failWithMsg(resMap, "添加配置失败");
        }
        return resMap;
    }

    @RequestMapping(value = "delCverificationAppInfo")
    @ResponseBody
    public Map<String, String> delCverificationAppInfo(String ids) {
        Map<String, String> resMap = new HashMap<>(16);
        if (ids != null && ids.length() != 0) {
            String[] list = ids.split(",");
            for (int i = 0; i < list.length; i++) {
                int i1 = cusAppInfoService.delCverification(Integer.parseInt(list[i]));
                if (i1 == 1) {
                    ResultUtils.success(resMap);
                } else {
                    ResultUtils.failWithMsg(resMap, "删除配置失败");
                }
            }
        } else {
            ResultUtils.failWithMsg(resMap, "请选择需要删除的应用");
        }
        return resMap;
    }

}
