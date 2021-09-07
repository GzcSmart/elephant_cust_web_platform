package com.hcm.springbootdemo.entity;

import lombok.Data;

@Data
public class CustomerAddress {
    private Integer id;
    private String name;
    private String area;
    private String detailedArea;
    private String phone;
    private String telephone;
    private String postalCode;
    private Integer isDefaultAddress;
    private String customerId;
    private String provinceName;
    private String cityName;
    private String districtName;
}
