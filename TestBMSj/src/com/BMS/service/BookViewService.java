package com.BMS.service;

import com.BMS.dao.BookViewDao;
import com.BMS.dao.impl.BookViewDaoImpl;
import com.BMS.vo.BookView;

import java.util.List;

public class BookViewService {
    private BookViewDao bookview=new BookViewDaoImpl();

    public List<BookView> getAll() {
        return bookview.getAll();
    }
}
