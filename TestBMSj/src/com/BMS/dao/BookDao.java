package com.BMS.dao;

import com.BMS.vo.Book;

import java.util.List;

public interface BookDao {
    public List<Book> getBookByCategory(int category_id);
    public List<Book> findAll();
}
