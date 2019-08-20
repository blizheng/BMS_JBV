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

/*还书使用*/
@WebServlet("/ReturnBook")
public class ReturnBookController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        doPost(request, response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

//        System.out.println(request.getParameter("returnarr").toCharArray());

        String[] returninfo=request.getParameter("returnarr").split(",");
        BorrowService updatereturn=new BorrowService();
        int bo_result=updatereturn.update_return(returninfo);

        PrintWriter out=response.getWriter();
        ObjectMapper mapper = new ObjectMapper();
        String result = mapper.writeValueAsString(bo_result);
        out.write(result);

    }



}
