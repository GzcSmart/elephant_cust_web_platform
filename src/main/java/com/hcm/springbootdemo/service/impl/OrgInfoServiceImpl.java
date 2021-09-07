package com.hcm.springbootdemo.service.impl;

import com.hcm.springbootdemo.entity.OrgInfo;
import com.hcm.springbootdemo.mappers.OrgInfoMapper;
import com.hcm.springbootdemo.service.OrgInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class OrgInfoServiceImpl implements OrgInfoService {

    @Autowired
    private OrgInfoMapper orgInfoMapper;

    @Override
    public OrgInfo getOrgInfoByCustomerId(String customerId) {
        return orgInfoMapper.getOrgInfoByCustomerId(customerId);
    }
}
