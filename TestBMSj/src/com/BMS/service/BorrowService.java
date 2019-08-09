package com.BMS.service;

import com.BMS.dao.BorrowDao;
import com.BMS.dao.impl.BorrowDaoImpl;

public class BorrowService {
    public BorrowDao borrowdao=new BorrowDaoImpl();

    public int update_return(String[] returninfo){
        return borrowdao.update_return(returninfo);
    }

    public int update_borrow(String[] borrowinfo){
        return borrowdao.update_borrow(borrowinfo);
    }

    public int goon_borrow(String[] goonborrowinfo){
        return borrowdao.goon_borrow(goonborrowinfo);
    }
}
