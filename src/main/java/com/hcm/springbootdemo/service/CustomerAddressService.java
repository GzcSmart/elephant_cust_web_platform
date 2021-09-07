package com.hcm.springbootdemo.service;

import com.hcm.springbootdemo.entity.CustomerAddress;

import java.util.List;

public interface CustomerAddressService {
    List<CustomerAddress> selAllAddress(String customerId);

    int insAddress(CustomerAddress customerAddress);

    int updAddress(CustomerAddress customerAddress);

    CustomerAddress selIdAddress(int id);

    int delIdAddress(int id);
}
