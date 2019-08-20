package com.BMS.controller;

import com.BMS.service.UserService;
import com.BMS.vo.User;
import com.fasterxml.jackson.databind.ObjectMapper;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/changepasswd")
public class Change_Passwd_Controller extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String user_id=request.getParameter("ID");
        String oldpasswd=request.getParameter("oldpasswd");
        String newpasswd=request.getParameter("newpasswd");

        String[] pwdinfo={
                user_id,oldpasswd,newpasswd,
        };

        UserService changepwd=new UserService();
        int ret=changepwd.ChangePasswd(pwdinfo);

        PrintWriter out=response.getWriter();
        ObjectMapper mapper = new ObjectMapper();
        String result = mapper.writeValueAsString(ret);
        out.write(result);


    }
}
