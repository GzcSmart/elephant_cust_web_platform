package com.hcm.springbootdemo.service.impl;

import com.hcm.springbootdemo.entity.CustomerInvoiceApply;
import com.hcm.springbootdemo.mappers.CustomerInvoiceApplyMapper;
import com.hcm.springbootdemo.service.CustomerInvoiceApplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class CustomerInvoiceApplyServiceImpl implements CustomerInvoiceApplyService {
    @Autowired
    private CustomerInvoiceApplyMapper customerInvoiceApplyMapper;

    @Override
    public List<CustomerInvoiceApply> selAllInvoiceApply() {
        return customerInvoiceApplyMapper.selAllInvoiceApply();
    }

    @Override
    public List<CustomerInvoiceApply> selConditionApply(CustomerInvoiceApply customerInvoiceApply, int currentPage, int pageSize) {
        int start = (currentPage - 1) * pageSize;
        customerInvoiceApply.setStart(start);
        customerInvoiceApply.setPageSize(pageSize);
        return customerInvoiceApplyMapper.selConditionApply(customerInvoiceApply);
    }

    @Override
    public int insInvoiceApply(CustomerInvoiceApply customerInvoiceApply) {
        return customerInvoiceApplyMapper.insInvoiceApply(customerInvoiceApply);
    }

    @Override
    public CustomerInvoiceApply selAllInvoiceApplyById(String invoiceApplyId) {
        return customerInvoiceApplyMapper.selAllInvoiceApplyById(invoiceApplyId);
    }

    @Override
    public int getInvoiceTotal(CustomerInvoiceApply customerInvoiceApply) {
        return customerInvoiceApplyMapper.getInvoiceTotal(customerInvoiceApply);
    }
}
