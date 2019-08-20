package com.BMS.controller;

import com.BMS.service.BorrowService;
import com.fasterxml.jackson.databind.ObjectMapper;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/*借书*/
@WebServlet("/BorrowBook")
public class BorrowBookController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        doPost(request, response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String[] borrowinfo = request.getParameter("borrowarr").split(",");
        BorrowService updateborrow = new BorrowService();
        int result=updateborrow.update_borrow(borrowinfo);

//        System.out.println(result);
        response.setCharacterEncoding("UTF-8");

        PrintWriter out = response.getWriter();
        out.write(String.valueOf(result));

    }
}
