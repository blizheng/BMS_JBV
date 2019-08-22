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

@WebServlet("/cookieclear")
public class CookieTest extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String clearid=request.getParameter("cid");
        Cookie[] cookies = request.getCookies();
        if (clearid==null)
            clearid="";

            for (Cookie cookie : cookies) {
                if("1".equals(clearid))
                {
                    if("user_ID".equals(cookie.getName()))
                    {
                        cookie.setMaxAge(0);
                        response.addCookie(cookie);
                    }
                }
                else if("2".equals(clearid))
                {
                    if("manager_ID".equals(cookie.getName()))
                    {
                        cookie.setMaxAge(0);
                        response.addCookie(cookie);
                    }
                }
//                cookie.setMaxAge(0);
//                response.addCookie(cookie);
            }
        response.sendRedirect("first.jsp");
    }
}
 /*
        PrintWriter out = response.getWriter();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String nowTime = sdf.format(new Date());
        String lastAccessTime = "";
        int visitCount = 0;
        Cookie[] cookies = request.getCookies();
        if (cookies != null)
            for (Cookie cookie : cookies) {
                if ("lastAccessTime".equals(cookie.getName()))
                    lastAccessTime = cookie.getValue();
                if ("visitCount".equals(cookie.getName()))
                    visitCount = Integer.valueOf(cookie.getValue());
            }
        if (!"".equals(lastAccessTime))
            out.println("上次访问时间" + lastAccessTime);
        out.println("这是你地" + (visitCount + 1) + "次访问本站");
        Cookie lastAccessobj = new Cookie("lastAccessTime", nowTime);
        lastAccessobj.setMaxAge(30 * 24 * 60 * 60);
        Cookie visitCountobj = new Cookie("visitCount", String.valueOf(visitCount + 1));
        visitCountobj.setMaxAge(30 * 24 * 60 * 60);
        response.addCookie(lastAccessobj);
        response.addCookie(visitCountobj);
*/