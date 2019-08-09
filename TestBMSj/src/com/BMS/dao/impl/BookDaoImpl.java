package com.BMS.dao.impl;

import com.BMS.dao.BookDao;
import com.BMS.dao.JDBCUtil_sqlite;

import com.BMS.vo.Book;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BookDaoImpl implements BookDao {
    @Override
    public List<Book> getBookByCategory(int category_id) {
        List<Book> list = new ArrayList<>();
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet rs = null;
        try {
            connection = JDBCUtil_sqlite.getConnection();
            String sql = "select book_id,book_name,book_author,book_price,book_pub,book_image,book_num,category_id,isbn,book_description from book where category_id = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, category_id);
            rs = preparedStatement.executeQuery();

            while (rs.next()) {
                Book book = new Book();
                book.setBook_id(rs.getInt("book_id"));
                book.setBook_name(rs.getString("book_name"));
                book.setBook_author(rs.getString("book_author"));
                book.setBook_price(rs.getDouble("book_price"));
                book.setBook_pub(rs.getString("book_pub"));
                book.setBook_image(rs.getString("book_image"));
                book.setBook_num(rs.getInt("book_num"));
                book.setCategory_id(rs.getString("category_id"));
                book.setIsbn(rs.getString("isbn"));
                book.setBook_description(rs.getString("book_description"));
                list.add(book);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("book表查询出错!!!!!!!");
        } finally {
            JDBCUtil_sqlite.closeConnection(connection);
        }
        return list;
    }

    @Override
    public List<Book> findAll() {
        List<Book> list = new ArrayList<>();
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet rs = null;
        try {
            connection = JDBCUtil_sqlite.getConnection();
            String sql = "select * from book";
            preparedStatement = connection.prepareStatement(sql);
            rs = preparedStatement.executeQuery();
            while (rs.next()) {
                Book book = new Book();
                book.setBook_id(rs.getInt("book_id"));
                book.setBook_name(rs.getString("book_name"));
                book.setBook_author(rs.getString("book_author"));
                book.setBook_price(rs.getDouble("book_price"));
                book.setBook_pub(rs.getString("book_pub"));
                book.setBook_image(rs.getString("book_image"));
                book.setBook_num(rs.getInt("book_num"));
                book.setCategory_id(rs.getString("category_id"));
                book.setIsbn(rs.getString("isbn"));
                book.setBook_description(rs.getString("book_description"));
                list.add(book);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("book表查询出错!!!!!!!");
        } finally {
            JDBCUtil_sqlite.closeConnection(connection);
        }
        return list;
    }
}
