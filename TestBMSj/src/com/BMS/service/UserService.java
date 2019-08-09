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
}
