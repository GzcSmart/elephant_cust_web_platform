package com.hcm.springbootdemo.service.impl;

import com.hcm.springbootdemo.entity.YwInfo;
import com.hcm.springbootdemo.mappers.YwInfoMapper;
import com.hcm.springbootdemo.service.YwInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class YwInfoServiceImpl implements YwInfoService {
    @Autowired
    private YwInfoMapper ywInfoMapper;

    @Override
    public List<YwInfo> ywByCustomerId(String customerId) {
        return ywInfoMapper.ywByCustomerId(customerId);
    }

    @Override
    public int updateYwInfo(int systemYwId, int status) {
        return ywInfoMapper.updateYwInfo(systemYwId, status);
    }

    @Override
    public List<YwInfo> getYwInfoList(String customerId) {
        //默认size传5条
        int size = 5;
        return ywInfoMapper.getYwInfoList(customerId, size);
    }

    @Override
    public List<YwInfo> getAllYwInfoList(Integer parentId, String customerYwId) {
        return ywInfoMapper.getAllYwInfoList(parentId, customerYwId);
    }

    @Override
    public List<YwInfo> selAllYwInfoList() {
        return ywInfoMapper.selAllYwInfoList();
    }

    @Override
    public List<YwInfo> ywByCustomerOptionId(String customerYwId) {
        return ywInfoMapper.ywByCustomerOptionId(customerYwId);
    }

    @Override
    public List<YwInfo> selConditionYw(Integer parentId, String ywName, int currentPage, int pageSize) {
        int start = (currentPage - 1) * pageSize;
        return ywInfoMapper.selConditionYw(parentId, ywName, start, pageSize);
    }

    @Override
    public List<YwInfo> selConditionId(Integer parentId) {
        return ywInfoMapper.selConditionId(parentId);
    }

    @Override
    public int getTotalNum(Integer parentId, String ywName) {
        return ywInfoMapper.getTotalNum(parentId, ywName);
    }

    @Override
    public int updPwd(int systemYwId, String customerYwPwd) {
        return ywInfoMapper.updPwd(systemYwId, customerYwPwd);
    }

}
