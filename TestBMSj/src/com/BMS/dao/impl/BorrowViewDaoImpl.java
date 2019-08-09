package com.BMS.dao.impl;

import com.BMS.dao.BorrowViewDao;
import com.BMS.dao.JDBCUtil_sqlite;
import com.BMS.vo.BorrowView;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BorrowViewDaoImpl implements BorrowViewDao {

    @Override
    public List<BorrowView> getallbyID(int id){
        List<BorrowView> list = new ArrayList<>();
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet rs = null;
        try {
            connection = JDBCUtil_sqlite.getConnection();
            String sql = "select * from borrowview where user_id=?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, id);
            rs = preparedStatement.executeQuery();
            while (rs.next()) {
                BorrowView borrowview = new BorrowView();
                borrowview.setBook_id(rs.getInt("book_id"));
                borrowview.setBook_name(rs.getString("book_name"));
                borrowview.setBook_author(rs.getString("book_author"));
                borrowview.setBook_price(rs.getDouble("book_price"));
                borrowview.setBook_pub(rs.getString("book_pub"));
                borrowview.setBook_image(rs.getString("book_image"));
                borrowview.setCategory_name(rs.getString("category_name"));
                borrowview.setIsbn(rs.getString("isbn"));
                borrowview.setBook_description(rs.getString("book_description"));
                borrowview.setUser_id(rs.getInt("user_id"));
                borrowview.setBorrow_time(rs.getString("borrow_time"));
                list.add(borrowview);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("borrowview视图表查询出错!!!!!!!");
        } finally {
            JDBCUtil_sqlite.closeConnection(connection);
        }
        return list;
    }
}
