package com.BMS.vo;

public class Borrow {
    private int user_id;
    private int book_id;
    private String borrow_time;
    private String return_time;
    private char borrow_state;

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getBook_id() {
        return book_id;
    }

    public void setBook_id(int book_id) {
        this.book_id = book_id;
    }

    public String getBorrow_time() {
        return borrow_time;
    }

    public void setBorrow_time(String borrow_time) {
        this.borrow_time = borrow_time;
    }

    public String getReturn_time() {
        return return_time;
    }

    public void setReturn_time(String return_time) {
        this.return_time = return_time;
    }

    public char getBorrow_state() {
        return borrow_state;
    }

    public void setBorrow_state(char borrow_state) {
        this.borrow_state = borrow_state;
    }
}
