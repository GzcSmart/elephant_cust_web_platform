package com.hcm.springbootdemo.mappers;

import com.hcm.springbootdemo.entity.CverificationCusAppInfo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface CverificationCusAppInfoMapper {
    List<CverificationCusAppInfo> cverificationById(String customerId);

    List<CverificationCusAppInfo> selAppName(@Param("appName") String appName);

    List<CverificationCusAppInfo> selAppId(@Param("appId") String appId);

    List<CverificationCusAppInfo> selCondition(CverificationCusAppInfo cverificationCusAppInfo);

    CverificationCusAppInfo cverificationId(@Param("id") int id);

    int updCverification(CverificationCusAppInfo cverificationCusAppInfo);

    int addCverification(CverificationCusAppInfo cverificationCusAppInfo);

    int delCverification(@Param("id") int id);
}
