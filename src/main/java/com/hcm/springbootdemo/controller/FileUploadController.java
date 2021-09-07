package com.hcm.springbootdemo.controller;

import com.hcm.springbootdemo.entity.DataJson;
import com.hcm.springbootdemo.utils.UploadUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;

@Controller
public class FileUploadController {

    @RequestMapping("uploadimg")
    @ResponseBody
    public DataJson uploadImg(@RequestParam(value = "file") MultipartFile multipartFile, HttpServletRequest request) {
        String imagePath = UploadUtil.upload(multipartFile, request);
        DataJson dataJson = new DataJson();
        if (imagePath != null) {
            dataJson.setCode(1);
            dataJson.setMsg("上传成功");
            HashMap<String, String> map = new HashMap<>();
            map.put("src", imagePath);
            dataJson.setData(map);
        } else {
            dataJson.setCode(0);
            dataJson.setMsg("上传失败");
        }
        return dataJson;
    }
}
