package com.BMS.dao.impl;

import com.BMS.dao.BookViewDao;
import com.BMS.dao.JDBCUtil_sqlite;
import com.BMS.vo.BookView;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BookViewDaoImpl implements BookViewDao {

    @Override
    public List<BookView> getAll() {
        List<BookView> list = new ArrayList<>();
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet rs = null;
        try {
            connection = JDBCUtil_sqlite.getConnection();
            String sql = "select * from bookview";
            preparedStatement = connection.prepareStatement(sql);
            rs = preparedStatement.executeQuery();
            while (rs.next()) {
                BookView bookview = new BookView();
                bookview.setBook_id(rs.getInt("book_id"));
                bookview.setBook_name(rs.getString("book_name"));
                bookview.setBook_author(rs.getString("book_author"));
                bookview.setBook_price(rs.getDouble("book_price"));
                bookview.setBook_pub(rs.getString("book_pub"));
                bookview.setBook_image(rs.getString("book_image"));
                bookview.setBook_num(rs.getInt("book_num"));
                bookview.setCategory_name(rs.getString("category_name"));
                bookview.setIsbn(rs.getString("isbn"));
                bookview.setBook_description(rs.getString("book_description"));
                list.add(bookview);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("bookview视图表查询出错!!!!!!!");
        } finally {
            JDBCUtil_sqlite.closeConnection(connection);
        }
        return list;
    }
}
