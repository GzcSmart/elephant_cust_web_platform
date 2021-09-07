package com.hcm.springbootdemo.mappers;

import com.hcm.springbootdemo.entity.CustomerInvoice;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface CustomerInvoiceMapper {
    CustomerInvoice getInvoiceByCustomerId(@Param("customerId") String customerId);

    Integer updateInvoice(@Param("invoice") CustomerInvoice customerInvoice);

    Integer addInvoice(@Param("customerInvoiceVO") CustomerInvoice customerInvoice);
}
