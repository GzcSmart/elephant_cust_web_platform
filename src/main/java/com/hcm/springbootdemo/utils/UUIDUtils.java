package com.hcm.springbootdemo.utils;

import java.util.UUID;

/**
 * 唯一通用识别码
 */
public class UUIDUtils {

    public static String getUUID() {
        return UUID.randomUUID().toString().replace("-", "")+ UUID.randomUUID().toString().replace("-","");
    }
}