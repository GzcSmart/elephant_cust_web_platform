package com.hcm.springbootdemo.mappers;

import com.hcm.springbootdemo.entity.CustomerInfo;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CustomerInfoMapper {
    CustomerInfo selUser(String customerId);

    int updUser(CustomerInfo customerInfo);
}
