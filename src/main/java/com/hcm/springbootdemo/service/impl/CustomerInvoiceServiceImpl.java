package com.hcm.springbootdemo.service.impl;

import com.hcm.springbootdemo.entity.CustomerInvoice;
import com.hcm.springbootdemo.mappers.CustomerInvoiceMapper;
import com.hcm.springbootdemo.service.CustomerInvoiceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class CustomerInvoiceServiceImpl implements CustomerInvoiceService {
    @Autowired
    private CustomerInvoiceMapper customerInvoiceMapper;

    @Override
    public CustomerInvoice getInvoiceByCustomerId(String customerId) {
        return customerInvoiceMapper.getInvoiceByCustomerId(customerId);
    }

    @Override
    public Integer updateInvoice(CustomerInvoice customerInvoice) {
        return customerInvoiceMapper.updateInvoice(customerInvoice);
    }

    @Override
    public Integer addInvoice(CustomerInvoice customerInvoice) {
        return customerInvoiceMapper.addInvoice(customerInvoice);
    }
}
