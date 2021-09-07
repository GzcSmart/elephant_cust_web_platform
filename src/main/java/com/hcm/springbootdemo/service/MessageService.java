package com.hcm.springbootdemo.service;

import com.hcm.springbootdemo.entity.Message;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface MessageService {
    List<Message> selAllMessage(String customerId, int currentPage, int pageSize);

    Message selByIdMessage(int id);

    int delMessage(int isDelete, int id);

    int readMessage(int status, int id);

    int getMassageTotal(@Param("customerId") String customerId);
}
