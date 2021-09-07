package com.hcm.springbootdemo.service;

import com.hcm.springbootdemo.entity.CustomerInfo;

public interface CustomerInfoService {
    CustomerInfo selUser(String customerId);

    int updUser(CustomerInfo customerInfo);
}
