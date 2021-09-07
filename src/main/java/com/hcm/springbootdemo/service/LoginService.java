package com.hcm.springbootdemo.service;

import com.hcm.springbootdemo.entity.CustomerInfo;
import org.apache.ibatis.annotations.Param;


public interface LoginService {
    CustomerInfo login(@Param("customerName") String username, @Param("password") String password);

    CustomerInfo phoneLogin(@Param("customerTel") String phone);

    int insUser(CustomerInfo customerInfo);
}
