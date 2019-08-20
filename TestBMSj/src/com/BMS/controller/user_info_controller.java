package com.BMS.controller;

import com.BMS.service.UserService;
import com.fasterxml.jackson.databind.ObjectMapper;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/UserInfoChange_byID")
public class user_info_controller extends HttpServlet {

         protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

            doGet(request, response);
        }

        protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

            String[] user_info=request.getParameter("user_info").split(",");
            for(int i=0;i<user_info.length;i++)
                System.out.println(user_info[i]);
            user_info[4]="";
            UserService updateinfo=new UserService();
            int result=updateinfo.UpdateUserInfo(user_info);
            response.setCharacterEncoding("UTF-8");
            ObjectMapper mapper = new ObjectMapper();
            String jsonStr = mapper.writeValueAsString(result);
            PrintWriter out = response.getWriter();
            out.write(jsonStr);
        }



}
