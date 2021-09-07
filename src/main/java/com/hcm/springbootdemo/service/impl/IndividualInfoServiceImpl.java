package com.hcm.springbootdemo.service.impl;

import com.hcm.springbootdemo.entity.IndividualInfo;
import com.hcm.springbootdemo.mappers.IndividualInfoMapper;
import com.hcm.springbootdemo.service.IndividualInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class IndividualInfoServiceImpl implements IndividualInfoService {
    @Autowired
    private IndividualInfoMapper individualInfoMapper;

    @Override
    public int addIndividualInfo(IndividualInfo individualInfo) {
        return individualInfoMapper.addIndividualInfo(individualInfo);
    }

    @Override
    public IndividualInfo addIndividualById(String customerId) {
        return individualInfoMapper.addIndividualById(customerId);
    }

    @Override
    public int selStatus(String customerId) {
        return individualInfoMapper.selStatus(customerId);
    }

    @Override
    public int updateindividualInfo(IndividualInfo individualInfo) {
        return individualInfoMapper.updateindividualInfo(individualInfo);
    }

}
