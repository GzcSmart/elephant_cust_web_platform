package com.hcm.springbootdemo.entity;

import lombok.Data;

@Data
public class CustomerInfo {
    private String customerId;
    private String customerName;
    private String password;
    private String customerTel;
    private String email;
    private String mobile;
    private Integer status;
    private Double balance;
    private String lastOperatorId;
    private String headImgUrl;
    private Integer auditStatus;
    private Integer cashBackStatus;
    private Integer cashFreeAudit;
    private String orgName;
}
