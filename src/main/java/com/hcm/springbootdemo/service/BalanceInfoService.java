package com.hcm.springbootdemo.service;

import com.hcm.springbootdemo.entity.BalanceInfo;

import java.util.List;

public interface BalanceInfoService {
    List<BalanceInfo> balanceById(String customerId);
}
