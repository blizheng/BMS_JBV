package com.BMS.controller.Test;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.*;
import java.util.UUID;

@MultipartConfig
@WebServlet("/UploadServlet1")

public class fileuploadtest extends HttpServlet {
    private void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Part part = request.getPart("b_img");

        String fileName = getFileName(part);
        System.out.println(fileName);
        writeTo(request,response,fileName, part);
    }



    //取得上传文件名
    private String getFileName(Part part) {
        String header = part.getHeader("Content-Disposition");
        String fileName = header.substring(header.indexOf("filename=\"") + 10, header.lastIndexOf("\""));
        return UUID.randomUUID().toString() + "_" + System.currentTimeMillis() + "_" + fileName;
    }

    //存储文件
    private String writeTo(HttpServletRequest request, HttpServletResponse response,String fileName, Part part) throws IOException, FileNotFoundException {
        String path_dir = "/bookimages";
        String savePath = this.getServletContext().getRealPath(path_dir);
        File file=new File(savePath);
        if(!file.exists())
            file.mkdirs();
        InputStream in = part.getInputStream();
        OutputStream out = new FileOutputStream(savePath +File.separator+ fileName);
        byte[] buffer = new byte[1024];
        int length = -1;
        while ((length = in.read(buffer)) != -1) {
            out.write(buffer, 0, length);
        }
        in.close();
        out.close();
        return path_dir + "/" + fileName;
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        System.out.println(request.getParameter("fileoo"));
//        processRequest(request, response);
        System.out.println(request.getParameter("aas"));
        System.out.println(request.getParameter("b_price"));
        String aa=request.getParameter("b_price");
        System.out.println("___+"+aa);

        UpLoadFile uf=new UpLoadFile();
        System.out.println(uf.uploadfile(request,response,"/testfile","b_img"));
        System.out.println("-----------");

    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }
}

