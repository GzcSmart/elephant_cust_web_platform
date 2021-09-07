package com.hcm.springbootdemo.service.impl;

import com.hcm.springbootdemo.entity.BalanceInfo;
import com.hcm.springbootdemo.mappers.BalanceInfoMapper;
import com.hcm.springbootdemo.service.BalanceInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class BalanceInfoServiceImpl implements BalanceInfoService {
    @Autowired
    private BalanceInfoMapper balanceInfoMapper;

    @Override
    public List<BalanceInfo> balanceById(String customerId) {
        return balanceInfoMapper.balanceById(customerId);
    }
}
