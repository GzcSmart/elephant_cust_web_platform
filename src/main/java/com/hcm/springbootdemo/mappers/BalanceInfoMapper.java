package com.hcm.springbootdemo.mappers;

import com.hcm.springbootdemo.entity.BalanceInfo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BalanceInfoMapper {
    List<BalanceInfo> balanceById(String customerId);
}
