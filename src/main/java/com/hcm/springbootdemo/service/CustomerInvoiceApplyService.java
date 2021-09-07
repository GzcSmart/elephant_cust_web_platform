package com.hcm.springbootdemo.service;

import com.hcm.springbootdemo.entity.CustomerInvoiceApply;

import java.util.List;

public interface CustomerInvoiceApplyService {
    List<CustomerInvoiceApply> selAllInvoiceApply();

    List<CustomerInvoiceApply> selConditionApply(CustomerInvoiceApply customerInvoiceApply, int currentPage, int pageSize);

    int insInvoiceApply(CustomerInvoiceApply customerInvoiceApply);

    CustomerInvoiceApply selAllInvoiceApplyById(String invoiceApplyId);

    int getInvoiceTotal(CustomerInvoiceApply customerInvoiceApply);
}
