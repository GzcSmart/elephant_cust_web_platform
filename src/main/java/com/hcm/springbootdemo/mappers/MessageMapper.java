package com.hcm.springbootdemo.mappers;

import com.hcm.springbootdemo.entity.Message;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface MessageMapper {
    List<Message> selAllMessage(@Param("customerId") String customerId, @Param("start") int start, @Param("pageSize") int pageSize);

    Message selByIdMessage(int id);

    int delMessage(int isDelete, int id);

    int readMessage(int status, int id);

    int getMassageTotal(@Param("customerId") String customerId);
}
