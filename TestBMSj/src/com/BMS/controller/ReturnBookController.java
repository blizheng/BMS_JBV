package com.BMS.controller;

import com.BMS.service.BorrowService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

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
        updatereturn.update_return(returninfo);










//        JSONObject json =GetRequestJsonUtils.getRequestJsonObject(request);//不

//        JSONObject json1=JSONObject.fromObject("{'username' : '11111','clientid' : '','password' : '222222'}");
//        Map<String, Object> map =json1;
//        for (Map.Entry<String, Object> entry : map.entrySet()) {
//            System.out.println(entry.getKey()+"="+entry.getValue());
//        }
//
//
//        System.out.println("123132");

    }



}
