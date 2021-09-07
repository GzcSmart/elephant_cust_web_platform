package com.hcm.springbootdemo.entity;

import lombok.Data;

@Data
public class YwInfo {
    private Integer systemYwId;
    private String categoryName;
    private String ywName;
    private String customerYwId;
    private String customerYwPwd;
    private Integer status;
    private String customerId;
    private Integer parentId;
}
