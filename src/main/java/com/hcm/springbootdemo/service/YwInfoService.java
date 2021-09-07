package com.hcm.springbootdemo.service;

import com.hcm.springbootdemo.entity.YwInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface YwInfoService {
    List<YwInfo> ywByCustomerId(String customerId);

    int updateYwInfo(int systemYwId, int status);

    List<YwInfo> getYwInfoList(@Param("customerId") String customerId);

    List<YwInfo> getAllYwInfoList(Integer parentId, String customerYwId);

    List<YwInfo> selAllYwInfoList();

    List<YwInfo> ywByCustomerOptionId(String customerYwId);

    List<YwInfo> selConditionYw(Integer parentId, String ywName, int currentPage, int pageSize);

    List<YwInfo> selConditionId(Integer parentId);

    int getTotalNum(@Param("parentId") Integer parentId, @Param("ywName") String ywName);

    int updPwd(@Param("systemYwId") int systemYwId, @Param("customerYwPwd") String customerYwPwd);
}
