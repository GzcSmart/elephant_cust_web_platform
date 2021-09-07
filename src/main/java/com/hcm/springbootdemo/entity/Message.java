package com.hcm.springbootdemo.entity;

import lombok.Data;

@Data
public class Message {
    /**
     * 主键id
     */
    private Integer id;

    /**
     * 客户账号
     */
    private String customerId;

    /**
     * 非空，消息标题
     */
    private String msgTitle;

    /**
     * 消息类型，见配置表
     */
    private String msgType;

    /**
     * 状态非空默认0，是否已读，0：否 1是
     */
    private Integer status;

    /**
     * 非空默认0，是否删除，0：否 1、逻辑删除
     */
    private Integer isDelete;

    /**
     * 非空，消息创建人,
     */
    private String createdBy;

    /**
     * 非空，更新时间，数据库刷新时自动更新
     */
    private String updateTime;

    /**
     * 非空，插入时间
     */
    private String insertTime;

    /**
     * 消息内容
     */
    private String msg;

}
