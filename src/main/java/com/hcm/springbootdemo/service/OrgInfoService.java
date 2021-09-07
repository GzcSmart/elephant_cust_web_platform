package com.hcm.springbootdemo.service;

import com.hcm.springbootdemo.entity.OrgInfo;

public interface OrgInfoService {
    OrgInfo getOrgInfoByCustomerId(String customerId);
}
