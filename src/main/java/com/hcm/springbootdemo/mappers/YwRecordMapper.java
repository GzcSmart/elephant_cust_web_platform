package com.hcm.springbootdemo.mappers;

import com.hcm.springbootdemo.entity.YwRecord;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface YwRecordMapper {
    List<YwRecord> ywConditionQuery(YwRecord ywRecord);

    List<YwRecord> ywRecordById(@Param("id") int id);
}
