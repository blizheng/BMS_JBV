package com.BMS.dao.impl;


import com.BMS.dao.CategoryDao;
import com.BMS.dao.JDBCUtil_sqlite;
import com.BMS.vo.Category;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class CategoryDaoImpl implements CategoryDao {

    @Override
    public List<Category> findAll() {
        Connection connection = null;
        Statement stat = null;
        List<Category> list = new ArrayList<Category>();
        try {
            connection = JDBCUtil_sqlite.getConnection();
            stat = (Statement) connection.createStatement();
            String sql = "select category_id,category_name,category_description from category";
            ResultSet resultSet = (ResultSet) stat.executeQuery(sql);
            while (resultSet.next()) {
                Category category = new Category();
                category.setCategory_id(resultSet.getInt("category_id"));
                category.setCategory_name(resultSet.getString("category_name"));
                category.setCategory_description(resultSet.getString("category_description"));
                list.add(category);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("category表查询出错!!!!!!!");
        } finally {
            JDBCUtil_sqlite.closeConnection(connection);
        }
        return list;
    }

}
