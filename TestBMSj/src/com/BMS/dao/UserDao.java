package com.BMS.dao;

import com.BMS.vo.User;

import java.util.List;

public interface UserDao {
    public List<User> getUserbyUserID(int user_id);
    public int UpdateUserInfo(String[] userinfoarr);
    public int UpdateInfo_bylist(List list);
    public int InsertUserInfo(String[] reg_user);
    public int CheckUserID(int id);
    public int ChangePasswd(String[] pwdinfo);
}
