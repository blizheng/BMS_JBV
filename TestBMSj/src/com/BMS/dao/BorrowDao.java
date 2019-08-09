package com.BMS.dao;

public interface BorrowDao {
    public int update_return(String[] returninfo);

    public int update_borrow(String[] borrowinfo);

    public int goon_borrow(String[] goonborrowinfo);
}
