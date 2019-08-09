package com.BMS.service;

import com.BMS.dao.CategoryDao;
import com.BMS.dao.impl.CategoryDaoImpl;
import com.BMS.vo.Category;

import java.util.List;

public class CategoryService {
    private CategoryDao category = new CategoryDaoImpl();

    public List<Category> findAll() {
        return category.findAll();
    }

}