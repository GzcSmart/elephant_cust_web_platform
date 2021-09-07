package com.hcm.springbootdemo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/index")
public class IndexController {

    @RequestMapping("showSort")
    public String showSort() {
        return "jsp/systemYwSort";
    }

    @RequestMapping("showApi")
    public String showApi(String type) {
        System.out.println(type);
        return "jsp/api" + type;
    }

    @RequestMapping("showSort2")
    public String showSort2() {
        return "jsp/systemYwSort2";
    }

}
