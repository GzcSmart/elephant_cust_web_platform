package com.hcm.springbootdemo.entity;

import lombok.Data;

@Data
public class CustomerInvoiceApply {
    /**
     * 申请记录id
     */
    private String invoiceApplyId;
    /**
     * 企业id
     */
    private String orgId;
    /**
     * 企业名称
     */
    private String orgName;
    /**
     * 发票抬头
     */
    private String invoiceTitle;
    /**
     * 账单id/统计账单id  多个,隔开
     */
    private String billId;
    /**
     * 业务类别
     */
    private String ywCategory;
    /**
     * 开户行
     */
    private String invoiceBank;
    /**
     * 银行卡号
     */
    private String bankCardNumber;
    /**
     * 纳税人资质
     */
    private String taxpayerQualification;
    /**
     * 税务登记号
     */
    private String taxRegisterNumber;
    /**
     * 发票类型: 0 普通发票 1 专用发票
     */
    private Integer invoiceType;
    /**
     * 发票项目
     */
    private String invoiceCategory;
    /**
     * 发票总额
     */
    private String invoiceAmount;
    /**
     * 收货人姓名
     */
    private String receiver;
    /**
     * 收货地址
     */
    private String receivedAddress;
    /**
     * 收货人联系电话
     */
    private String receivedPhone;
    /**
     * 出票方式 0 纸质  1 电子
     */
    private Integer ticketingType;
    /**
     * 是否需要对账单
     */
    private Integer needBill;
    /**
     * 盖章类型
     */
    private String stampType;
    /**
     * 审批状态:0 待审核 1：通过 2：拒绝
     */
    private Integer auditStatus;
    /**
     * 审核人
     */
    private String auditor;
    /**
     * 审核人工号
     */
    private String auditorId;
    /**
     * 审核人部门
     */
    private String auditorDepartment;
    /**
     * 审核时间
     */
    private String auditTime;
    /**
     * 审核备注
     */
    private String auditRemark;
    /**
     * 申请时间
     */
    private String insertTime;
    /**
     * 更新时间
     */
    private String updateTime;
    /**
     * 营业电话
     */
    private String orgMobile;
    /**
     * 营业地址
     */
    private String orgAddress;

    private String customerYwId;

    private int start;

    private int pageSize;
}
