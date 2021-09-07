package com.hcm.springbootdemo.entity;

import lombok.Data;

@Data
public class IndividualInfo {
    private String customerId;
    private Integer orgId;
    //1企业
    private Integer unitType;
    private String orgName;
    private String registerCode;
    private String orgAddress;
    private String telPhone;
    private String businessScope;
    private String businessTerm;
    private String tempPhone;
    private String recommender;
    private String orgImg;
    //0未通过，1通过，2审核中
    private String auditStatus;
}
