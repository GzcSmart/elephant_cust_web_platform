package com.hcm.springbootdemo.entity;

import com.hcm.springbootdemo.config.ExcelColumn;
import lombok.Data;

@Data
public class YwRecord {
    @ExcelColumn(value = "序号", col = 1)
    private Integer id;
    @ExcelColumn(value = "顾客业务ID", col = 2)
    private String customerYwId;
    @ExcelColumn(value = "流水号", col = 3)
    private String serialNumber;
    @ExcelColumn(value = "返回码", col = 4)
    private String returnCode;
    @ExcelColumn(value = "运营商属性", col = 5)
    private String operator;
    @ExcelColumn(value = "接收手机号", col = 6)
    private String receivingNumber;
    @ExcelColumn(value = "AppID", col = 7)
    private String appId;
    @ExcelColumn(value = "应用名称", col = 8)
    private String appName;
    @ExcelColumn(value = "公司名称", col = 9)
    private String orgName;
    @ExcelColumn(value = "公司Id", col = 10)
    private String orgId;
    @ExcelColumn(value = "开始时间", col = 11)
    private String startTime;
    @ExcelColumn(value = "结束时间", col = 12)
    private String endTime;
    @ExcelColumn(value = "服务类型ID", col = 13)
    private String categoryId;
    @ExcelColumn(value = "消费金额", col = 14)
    private String consumption;
    @ExcelColumn(value = "返回码描述", col = 15)
    private String returnCodeDescribe;
}
