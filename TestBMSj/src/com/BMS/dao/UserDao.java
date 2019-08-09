package com.BMS.dao;

import com.BMS.vo.User;

import java.util.List;

public interface UserDao {
    public List<User> getUserbyUserID(int user_id);
}
