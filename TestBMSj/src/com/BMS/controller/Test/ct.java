package com.BMS.controller.Test;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/sst")
public class ct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Cookie[] cookies = request.getCookies();
        for (Cookie cookie : cookies) {
            System.out.println("-------------"+cookie);
            if ("user_ID".equals(cookie.getName())) {
                System.out.println("-+++++++-"+cookie.getName());
                System.out.println("-+++++++-"+cookie.getValue());
            }
            if ("user_ID"==cookie.getName()) {
                System.out.println("******"+cookie.getName());
                System.out.println("******"+cookie.getValue());
            }
        }
    }
}
