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

    public int addbook(String[] bookinfo){
        Connection connection=null;
        PreparedStatement preparedStatement1 = null;
        PreparedStatement preparedStatement = null;
        int temp=1;
        try {
                connection = JDBCUtil_sqlite.getConnection();
            if(bookinfo.length==10) {
                String sql1="select count(*) from book where isbn=?";
                preparedStatement1 = connection.prepareStatement(sql1);
                preparedStatement1.setString(1,bookinfo[8]);
                ResultSet rs1=preparedStatement1.executeQuery();
                while (rs1.next()){
                    temp=rs1.getInt("count(*)");
                }
                if(temp==0){
                    String sql2 = "insert into book values(?,?,?,?,?,?,?,?,?,?)";
                    preparedStatement = connection.prepareStatement(sql2);
                    preparedStatement.setInt(1,Integer.parseInt( bookinfo[0]));
                    preparedStatement.setString(2, bookinfo[1]);
                    preparedStatement.setString(3, bookinfo[2]);
                    preparedStatement.setString(4, bookinfo[3]);
                    preparedStatement.setString(5, bookinfo[4]);
                    preparedStatement.setString(6, bookinfo[5]);
                    preparedStatement.setString(7, bookinfo[6]);
                    preparedStatement.setString(8, bookinfo[7]);
                    preparedStatement.setString(9, bookinfo[8]);
                    preparedStatement.setString(10, bookinfo[9]);
                    int rs = preparedStatement.executeUpdate();
                    if (rs > 0)
                        return 1;
                    else return 2;
                }
                else return 3;
            }
            else return 0;
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            JDBCUtil_sqlite.closeConnection(connection);
        }
        return 0;
    }

    public int updatebook(String[] bookinfo){
        Connection connection=null;
        PreparedStatement preparedStatement = null;
        try {
            connection = JDBCUtil_sqlite.getConnection();
            String sql = "update book set book_name=?,book_author=?,book_price=?," +
                    "book_pub=?,book_image=?,book_num=?,category_id=?,book_description=? " +
                    "where isbn=?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1,bookinfo[1]);
            preparedStatement.setString(2,bookinfo[2]);
            preparedStatement.setString(3,bookinfo[3]);
            preparedStatement.setString(4,bookinfo[4]);
            preparedStatement.setString(5,bookinfo[5]);
            preparedStatement.setString(6,bookinfo[6]);
            preparedStatement.setString(7,bookinfo[7]);
            preparedStatement.setString(8,bookinfo[9]);
            preparedStatement.setString(9,bookinfo[8]);
            int rs = preparedStatement.executeUpdate();
                if(rs>0)
                    return 1;
                else return 2;
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            JDBCUtil_sqlite.closeConnection(connection);
        }
        return 0;
    }

    public int dnbook(String book_isbn){
        Connection connection=null;
        PreparedStatement preparedStatement = null;
        try {
            connection = JDBCUtil_sqlite.getConnection();
            String sql = "update book set book_num='0' where isbn=?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1,book_isbn);
            int rs = preparedStatement.executeUpdate();
            if(rs>0)
                return 1;
            else return 2;
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            JDBCUtil_sqlite.closeConnection(connection);
        }
        return 0;
    }
}
