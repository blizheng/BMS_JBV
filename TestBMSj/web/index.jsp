<%--
  Created by IntelliJ IDEA.
  User: zheng
  Date: 2019/8/1
  Time: 14:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="com.BMS.controller.Test.test" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>

  <form action="Category" method="get">
      <input type="submit" value="跳转">


  缓冲区大小:<%=out.getBufferSize() %>byte<br>
  $END$
<%
    test TT=new test();
    TT.setStr("abcd");

%>
  hahaha
  <br>
  <%
      out.println(TT.getStr());

  %>
  <%=TT.getStr()%>
  </body>
</html>
