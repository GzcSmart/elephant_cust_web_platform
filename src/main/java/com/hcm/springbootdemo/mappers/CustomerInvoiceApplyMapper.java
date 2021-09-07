package com.hcm.springbootdemo.mappers;

import com.hcm.springbootdemo.entity.CustomerInvoiceApply;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface CustomerInvoiceApplyMapper {
    List<CustomerInvoiceApply> selAllInvoiceApply();

    List<CustomerInvoiceApply> selConditionApply(CustomerInvoiceApply customerInvoiceApply);

    int insInvoiceApply(CustomerInvoiceApply customerInvoiceApply);

    CustomerInvoiceApply selAllInvoiceApplyById(String invoiceApplyId);

    int getInvoiceTotal(CustomerInvoiceApply customerInvoiceApply);
}
