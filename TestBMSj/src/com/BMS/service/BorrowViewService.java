package com.BMS.service;

import com.BMS.dao.BorrowViewDao;
import com.BMS.dao.impl.BorrowViewDaoImpl;
import com.BMS.vo.BorrowView;

import java.util.List;

public class BorrowViewService {
    private BorrowViewDao borrowview=new BorrowViewDaoImpl();

    public List<BorrowView> getallbyID(int id){
        return borrowview.getallbyID(id);
    }
}
