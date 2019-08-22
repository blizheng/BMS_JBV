package com.BMS.service;

import com.BMS.dao.ManagerDao;
import com.BMS.dao.impl.ManagerDaoImpl;
import com.BMS.vo.Manager;

import java.util.List;

public class ManagerService{
    ManagerDao manager=new ManagerDaoImpl();
    public List<Manager> findManagerByID(String ID){
        return manager.findManagerByID(ID);
    }
}
