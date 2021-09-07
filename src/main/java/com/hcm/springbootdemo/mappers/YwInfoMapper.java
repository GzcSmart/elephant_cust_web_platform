package com.hcm.springbootdemo.mappers;

import com.hcm.springbootdemo.entity.YwInfo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface YwInfoMapper {
    List<YwInfo> ywByCustomerId(String customerId);

    int updateYwInfo(int systemYwId, int status);

    List<YwInfo> getYwInfoList(@Param("customerId") String customerId, @Param("size") int size);

    List<YwInfo> getAllYwInfoList(@Param("parentId") Integer parentId, @Param("customerYwId") String customerYwId);

    List<YwInfo> selAllYwInfoList();

    List<YwInfo> ywByCustomerOptionId(@Param("customerYwId") String customerYwId);

    List<YwInfo> selConditionYw(@Param("parentId") Integer parentId, @Param("ywName") String ywName, @Param("start") int start, @Param("pageSize") int pageSize);

    List<YwInfo> selConditionId(@Param("parentId") Integer parentId);

    int getTotalNum(@Param("parentId") Integer parentId, @Param("ywName") String ywName);

    int updPwd(@Param("systemYwId") int systemYwId, @Param("customerYwPwd") String customerYwPwd);
}
