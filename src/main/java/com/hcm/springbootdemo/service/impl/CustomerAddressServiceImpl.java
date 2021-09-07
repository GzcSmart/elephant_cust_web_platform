package com.hcm.springbootdemo.service.impl;

import com.hcm.springbootdemo.entity.CustomerAddress;
import com.hcm.springbootdemo.mappers.CustomerAddressMapper;
import com.hcm.springbootdemo.service.CustomerAddressService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class CustomerAddressServiceImpl implements CustomerAddressService {
    @Autowired
    private CustomerAddressMapper customerAddressMapper;

    @Override
    public List<CustomerAddress> selAllAddress(String customerId) {
        return customerAddressMapper.selAllAddress(customerId);
    }

    @Override
    public int insAddress(CustomerAddress customerAddress) {
        return customerAddressMapper.insAddress(customerAddress);
    }

    @Override
    public int updAddress(CustomerAddress customerAddress) {
        return customerAddressMapper.updAddress(customerAddress);
    }

    @Override
    public CustomerAddress selIdAddress(int id) {
        return customerAddressMapper.selIdAddress(id);
    }

    @Override
    public int delIdAddress(int id) {
        return customerAddressMapper.delIdAddress(id);
    }
}
