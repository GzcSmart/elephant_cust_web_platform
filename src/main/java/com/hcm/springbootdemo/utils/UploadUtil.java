package com.hcm.springbootdemo.utils;

import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

public class UploadUtil {
    //定义文件上传路径
//    private static final String BASE_PATH="E:\\springbootdemo\\src\\main\\webapp\\static\\images\\";

    //定义访问图片的路径
    private static final String SERVER_PATH="http://localhost:8080/static/images/";

    public static String upload(MultipartFile file, HttpServletRequest request){

        String BASE_PATH= request.getSession().getServletContext().getRealPath("/static/images/");
        //获得上传文件名称
        String filename = file.getOriginalFilename();
        //为了保证图片名称的唯一性
        String uuid = UUID.randomUUID().toString().replace("-", "");
        //将生成的uuid和filename进行拼接
        String newFilename = uuid+"-"+filename;
        //创建一个文件实例对象
        File image = new File(BASE_PATH,newFilename);
        //对文件进行上传操作
        try {
            file.transferTo(image);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return SERVER_PATH+newFilename;
    }
}
