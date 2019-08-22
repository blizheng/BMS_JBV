package com.BMS.controller;

import com.BMS.service.BookService;
import com.fasterxml.jackson.databind.ObjectMapper;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/updatebookinfo")
public class update_bookinfo_controller extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String img=request.getParameter("img");
        String name=request.getParameter("name");
        String author=request.getParameter("author");
        String pub=request.getParameter("pub");
        String num=request.getParameter("num");
        String price=request.getParameter("price");
        String isbn=request.getParameter("isbn");
        String category=request.getParameter("category");
        String desc=request.getParameter("desc");
        String bookid = String.valueOf(System.currentTimeMillis()).substring(4);

        String[] bookinfo={
                bookid,name,author,price,pub,
                img,num,category,isbn,desc,
        };

//        for (int i=0;i<bookinfo.length;i++)
//                System.out.println(bookinfo[i]);
//        int re=1;

        BookService updatebook=new BookService();
        int re=updatebook.updatebook(bookinfo);

        //前端返回值
        PrintWriter out=response.getWriter();
        ObjectMapper mapper = new ObjectMapper();
        String result = mapper.writeValueAsString(re);
        out.write(result);


    }


}
