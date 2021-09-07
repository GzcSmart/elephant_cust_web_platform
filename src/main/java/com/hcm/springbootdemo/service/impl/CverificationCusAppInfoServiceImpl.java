package com.hcm.springbootdemo.service.impl;

import com.hcm.springbootdemo.entity.CverificationCusAppInfo;
import com.hcm.springbootdemo.mappers.CverificationCusAppInfoMapper;
import com.hcm.springbootdemo.service.CverificationCusAppInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class CverificationCusAppInfoServiceImpl implements CverificationCusAppInfoService {
    @Autowired
    private CverificationCusAppInfoMapper cusAppInfoMapper;

    @Override
    public List<CverificationCusAppInfo> cverificationById(String customerId) {
        return cusAppInfoMapper.cverificationById(customerId);
    }

    @Override
    public List<CverificationCusAppInfo> selAppName(String appName) {
        return cusAppInfoMapper.selAppName(appName);
    }

    @Override
    public List<CverificationCusAppInfo> selAppId(String appId) {
        return cusAppInfoMapper.selAppId(appId);
    }

    @Override
    public List<CverificationCusAppInfo> selCondition(CverificationCusAppInfo cverificationCusAppInfo) {
        return cusAppInfoMapper.selCondition(cverificationCusAppInfo);
    }

    @Override
    public CverificationCusAppInfo cverificationId(int id) {
        return cusAppInfoMapper.cverificationId(id);
    }

    @Override
    public int updCverification(CverificationCusAppInfo cverificationCusAppInfo) {
        return cusAppInfoMapper.updCverification(cverificationCusAppInfo);
    }

    @Override
    public int addCverification(CverificationCusAppInfo cverificationCusAppInfo) {
        return cusAppInfoMapper.addCverification(cverificationCusAppInfo);
    }

    @Override
    public int delCverification(int id) {
        return cusAppInfoMapper.delCverification(id);
    }
}
