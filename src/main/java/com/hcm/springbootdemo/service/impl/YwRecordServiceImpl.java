package com.hcm.springbootdemo.service.impl;

import com.hcm.springbootdemo.entity.YwRecord;
import com.hcm.springbootdemo.mappers.YwRecordMapper;
import com.hcm.springbootdemo.service.YwInfoService;
import com.hcm.springbootdemo.service.YwRecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class YwRecordServiceImpl implements YwRecordService {
    @Autowired
    private YwRecordMapper ywRecordMapper;

    @Override
    public List<YwRecord> ywConditionQuery(YwRecord ywRecord) {
        System.out.println(ywRecordMapper.ywConditionQuery(ywRecord));
        return ywRecordMapper.ywConditionQuery(ywRecord);
    }

    @Override
    public List<YwRecord> ywRecordById(int id) {
        return ywRecordMapper.ywRecordById(id);
    }
}
