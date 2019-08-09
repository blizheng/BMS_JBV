package com.BMS.controller;

import com.BMS.service.BorrowService;
import com.BMS.vo.Borrow;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


/*续借使用*/
@WebServlet("/GoonBorrow")
public class GoonBorrowController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        doPost(request, response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        String[] gooninfo=request.getParameter("goonarr").split(",");
        BorrowService goonborrow=new BorrowService();
        goonborrow.goon_borrow(gooninfo);


    }

}
