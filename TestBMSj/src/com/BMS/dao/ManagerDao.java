package com.BMS.dao;

import com.BMS.vo.Manager;

import java.util.List;

public interface ManagerDao {
    public List<Manager> findManagerByID(String ID);
}
