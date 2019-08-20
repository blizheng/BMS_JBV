package com.BMS.service;

import com.BMS.dao.UserDao;
import com.BMS.dao.impl.UserDaoImpl;
import com.BMS.vo.User;

import java.util.List;

public class UserService {
    private UserDao user=new UserDaoImpl();

    public List<User> getUserbyUserID(int user_id){
        return user.getUserbyUserID(user_id);
    }

    public int UpdateUserInfo(String[] userinfoarr){
        return user.UpdateUserInfo(userinfoarr);
    }

    public int UpdateInfo_bylist(List list){
        return user.UpdateInfo_bylist(list);
    }

    public int InsertUserInfo(String[] reg_user){
        return user.InsertUserInfo(reg_user);
    }
    public int CheckUserID(int id){
        return user.CheckUserID(id);
    }

    public int ChangePasswd(String[] pwdinfo){
        return user.ChangePasswd(pwdinfo);
    }
}
