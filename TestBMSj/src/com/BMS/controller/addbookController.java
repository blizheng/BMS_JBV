package com.BMS.controller;

import com.BMS.controller.Test.UpLoadFile;
import com.BMS.service.BookService;
import com.fasterxml.jackson.databind.ObjectMapper;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.*;
import java.util.UUID;

@MultipartConfig
@WebServlet("/addbook")
public class addbookController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        response.setCharacterEncoding("UTF-8");
//        response.setContentType("text/html;charset=UTF-8");

        String img2 = request.getParameter("b_img");
        String name = request.getParameter("b_name");
        String author = request.getParameter("b_author");
        String pub = request.getParameter("b_pub");
        String num = request.getParameter("b_num");
        String price = request.getParameter("b_price");
        String isbn = request.getParameter("b_isbn");
        String category = request.getParameter("b_category");
        String desc = request.getParameter("b_desc");
        String dateID = String.valueOf(System.currentTimeMillis()).substring(4);

        String img="";
        if(!"".equals(img2)||img2!=null)
        {
            img=new UpLoadFile().uploadfile(request,response,"/bookimages","b_img");
        }
        String[] bookinfo = {
                dateID, name, author, price, pub,
                img, num, category, isbn, desc,
        };
//        for(int i=0;i<bookinfo.length;i++)
//        {
//            System.out.println(bookinfo[i]);
//        }

        BookService addbook = new BookService();
        int re = addbook.addbook(bookinfo);

        PrintWriter out = response.getWriter();
        ObjectMapper mapper = new ObjectMapper();
        String result = mapper.writeValueAsString(re);
        out.write(result);
    }

}
