package com.BMS.controller.Test;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/c_test")
public class Cookietest2 extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String time="233";
        String dtf="555";
        Cookie[] cookies = request.getCookies();
        if (cookies != null)
            for (Cookie cookie : cookies) {
                if ("time".equals(cookie.getName()))
                     System.out.println("ti="+cookie.getValue());
                if ("dtf".equals(cookie.getName()))
                    System.out.println("dt="+cookie.getValue());
            }
        Cookie lastAccessobj = new Cookie("time", time);
        lastAccessobj.setMaxAge(30 * 24 * 60 * 60);
        Cookie visitCountobj = new Cookie("dtf", dtf);
        visitCountobj.setMaxAge(30 * 24 * 60 * 60);
        response.addCookie(lastAccessobj);
        response.addCookie(visitCountobj);
    }
}
