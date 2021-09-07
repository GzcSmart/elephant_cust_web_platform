package com.hcm.springbootdemo.mappers;

import com.hcm.springbootdemo.entity.IndividualInfo;
import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface IndividualInfoMapper {
    int addIndividualInfo(IndividualInfo individualInfo);

    IndividualInfo addIndividualById(String customerId);

    int selStatus(String customerId);

    int updateindividualInfo(IndividualInfo individualInfo);
}
