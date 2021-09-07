package com.hcm.springbootdemo.service.impl;

import com.hcm.springbootdemo.entity.CustomerInfo;
import com.hcm.springbootdemo.mappers.LoginMapper;
import com.hcm.springbootdemo.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class LoginServiceImpl implements LoginService {
    @Autowired
    private LoginMapper loginMapper;

    @Override
    public CustomerInfo login(String username, String password) {
        return loginMapper.login(username, password);
    }

    @Override
    public CustomerInfo phoneLogin(String phone) {
        return loginMapper.phoneLogin(phone);
    }

    @Override
    public int insUser(CustomerInfo customerInfo) {
        return loginMapper.insUser(customerInfo);
    }
}
