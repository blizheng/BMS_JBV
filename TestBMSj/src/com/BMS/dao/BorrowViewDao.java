package com.BMS.dao;

import com.BMS.vo.BorrowView;

import java.util.List;

public interface BorrowViewDao {
    public List<BorrowView> getallbyID(int user_id);
}
