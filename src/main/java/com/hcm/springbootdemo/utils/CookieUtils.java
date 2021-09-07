package com.hcm.springbootdemo.utils;

import javax.servlet.http.Cookie;

/**
 * 处理和cookie相关的内容
 */
public class CookieUtils {

    /**
     * 传入相关的cookie关键字，查询相关信息 因为cookie可能是数组
     */
    public static Cookie getCookieByName(String name, Cookie[] cookies) {
        if (cookies != null) {
            for (Cookie c : cookies) {
                // 通过名称获取
                if (name.equals(c.getName())) {
                    // 返回
                    return c;
                }
            }
            return null;
        }
        return null;
    }

}
