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
                else if(rs.getString("user_sex").equals("2"))
                    user.setUser_sex("女");
                else user.setUser_sex("男");
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

    public int UpdateUserInfo(String[] userinfoarr){
        Connection connection=null;
        PreparedStatement preparedStatement = null;
        try {
            if(userinfoarr.length==9) {
                connection = JDBCUtil_sqlite.getConnection();
                String sql = "update user set user_name=?,user_image=?,user_sex=?," +
                        "user_phone=?,user_email=?,user_address=?,user_description=? " +
                        "where user_id=? and user_passwd=?";
                preparedStatement = connection.prepareStatement(sql);
                preparedStatement.setString(1, userinfoarr[1]);
                preparedStatement.setString(2, userinfoarr[4]);
                preparedStatement.setString(3, userinfoarr[2]);
                preparedStatement.setString(4, userinfoarr[3]);
                preparedStatement.setString(5, userinfoarr[5]);
                preparedStatement.setString(6, userinfoarr[6]);
                preparedStatement.setString(7, userinfoarr[7]);
                preparedStatement.setInt(8, Integer.parseInt(userinfoarr[0]));
                preparedStatement.setString(9, userinfoarr[8]);
                int rs = preparedStatement.executeUpdate();
                if (rs > 0)
                    return 1;
                else return 2;
            }
            else return 2;
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            JDBCUtil_sqlite.closeConnection(connection);
        }
        return 0;
    }

    public int UpdateInfo_bylist(List list){
        Connection connection=null;
        PreparedStatement preparedStatement = null;
        try {
            connection = JDBCUtil_sqlite.getConnection();
            String sql="";
            if(list.size()==9&&!list.get(4).toString().equals("")) {

                sql = "update user set user_name=?,user_image=?,user_sex=?," +
                        "user_phone=?,user_email=?,user_address=?,user_description=? " +
                        "where user_id=? and user_passwd=?";
                preparedStatement = connection.prepareStatement(sql);
                preparedStatement.setString(1, list.get(1).toString());
                preparedStatement.setString(2, list.get(4).toString());
                preparedStatement.setString(3, list.get(2).toString());
                preparedStatement.setString(4, list.get(5).toString());
                preparedStatement.setString(5, list.get(6).toString());
                preparedStatement.setString(6, list.get(7).toString());
                preparedStatement.setString(7, list.get(8).toString());
                preparedStatement.setInt(8, Integer.parseInt(list.get(0).toString()));
                preparedStatement.setString(9, list.get(3).toString());
            }
            else if(list.size()==8||list.get(4).toString().equals("")){
                sql = "update user set user_name=?,user_sex=?," +
                        "user_phone=?,user_email=?,user_address=?,user_description=? " +
                        "where user_id=? and user_passwd=?";
                preparedStatement = connection.prepareStatement(sql);
                preparedStatement.setString(1, list.get(1).toString());
                preparedStatement.setString(2, list.get(2).toString());
                preparedStatement.setString(3, list.get(5).toString());
                preparedStatement.setString(4, list.get(6).toString());
                preparedStatement.setString(5, list.get(7).toString());
                preparedStatement.setString(6, list.get(8).toString());
                preparedStatement.setInt(7, Integer.parseInt(list.get(0).toString()));
                preparedStatement.setString(8, list.get(3).toString());
            }
            int rs = preparedStatement.executeUpdate();
            if (rs > 0)
                return 1;
            else return 2;
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            JDBCUtil_sqlite.closeConnection(connection);
        }
        return 0;
    }

    public int InsertUserInfo(String[] reg_user){
        Connection connection=null;
        PreparedStatement preparedStatement = null;
        try {
            connection = JDBCUtil_sqlite.getConnection();
            String sql1 = "insert into user values(?,?,?,?,?,?,?,?,?);";
            preparedStatement = connection.prepareStatement(sql1);
            preparedStatement.setInt(1, Integer.parseInt(reg_user[0]));
            preparedStatement.setString(2, reg_user[1]);
            preparedStatement.setString(3, reg_user[3]);
            preparedStatement.setString(4, reg_user[4]);
            preparedStatement.setString(5, reg_user[2]);
            preparedStatement.setString(6,reg_user[5]);
            preparedStatement.setString(7, reg_user[6]);
            preparedStatement.setString(8, reg_user[7]);
            preparedStatement.setString(9, reg_user[8]);
            int rs = preparedStatement.executeUpdate();
            if (rs > 0)
                return 1;
            else return 2;
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            JDBCUtil_sqlite.closeConnection(connection);
        }
        return 0;
    }
    public int CheckUserID(int id){
        Connection connection=null;
        PreparedStatement preparedStatement = null;
        try {
            connection = JDBCUtil_sqlite.getConnection();
            String sql = "select count(*) from user where user_id=?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1,id);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                if(rs.getInt("count(*)")==0){
                    return 1;
                }
                else return 2;
            }
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            JDBCUtil_sqlite.closeConnection(connection);
        }
        return 0;
    }

    public int ChangePasswd(String[] pwdinfo){
        Connection connection=null;
        PreparedStatement preparedStatement = null;
        String passwd="";
        try {
            connection = JDBCUtil_sqlite.getConnection();
            String sql = "select user_passwd from user where user_id=?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1,pwdinfo[0]);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
               passwd=rs.getString("user_passwd");
            }
            if(passwd.equals(pwdinfo[1])){
                String sql2 = "update user set user_passwd=? where user_id=? and user_passwd=?";
                preparedStatement = connection.prepareStatement(sql2);
                preparedStatement.setString(1,pwdinfo[2]);
                preparedStatement.setInt(2,Integer.parseInt(pwdinfo[0]));
                preparedStatement.setString(3,pwdinfo[1]);
                int rs2 = preparedStatement.executeUpdate();
                if(rs2>0)
                    return 1;
                else return 2;
            }
            else return 3;
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            JDBCUtil_sqlite.closeConnection(connection);
        }
        return 0;
    }
}
