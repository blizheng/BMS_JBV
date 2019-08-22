package com.BMS.controller.Test;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadBase;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.ProgressListener;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.*;
import java.util.Calendar;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;


@MultipartConfig
public class UpLoadFile extends HttpServlet {
    public String uploadfile(HttpServletRequest request, HttpServletResponse response, String fp,String idname)
            throws ServletException, IOException {

        Part part = request.getPart(idname);
        String fileName = getFileName(part);
//        System.out.println(fileName);
        if ("".equals(fileName))
            return "";
        else return writeTo(request, response,fp, fileName, part);
    }


    //取得上传文件名
    private String getFileName(Part part) {
        String header = part.getHeader("Content-Disposition");
//        System.out.println("header="+header);
//        String fileName = header.substring(header.indexOf("filename=\"") + 10, header.lastIndexOf("\""));
        String fileName = "";
        String[] fname = header.split(";");
        if (fname.length == 3)
            fileName = fname[2].split("=")[1].replace("\"", "");

        if ("".equals(fileName))
            return "";
        else return UUID.randomUUID().toString() + "_" + System.currentTimeMillis() + "_" + fileName;
    }

    //存储文件
    private String writeTo(HttpServletRequest request, HttpServletResponse response, String path_dir,String fileName, Part part) throws IOException, FileNotFoundException {
//        String path_dir = "/bookimages";
        String savePath = request.getServletContext().getRealPath(path_dir);
        File file = new File(savePath);
        if (!file.exists())
            file.mkdirs();
        InputStream in = part.getInputStream();
        OutputStream out = new FileOutputStream(savePath + File.separator + fileName);
        byte[] buffer = new byte[1024];
        int length = -1;
        while ((length = in.read(buffer)) != -1) {
            out.write(buffer, 0, length);
        }
        in.close();
        out.close();
        return path_dir + "/" + fileName;
    }

}
