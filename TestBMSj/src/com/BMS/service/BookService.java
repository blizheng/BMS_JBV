package com.BMS.service;

import com.BMS.dao.BookDao;
import com.BMS.dao.impl.BookDaoImpl;
import com.BMS.vo.Book;

import java.util.List;

public class BookService {
    private BookDao book = new BookDaoImpl();

    public List<Book> getBookByCategoryID(int category_id) {
        return book.getBookByCategory(category_id);
    }

    public List<Book> findAll(){
        return book.findAll();
    }

    public int addbook(String[] bookinfo){
        return book.addbook(bookinfo);
    }

    public int updatebook(String[] bookinfo){
        return book.updatebook(bookinfo);
    }

    public int dnbook(String book_isbn){
        return book.dnbook(book_isbn);
    }
}
