package com.hcm.springbootdemo.service;

import com.hcm.springbootdemo.entity.IndividualInfo;


public interface IndividualInfoService {
    int addIndividualInfo(IndividualInfo individualInfo);

    IndividualInfo addIndividualById(String customerId);

    int selStatus(String customerId);

    int updateindividualInfo(IndividualInfo individualInfo);
}
