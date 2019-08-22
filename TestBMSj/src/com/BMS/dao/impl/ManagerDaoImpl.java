package com.BMS.dao.impl;

import com.BMS.dao.JDBCUtil_sqlite;
import com.BMS.dao.ManagerDao;
import com.BMS.vo.Manager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ManagerDaoImpl implements ManagerDao {
    public List<Manager> findManagerByID(String ID){
        List<Manager> list = new ArrayList<>();
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet rs = null;
        try {
            connection = JDBCUtil_sqlite.getConnection();
            String sql = "select * from manager where manager_id = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, Integer.parseInt(ID));
            rs = preparedStatement.executeQuery();
            while (rs.next()) {
                Manager manager=new Manager();
                manager.setManager_id(rs.getInt("manager_id"));
                manager.setManager_name(rs.getString("manager_name"));
                manager.setManaegr_passwd(rs.getString("manager_passwd"));
                manager.setManager_privilege(rs.getString("manager_privilege"));
                list.add(manager);
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
