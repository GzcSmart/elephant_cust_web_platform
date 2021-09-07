package com.hcm.springbootdemo.entity;

import lombok.Data;

@Data
public class CverificationCusAppInfo {
    private Integer id;
    private String appPlatform;
    private String appName;
    private String appId;
    private String customerId;
    private String systemYwId;
    //0 审核拒绝 1 审核通过 2 审核中
    private Integer auditStatus;
    private String appDescription;
    private String appImg;
}
