package com.BMS.controller;

import com.BMS.service.UserService;
import com.BMS.vo.User;
import com.fasterxml.jackson.databind.ObjectMapper;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collections;
import java.util.List;

@WebServlet("/first_login")
public class login_first_controller extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        int user_id=Integer.parseInt(request.getParameter("ID"));
        String passwd=request.getParameter("passwd");
        UserService usercheck = new UserService();
        List<User> userList = usercheck.getUserbyUserID(user_id);
//        for(int i=0;i<userList.size();i++)
//        {
//            System.out.println(userList.get(i).getUser_passwd());
//            System.out.println(userList.get(i).getUser_id());
//        }
//        System.out.println(userList.size());
        String mess="";
        if(userList.size()==1&&userList.get(0).getUser_passwd().equals(passwd))//确认密码
        {
            mess="success";
            deletecookie(request,response);
            Cookie idcookie=new Cookie("user_ID",String.valueOf(user_id));
            idcookie.setMaxAge(24*60*60);
            Cookie passwdcookie=new Cookie("user_Passwd",passwd);
            passwdcookie.setMaxAge(24*60*60);
            response.addCookie(idcookie);
            response.addCookie(passwdcookie);
        }
        else if(userList.size()==0)
            mess="ID_error";
        else
            mess="passwd_error";


        PrintWriter out=response.getWriter();
        ObjectMapper mapper = new ObjectMapper();
        String result = mapper.writeValueAsString(mess);
        out.write(result);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    private void deletecookie(HttpServletRequest request, HttpServletResponse response){
        Cookie[] cookies = request.getCookies();
        for (Cookie cookie : cookies) {
            if(cookie.getName()=="user_ID"||cookie.getName()=="user_Passwd"){
                cookie.setMaxAge(0);
                response.addCookie(cookie);
            }
        }
    }
}
