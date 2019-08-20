<%--
  Created by IntelliJ IDEA.
  User: zheng
  Date: 2019/8/17
  Time: 10:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    session.setAttribute("a", "asassaas");  //把b放到session里，命名为a，
    String M = session.getAttribute("a").toString(); //从session里把a拿出来，并赋值给M
    System.out.println(M);
    String aa=session.getAttribute("sd").toString();
    System.out.println(aa);
    String bb=session.getAttribute("sf").toString();
    System.out.println(bb);
%>

asdad
</body>
</html>
