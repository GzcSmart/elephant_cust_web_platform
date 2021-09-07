package com.hcm.springbootdemo.service;

import com.hcm.springbootdemo.entity.CustomerInvoice;
import org.apache.ibatis.annotations.Param;

public interface CustomerInvoiceService {
    CustomerInvoice getInvoiceByCustomerId(@Param("customerId") String customerId);

    Integer updateInvoice(@Param("invoice") CustomerInvoice customerInvoice);

    Integer addInvoice(@Param("customerInvoiceVO") CustomerInvoice customerInvoice);
}
