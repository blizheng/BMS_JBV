package com.BMS.controller;


import com.BMS.service.BorrowViewService;
import com.BMS.vo.BorrowView;
import com.fasterxml.jackson.databind.ObjectMapper;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

/*borrowview视图表，用户界面使用*/
@WebServlet("/BorrowView")
public class BorrowViewController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        BorrowViewService borrowviewService = new BorrowViewService();
        int userid = Integer.parseInt(request.getParameter("user_id"));
        List<BorrowView> borrowviewList = borrowviewService.getallbyID(userid);
        response.setCharacterEncoding("UTF-8");
        ObjectMapper mapper = new ObjectMapper();
        String jsonStr = mapper.writeValueAsString(borrowviewList);
        PrintWriter out = response.getWriter();
        out.write(jsonStr);
    }
}
