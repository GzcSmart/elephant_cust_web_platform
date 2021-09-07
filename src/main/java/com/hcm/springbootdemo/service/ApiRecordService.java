package com.hcm.springbootdemo.service;

import com.hcm.springbootdemo.entity.ApiRecord;

import java.util.List;

public interface ApiRecordService {
    List<ApiRecord> findAllRecord(String customerId, String statementDate);

    ApiRecord findIdRecord(int id);
}
