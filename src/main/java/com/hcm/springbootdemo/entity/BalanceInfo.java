package com.hcm.springbootdemo.entity;

import lombok.Data;

@Data
public class BalanceInfo {
    private Integer id;
    private String orgId;
    private String orgName;
    private String orgBalance;
    private Integer orgStatus;
    private String customerId;
    private String childOrgId;
}
