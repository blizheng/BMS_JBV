package com.BMS.controller;

import com.BMS.service.BookService;
import com.BMS.vo.Book;
import com.fasterxml.jackson.databind.ObjectMapper;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

/*显示所有书目*/
@WebServlet("/Book")
public class BookController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        BookService bookService = new BookService();
        List<Book> bookList = bookService.findAll();
//        request.setAttribute("books",bookList);
//        request.getRequestDispatcher("/main.jsp").forward(request,response);
        response.setCharacterEncoding("UTF-8");
        ObjectMapper mapper = new ObjectMapper();
        String jsonStr = mapper.writeValueAsString(bookList);
        PrintWriter out = response.getWriter();
        out.write(jsonStr);

    }
}
