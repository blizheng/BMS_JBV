package com.BMS.dao.impl;

import com.BMS.dao.BorrowDao;
import com.BMS.dao.JDBCUtil_sqlite;

import java.sql.*;

public class BorrowDaoImpl implements BorrowDao {

    /*还书*/
    public int update_return(String[] returninfo) {
        if (returninfo.length == 3) {
            Connection connection = null;
            PreparedStatement preparedStatement = null;
            int rs;
            try {
                connection = JDBCUtil_sqlite.getConnection();
                String sql = "update borrow set borrow_state='0',return_time=? where user_id=? and book_id=?";

                preparedStatement = connection.prepareStatement(sql);
                preparedStatement.setString(1, returninfo[2]);
                preparedStatement.setInt(2, Integer.parseInt(returninfo[1]));
                preparedStatement.setInt(3, Integer.parseInt(returninfo[0]));

                rs = preparedStatement.executeUpdate();
                if (rs > 0)
                    return 1;
                else return 0;
            } catch (SQLException e) {
                e.printStackTrace();
                System.out.println("borrow表查询出错!!!!!!!--return");
            } catch (Exception e1) {
                e1.printStackTrace();
                System.out.println("borrow表查询出错!!!!!!!--return");
            } finally {
                JDBCUtil_sqlite.closeConnection(connection);
            }

        }
        return 0;
    }

    /*借书函数*/
    /**
     * 返回值
     * 0---失败
     * 1---成功
     * 2----已借过
     * */
    public int update_borrow(String[] borrowinfo) {
        if (borrowinfo.length == 3) {
            Connection connection = null;
            try {
                connection =JDBCUtil_sqlite.getConnection();

                String sql1="select count(*) from borrow where borrow_state='1' and book_id='"+
                        Integer.parseInt(borrowinfo[0])+"' and user_id='"+Integer.parseInt(borrowinfo[1])+"'";
                String sql2="update book set book_num=book_num-1 where book_id='"+Integer.parseInt(borrowinfo[0])+"'";
                String sql3 = "insert into borrow values('"+Integer.parseInt(borrowinfo[1])+
                        "','"+Integer.parseInt(borrowinfo[0])+"','"+borrowinfo[2]+"','','1')";

                PreparedStatement stat=connection.prepareStatement(sql1);
                ResultSet rs = stat.executeQuery();
                while(rs.next()){
//                    System.out.println(rs.getInt("count(*)"));
                    if(rs.getInt("count(*)")==0){

                        Statement statement = connection.createStatement();

                        statement.addBatch(sql2);
                        statement.addBatch(sql3);

                        statement.executeBatch();



//                        statement.clearBatch();
                        return 1;
                    }
                    else return 2;
                }


            } catch (SQLException e) {
                e.printStackTrace();
//                try {
//                    connection.rollback();
//                } catch (SQLException e2) {
//                    e2.printStackTrace();
//                }
                System.out.println("borrow表查询出错!!!!!!!--borrow");
            } catch (Exception e1) {
                e1.printStackTrace();
                System.out.println("borrow表查询出错!!!!!!!--borrow");
            } finally {
                JDBCUtil_sqlite.closeConnection(connection);
            }

        }
        return 0;
    }

    /*续借函数*/
    public int goon_borrow(String[] goonborrowinfo) {
        if (goonborrowinfo.length == 3) {
            Connection connection = null;
            Statement statement = null;
            int rs;
            try {
                connection = JDBCUtil_sqlite.getConnection();

                connection.setAutoCommit(false);/*将sql语句的提交方式改为非自动提交*/

                statement = connection.createStatement();
                String sql1 = "update borrow set borrow_state='0',return_time='"+goonborrowinfo[2]+
                        "' where user_id='"+Integer.parseInt(goonborrowinfo[1])+"' and book_id='"+Integer.parseInt(goonborrowinfo[0])+"'";
                String sql2 = "insert into borrow values ('"+Integer.parseInt(goonborrowinfo[1])+
                        "','"+Integer.parseInt(goonborrowinfo[0])+"','"+goonborrowinfo[2]+"','','1')";
                statement.addBatch(sql1);
                statement.addBatch(sql2);
                statement.executeBatch();
                connection.commit();
                statement.clearBatch();

                return 1;
            } catch (SQLException e) {
                e.printStackTrace();
                try {
                    connection.rollback();
                } catch (SQLException e2) {
                    e2.printStackTrace();
                }
                System.out.println("borrow表查询出错!!!!!!!--goon");
            } catch (Exception e1) {
                e1.printStackTrace();
                System.out.println("borrow表查询出错!!!!!!!--goon");
            } finally {
                JDBCUtil_sqlite.closeConnection(connection);
            }
            return 0;
        }
        return 0;
    }
}
