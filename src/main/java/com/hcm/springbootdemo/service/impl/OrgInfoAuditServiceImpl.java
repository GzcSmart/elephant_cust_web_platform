package com.hcm.springbootdemo.service.impl;

import com.hcm.springbootdemo.entity.OrgInfo;
import com.hcm.springbootdemo.mappers.OrgInfoAuditMapper;
import com.hcm.springbootdemo.service.OrgInfoAuditService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class OrgInfoAuditServiceImpl implements OrgInfoAuditService {
    @Autowired
    private OrgInfoAuditMapper orgInfoAuditMapper;

    @Override
    public OrgInfo getOrgInfoAuditById(String customerId) {
        return orgInfoAuditMapper.getOrgInfoAuditById(customerId);
    }
}
