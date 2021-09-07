package com.hcm.springbootdemo.service.impl;

import com.hcm.springbootdemo.entity.Message;
import com.hcm.springbootdemo.mappers.MessageMapper;
import com.hcm.springbootdemo.service.MessageService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class MessageServiceImpl implements MessageService {
    @Autowired
    private MessageMapper messageMapper;

    @Override
    public List<Message> selAllMessage(String customerId, int currentPage, int pageSize) {
        int start = (currentPage - 1) * pageSize;
        return messageMapper.selAllMessage(customerId, start, pageSize);
    }

    @Override
    public Message selByIdMessage(int id) {
        return messageMapper.selByIdMessage(id);
    }

    @Override
    public int delMessage(int isDelete, int id) {
        return messageMapper.delMessage(isDelete, id);
    }

    @Override
    public int readMessage(int status, int id) {
        return messageMapper.readMessage(status, id);
    }

    @Override
    public int getMassageTotal(String customerId) {
        return messageMapper.getMassageTotal(customerId);
    }
}
