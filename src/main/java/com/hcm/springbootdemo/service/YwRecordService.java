package com.hcm.springbootdemo.service;

import com.hcm.springbootdemo.entity.YwRecord;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface YwRecordService {
    List<YwRecord> ywConditionQuery(YwRecord ywRecord);

    List<YwRecord> ywRecordById(@Param("id") int id);
}
