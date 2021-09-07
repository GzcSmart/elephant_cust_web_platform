package com.hcm.springbootdemo.mappers;

import com.hcm.springbootdemo.entity.OrgInfo;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface OrgInfoAuditMapper {
    OrgInfo getOrgInfoAuditById(String customerId);
}
