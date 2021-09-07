package com.hcm.springbootdemo.mappers;

import com.hcm.springbootdemo.entity.ApiRecord;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ApiRecordMapper {
    List<ApiRecord> findAllRecord(String customerId, String statementDate);

    ApiRecord findIdRecord(int id);
}
