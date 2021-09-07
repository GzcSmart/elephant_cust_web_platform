package com.hcm.springbootdemo.mappers;

import com.fasterxml.jackson.annotation.JsonTypeInfo;
import com.hcm.springbootdemo.entity.CustomerAddress;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CustomerAddressMapper {
    List<CustomerAddress> selAllAddress(String customerId);

    int insAddress(CustomerAddress customerAddress);

    int updAddress(CustomerAddress customerAddress);

    CustomerAddress selIdAddress(int id);

    int delIdAddress(int id);
}
