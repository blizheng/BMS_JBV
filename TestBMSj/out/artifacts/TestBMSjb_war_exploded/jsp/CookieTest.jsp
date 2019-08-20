<%--
  Created by IntelliJ IDEA.
  User: zheng
  Date: 2019/8/18
  Time: 21:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>CookieTest</title>
</head>
<body onload="ifcookie()">
<%
//    Cookie cookie=new Cookie("id","123");
//    cookie.setMaxAge(60*60*24);
//    response.addCookie(cookie);
//    Cookie cookie2=new Cookie("idas","dff");
//    cookie2.setMaxAge(60*60*24);
//    response.addCookie(cookie2);
%>
<%
    // 获取Cookies数组
    Cookie[] cookies = request.getCookies();
    // 迭代查找并清除Cookie
    for (Cookie cookie: cookies) {
    if (cookie.getName()!=null||cookie.getName()!="") {
    cookie.setMaxAge(0);
    response.addCookie(cookie);
    }
    }


%>

<a href="javascript:getCookie()" target="_self">asas</a>
<a href="javascript:getCook()" target="_self">1212</a>
<a href="javascript:ifcookie()" target="_self">5566</a>
<script language="JavaScript">
    // 函数中的参数分别为 cookie 的名称、值以及过期天数
    function setCookie(c_name,value,expiredays){
        var exdate=new Date();
        exdate.setDate(exdate.getDate()+expiredays);
        document.cookie=c_name+ "=" +escape(value)+
            ((expiredays==null) ? "" : ";expires="+exdate.toGMTString())
    }
    // setCookie('userName','xxx',1); // cookie过期时间为1天。

    // 设置过期时间以秒为单位
    function setCookie(c_name,value,expireseconds){
        var exdate=new Date();
        exdate.setTime(exdate.getTime()+expireseconds * 1000);
        document.cookie=c_name+ "=" +escape(value)+
            ((expireseconds==null) ? "" : ";expires="+exdate.toGMTString())
    }
    // setCookie('userName','xxx',3600);  //cookie过期时间为一个小时
    function getCookie(cookieName) {
        var strCookie = document.cookie;
        var arrCookie = strCookie.split(";");
        var user_id="";
        var user_passwd="";
        for(var i = 0; i < arrCookie.length; i++){
            if(arrCookie[i].split("=")[0]=="id")
                user_id=arrCookie[i].split("=")[1];
            if(arrCookie[i].split("=")[0]=="idas")
                user_passwd=arrCookie[i].split("=")[1];
            // alert(arrCookie[i]);
        }
        alert(user_id);
        alert(user_passwd);
    }
    function getCook() {
        // alert(getCookie("lastAccessTime"));
        // alert(getCookie("visitCount"));
        // alert(getCookie("id"));
        alert(document.cookie);
    }
function ifcookie() {
    var dt=document.cookie;

    if(dt!="")alert(111111);
    else window.location.href = "../showID.jsp?id="+123456;
}

</script>
</body>
</html>
