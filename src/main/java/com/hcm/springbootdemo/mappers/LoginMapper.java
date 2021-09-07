package com.hcm.springbootdemo.mappers;

import com.hcm.springbootdemo.entity.CustomerInfo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;


@Mapper
public interface LoginMapper {
    CustomerInfo login(@Param("customerName") String username, @Param("password") String password);

    CustomerInfo phoneLogin(@Param("customerTel") String phone);

    int insUser(CustomerInfo customerInfo);
}
