package com.hcm.springbootdemo.service.impl;

import com.hcm.springbootdemo.entity.YwInfoCategory;
import com.hcm.springbootdemo.mappers.YwInfoCategoryMapper;
import com.hcm.springbootdemo.service.YwInfoCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class YwInfoCategoryServiceImpl implements YwInfoCategoryService {
    @Autowired
    private YwInfoCategoryMapper ywInfoCategoryMapper;

    @Override
    public List<YwInfoCategory> selAllYwCategory() {
        return ywInfoCategoryMapper.selAllYwCategory();
    }

    @Override
    public List<YwInfoCategory> selYwCategoryById(int id) {
        return ywInfoCategoryMapper.selYwCategoryById(id);
    }
}
