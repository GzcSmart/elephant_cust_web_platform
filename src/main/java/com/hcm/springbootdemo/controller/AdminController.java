package com.hcm.springbootdemo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {
    @RequestMapping("toadmin")
    public String toadmin() {
        return "jsp/admin";
    }
}
