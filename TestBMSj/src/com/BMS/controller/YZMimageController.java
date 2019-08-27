package com.BMS.controller;

import com.BMS.service.Temp.Make_IMG;
import com.BMS.service.Temp.Make_IMG_Easy_Using;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.sf.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

@WebServlet("/yzmimage")
public class YZMimageController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = "/yzm";
        String yzmpath = this.getServletContext().getRealPath(path);
        File file = new File(yzmpath);
        if (!file.exists()) {
            file.mkdir();
        }
//        Make_IMG yzmimg = new Make_IMG();
        Make_IMG_Easy_Using yzmimg=new Make_IMG_Easy_Using();
        String[] yzminfo = yzmimg.show_image(yzmpath);
        String yzmtext="";
        String yzmload="";
        if(yzminfo.length==2){
            yzmtext=yzminfo[0];
            yzmload = path + "/" + yzminfo[1];
        }
//        System.out.println(yzmtext);
//        System.out.println(yzmload);
        JSONObject json = JSONObject.fromObject("{'yzmtext' : '" + yzmtext + "','yzmload' : '" + yzmload + "'}");
//        Map<String, Object> map = json;
//        for (Map.Entry<String, Object> entry : map.entrySet()) {
//            System.out.println(entry.getKey() + "=" + entry.getValue());
//        }
//        String[] yzm={yzmtext,yzmload};

        response.setCharacterEncoding("UTF-8");
        ObjectMapper mapper = new ObjectMapper();
        String jsonStr = mapper.writeValueAsString(json);
        PrintWriter out = response.getWriter();
        out.write(jsonStr);
    }
}
