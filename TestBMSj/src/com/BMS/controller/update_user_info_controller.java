package com.BMS.controller;

import com.BMS.service.UserService;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadBase;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.util.*;

@WebServlet("/update_userinfo")
public class update_user_info_controller extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("UTF-8");
        List<String> infolist = getforminfo(request, response);
//        for(int i=0;i<infolist.size();i++){
//            System.out.println(i+"--"+infolist.get(i));
//        }

        UserService updateinfo = new UserService();
        int result = updateinfo.UpdateInfo_bylist(infolist);
//        System.out.println("运行结果："+result);


        String mesg = new String();
        if (result == 1)
            mesg = "修改成功！";
        else if (result == 2)
            mesg = "数据错误！请重试！";
        else
            mesg = "未知错误！";

        response.setContentType("text/html;charset=utf-8");

        response.sendRedirect("user_info.jsp");

    }

/*
response.setContentType("text/html;charset=UTF-8");
        HttpSession session=request.getSession(true);


//        Integer accessCount = (Integer) session.getAttribute("accessCount");
//        if (accessCount == null) {
//            accessCount = new Integer(0);
//        } else {
//            accessCount = new Integer(accessCount.intValue() + 1);
//        }
//
//        session.setAttribute("accessCount", accessCount);

        session.setAttribute("message",mesg);
        session.setAttribute("user_id", infolist.get(0));
        session.setAttribute("user_pwd", infolist.get(3));
        //跳转到注册成功页面-> userInfo.jsp，同时传递这request 和 response 对象
        request.getRequestDispatcher("user_info.jsp").forward(request, response);
* */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }


    private List getforminfo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<String> infolist = new ArrayList<>();
        infolist.clear();
        //文件夹名称
        String path_dir = "/uploadFiles";
        //数据库内路径
        String DB_useurl = "";
        //设置文件上传基本路径
        String savePath = this.getServletContext().getRealPath(path_dir);
        //设置临时文件路径
        String tempPath = this.getServletContext().getRealPath("/tempFiles");
        File tempFile = new File(tempPath);
        if (!tempFile.exists()) {
            tempFile.mkdir();
        }

        //定义异常消息
        String errorMessage = "";
        //创建file items工厂
        DiskFileItemFactory factory = new DiskFileItemFactory();
        //设置缓冲区大小
        factory.setSizeThreshold(1024 * 100);
        //设置临时文件路径
        factory.setRepository(tempFile);
        //创建文件上传处理器
        ServletFileUpload upload = new ServletFileUpload(factory);
        /*
        //监听文件上传进度
        ProgressListener progressListener = new ProgressListener() {
            public void update(long pBytesRead, long pContentLength, int pItems) {
                System.out.println("正在读取文件： " + pItems+1);
                if (pContentLength == -1) {
                    System.out.println("已读取： " + pBytesRead + " 剩余0");
                } else {
                    System.out.println("文件总大小：" + pContentLength + " 已读取：" + pBytesRead);
                }
            }
        };
        upload.setProgressListener(progressListener);
*/
        //解决上传文件名的中文乱码
        upload.setHeaderEncoding("UTF-8");
        //判断提交上来的数据是否是上传表单的数据
        if (!ServletFileUpload.isMultipartContent(request)) {
            //按照传统方式获取数据
            return null;
        }

        //设置上传单个文件的大小的最大值，目前是设置为1024*1024字节，也就是1MB
        upload.setFileSizeMax(1024 * 1024);
        //设置上传文件总量的最大值，最大值=同时上传的多个文件的大小的最大值的和，目前设置为10MB
        upload.setSizeMax(1024 * 1024 * 10);

//        设置数据库查询文件路径
        String path = "";
        try {
            //使用ServletFileUpload解析器解析上传数据，解析结果返回的是一个List<FileItem>集合，每一个FileItem对应一个Form表单的输入项
            List<FileItem> items = upload.parseRequest(request);
            Iterator<FileItem> iterator = items.iterator();

            while (iterator.hasNext()) {
                FileItem item = iterator.next();

                //判断jsp提交过来的是不是文件
                if (item.isFormField()) {//如果不是文件

                    String value = item.getString("UTF-8");
                    if (value == null) value = "";
                    infolist.add(value);
                    errorMessage = "请提交文件！";
//                    System.out.println(errorMessage);

                } else {//如果是文件

                    //文件名
                    String fileName = item.getName();
                    if (fileName == null || fileName.trim() == "") {
//                        System.out.println("文件名为空！");
//                        break;
                        infolist.add("");//添加空，保证list大小一致
                        continue;//为保证获取表单所有内容继续运行
                    }

                    //处理不同浏览器提交的文件名带路径问题
                    fileName = fileName.substring(fileName.lastIndexOf("/") + 1);
                    //文件扩展名
                    String fileExtension = fileName.substring(fileName.lastIndexOf(".") + 1);

                    //判断扩展名是否合法
                    if (!validExtension(fileExtension)) {
                        errorMessage = "上传文件非法！";
                        item.delete();
//                        System.out.println(errorMessage);
                        break;
                    }

                    //获得文件输入流
                    InputStream in = item.getInputStream();
                    //得到保存文件的名称
                    String saveFileName = createFileName(fileName);
                    //得到文件保存路径
                    String realFilePath = createRealFilePath(savePath, saveFileName);

                    //创建文件输出流
                    FileOutputStream out = new FileOutputStream(realFilePath);
                    //创建缓冲区
                    byte buffer[] = new byte[1024];
                    int len = 0;
                    while ((len = in.read(buffer)) > 0) {
                        //写文件
                        out.write(buffer, 0, len);
                    }
                    //关闭输入流
                    in.close();
                    //关闭输出流
                    out.close();
                    //删除临时文件 TODO
                    item.delete();
                    //将上传文件信息保存到附件表中 TODO
//                    System.out.println("上传成功");

                    //处理路径
                    DB_useurl = path_dir + "/" + saveFileName;
                    path = DB_useurl;
                    //将路径添加进list
                    infolist.add(path);


                }

            }

            return infolist;
        } catch (FileUploadBase.FileSizeLimitExceededException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "单个文件超出最大值！！！");
            request.getRequestDispatcher("pages/upload/upload.jsp").forward(request, response);
            return null;
        } catch (FileUploadBase.SizeLimitExceededException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "上传文件的总的大小超出限制的最大值！！！");
            request.getRequestDispatcher("pages/upload/upload.jsp").forward(request, response);
            return null;
        } catch (FileUploadException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "文件上传失败！！！");
            request.getRequestDispatcher("pages/upload/upload.jsp").forward(request, response);
            return null;
        } catch (Exception e) {
            e.printStackTrace();
        }

//        request.setAttribute("errorMessage", errorMessage);
//        request.getRequestDispatcher("test.jsp").forward(request, response);
        return null;
    }

    private boolean validExtension(String fileExtension) {
        String[] exts = {"jpg", "JPG", "PNG", "png", "jpeg", "JPEG"};
        for (int i = 0; i < exts.length; i++) {
            if (fileExtension.equals(exts[i])) {
                return true;
            }

        }

        return false;
    }

    private String createFileName(String fileName) {
        return UUID.randomUUID().toString() + "_" + System.currentTimeMillis() + "_" + fileName;
    }

    private String createRealFilePath(String basePath, String fileName) {
        String upPath = basePath + File.separator;
        File uploadFolder = new File(upPath);
        if (!uploadFolder.exists()) {
            uploadFolder.mkdirs();
        }
        String realFilePath = upPath + fileName;
        return realFilePath;
    }
}
