package com.hcm.springbootdemo.service.impl;

import com.hcm.springbootdemo.entity.ApiRecord;
import com.hcm.springbootdemo.mappers.ApiRecordMapper;
import com.hcm.springbootdemo.service.ApiRecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class ApiRecordServiceImpl implements ApiRecordService {
    @Autowired
    private ApiRecordMapper apiRecordMapper;

    @Override
    public List<ApiRecord> findAllRecord(String customerId, String statementDate) {
        return apiRecordMapper.findAllRecord(customerId, statementDate);
    }

    @Override
    public ApiRecord findIdRecord(int id) {
        return apiRecordMapper.findIdRecord(id);
    }
}
