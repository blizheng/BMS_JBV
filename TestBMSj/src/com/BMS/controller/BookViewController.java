package com.BMS.controller;


import com.BMS.service.BookViewService;
import com.BMS.vo.BookView;
import com.fasterxml.jackson.databind.ObjectMapper;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

/*bookview视图表显示书籍，借书使用*/
@WebServlet("/BookView")
public class BookViewController extends HttpServlet{
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        BookViewService bookviewService = new BookViewService();
        List<BookView> bookviewList = bookviewService.getAll();
        response.setCharacterEncoding("UTF-8");
        ObjectMapper mapper = new ObjectMapper();
        String jsonStr = mapper.writeValueAsString(bookviewList);
        PrintWriter out = response.getWriter();
        out.write(jsonStr);
    }
}
