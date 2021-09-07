package com.hcm.springbootdemo.entity;

import lombok.Data;

import java.io.Serializable;

@Data
public class OrgInfo implements Serializable {

    private Integer sn;
    /**
     * 企业id
     */
    private String orgId;
    /**
     * 单位类型0：企业 1：事业单位 2：民办非企业单位 3：个体工商户 4：社会团体 5：党政及国家机关
     */
    private Integer unitType;
    /**
     * 企业名称
     */
    private String orgName;
    /**
     * 企业所属用户id
     */
    private String customerId;
    /**
     * 注册号或证号，全局唯一
     */
    private String registerCode;
    /**
     * 组织机构代码，可为空
     */
    private String orgCode;
    /**
     * 企业等级
     */
    private Integer orgLevel;
    /**
     * 企业域名
     */
    private String orgDomain;
    /**
     * 地址
     */
    private String orgAddress;
    /**
     * 运营范围
     */
    private String orgScope;
    /**
     * 有效期
     */
    private String dueDate;
    /**
     * 企业固定电话（如：0595-23359110）,全局唯一
     */
    private String telPhone;
    /**
     * 审核通知手机
     */
    private String tempPhone;
    /**
     * 企业审核状态
     */
    private Integer auditStatus;
    /**
     * 最后审核人ID
     */
    private String adminId;
    /**
     * 企业最大坐席
     */
    private Integer maxExt;
    /**
     * 企业有效状态0：正常1：异常
     */
    private Integer orgStatus;
    /**
     * 逻辑删除状态0：正常1：逻辑删除
     */
    private Integer delStatus;
    private String createTime;
    private String updateTime;

    /**
     * 付费类型,0:预付费(默认),1:后付费
     */
    private Integer payType;
}
