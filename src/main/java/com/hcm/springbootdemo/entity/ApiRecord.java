package com.hcm.springbootdemo.entity;

import lombok.Data;

import java.util.List;

@Data
public class ApiRecord {
    private Integer id;
    private String customerId;
    private String customerYwId;
    private String apiTotal;
    private String successTimes;
    private String unknownTimes;
    private String failTimes;
    private String totalCost;
    private String testCost;
    private String backCost;
    private String actualCost;
    private String settleTotalPrice;
    private String settleBackPrice;
    private String orgId;
    private String statementDate;
}
