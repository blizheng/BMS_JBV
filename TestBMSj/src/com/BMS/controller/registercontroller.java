package com.BMS.controller;

import com.BMS.controller.Test.UpLoadFile;
import com.BMS.service.UserService;
import com.fasterxml.jackson.databind.ObjectMapper;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@MultipartConfig
@WebServlet("/registerset")
public class registercontroller extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String user_id=request.getParameter("ID");
        String user_name=request.getParameter("name");
        String user_sex=request.getParameter("sex");
        String user_passwd=request.getParameter("passwd");
        String img2=request.getParameter("image");
        String user_phone=request.getParameter("phone");
        String user_email=request.getParameter("email");
        String user_address=request.getParameter("address");
        String user_desc=request.getParameter("desc");

        String user_img="";
        if(!"".equals(img2)||img2!=null)
        {
            user_img=new UpLoadFile().uploadfile(request,response,"/userimages","image");
        }

        String[] user_reg_info={
                user_id,user_name,user_sex,user_passwd,user_img,
                user_phone,user_email,user_address,user_desc
        };
//        for(int i=0;i<user_reg_info.length;i++)
//        {
//            System.out.println("-------"+user_reg_info[i]);
//        }
//        System.out.println("++++++++++++++");

        //添加信息
        UserService insertuser=new UserService();
        int insertresult=insertuser.InsertUserInfo(user_reg_info);

        //添加cookie
        if(insertresult==1){
            deletecookie(request,response);
            Cookie idcookie=new Cookie("user_ID",user_id);
            idcookie.setMaxAge(24*60*60);
            Cookie passwdcookie=new Cookie("user_Passwd",user_passwd);
            passwdcookie.setMaxAge(24*60*60);
            response.addCookie(idcookie);
            response.addCookie(passwdcookie);
        }

        //前端返回值
        PrintWriter out=response.getWriter();
        ObjectMapper mapper = new ObjectMapper();
        String result = mapper.writeValueAsString(insertresult);
        out.write(result);

    }
    private void deletecookie(HttpServletRequest request, HttpServletResponse response){
        Cookie[] cookies = request.getCookies();
        for (Cookie cookie : cookies) {
            if(cookie.getName()=="user_ID"){
                cookie.setMaxAge(0);
                response.addCookie(cookie);
            }

        }
    }
}
