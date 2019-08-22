package com.BMS.controller;

import com.BMS.service.ManagerService;
import com.BMS.vo.Manager;
import com.fasterxml.jackson.databind.ObjectMapper;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/manager_list")
public class ManagerLoginController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        doGet(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String m_ID=request.getParameter("ID");
        String m_passwd=request.getParameter("passwd");

        ManagerService manager=new ManagerService();
        List<Manager> managerlist=manager.findManagerByID(m_ID);

        int re=0;
        if(m_passwd.equals(managerlist.get(0).getManaegr_passwd())) {
            re = 1;
//            deletecookie(request,response);
            Cookie idcookie=new Cookie("manager_ID",m_ID);
            idcookie.setMaxAge(24*60*60);
            Cookie passwdcookie=new Cookie("manager_privilege",managerlist.get(0).getManager_privilege());
            passwdcookie.setMaxAge(24*60*60);
            response.addCookie(idcookie);
            response.addCookie(passwdcookie);
        }
        else re=2;



        PrintWriter out=response.getWriter();
        ObjectMapper mapper = new ObjectMapper();
        String result = mapper.writeValueAsString(re);
        out.write(result);

    }

    private void deletecookie(HttpServletRequest request, HttpServletResponse response){
        Cookie[] cookies = request.getCookies();
        for (Cookie cookie : cookies) {

                cookie.setMaxAge(0);
                response.addCookie(cookie);
        }
    }
}
