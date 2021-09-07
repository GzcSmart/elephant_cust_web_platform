package com.hcm.springbootdemo.service.impl;

import com.hcm.springbootdemo.entity.CustomerInfo;
import com.hcm.springbootdemo.mappers.CustomerInfoMapper;
import com.hcm.springbootdemo.service.CustomerInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class CustomerInfoServiceImpl implements CustomerInfoService {
    @Autowired
    private CustomerInfoMapper customerInfoMapper;

    @Override
    public CustomerInfo selUser(String customerId) {
        return customerInfoMapper.selUser(customerId);
    }

    @Override
    public int updUser(CustomerInfo customerInfo) {
        return customerInfoMapper.updUser(customerInfo);
    }
}
