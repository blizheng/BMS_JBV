package com.BMS.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JDBCUtil_sqlite {

//    private static String DB_URL = "jdbc:sqlite:C:/Users/zheng/Desktop/javaweb实验代码/jsp_sy7/bookstore.db";
    private static String MySQL_URL="jdbc:mysql://localhost:3306/test_bms";
    private static String MySQL_USERS="zheng";
    private static String MySQL_PASS="123456";
    private static String MySQL_DRIVE="com.mysql.jdbc.Driver";

    private static String DB_URL = "jdbc:sqlite:F:/IDEA/TestBMSj/DB/BMS.db";
    private static String DB_DRIVER = "org.sqlite.JDBC";
    private static Connection connection = null;

    public static Connection getConnection() {
        try {
//            Class.forName(MySQL_DRIVE);
//            connection = DriverManager.getConnection(MySQL_URL,MySQL_USERS,MySQL_PASS);

            Class.forName(DB_DRIVER);
            connection = DriverManager.getConnection(DB_URL);
        } catch (ClassNotFoundException e) {
            System.out.println("ClassNotFoundException");
            e.printStackTrace();
        } catch (SQLException e) {
            System.out.println("连接数据库异常");
            e.printStackTrace();
        }
        return connection;
    }

    public static void closeConnection(Connection connection) {
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
