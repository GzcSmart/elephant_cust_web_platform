package com.hcm.springbootdemo.entity;

import lombok.Data;

@Data
public class CustomerInvoice {
    private Integer id;
    private String customerId;
    private String customerName;
    private String invoiceTitle;
    private String taxNum;
    private String bankName;
    private String bankNum;
    private String mobile;
    private String address;
    private String busLicUrl;
    private String custLicUrl;
    private String otherLicUrl;
    private String remark;
    //0审核中,1审核通过,2审核拒绝
    private Integer status;
    //0一般纳税人,1小规模纳税人
    private Integer taxType;
    private String orgId;
    private String orgName;
}
