package com.BMS.dao.impl;

import com.BMS.dao.JDBCUtil_sqlite;
import com.BMS.dao.UserDao;
import com.BMS.vo.User;

import java.util.List;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class UserDaoImpl implements UserDao {
    @Override
    public List<User> getUserbyUserID(int user_id){
        List<User> list = new ArrayList<>();
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet rs = null;
        try {
            connection = JDBCUtil_sqlite.getConnection();
            String sql = "select * from user where user_id = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, user_id);
            rs = preparedStatement.executeQuery();
            while (rs.next()) {
                User user=new User();
                user.setUser_id(rs.getInt("user_id"));
                user.setUser_name(rs.getString("user_name"));
                user.setUser_passwd(rs.getString("user_passwd"));
                user.setUser_images(rs.getString("user_image"));
                if(rs.getString("user_sex").equals("1"))
                    user.setUser_sex("男");
                else user.setUser_sex("女");
                user.setUser_phone(rs.getString("user_phone"));
                user.setUser_email(rs.getString("user_email"));
                user.setUser_address(rs.getString("user_address"));
                user.setUser_description(rs.getString("user_description"));
                list.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("user表查询出错!!!!!!!");
        } finally {
            JDBCUtil_sqlite.closeConnection(connection);
        }
        return list;
    }

}
