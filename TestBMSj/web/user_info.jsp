<%--
  Created by IntelliJ IDEA.
  User: zheng
  Date: 2019/8/15
  Time: 23:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>更改信息</title>
</head>

<body onload="initAJAX();getinfo();">

<script src="js/cookie_info.js"></script>
<script language="JavaScript">

    function getinfo() {
        var info=getCookie_info();
        if(info.servletstop=="true")window.location.href="error.jsp";
        else if(info.user_id=="")
            window.location.href = "first.jsp";
        else reset_form(info.user_id);
    }

        <%--if("<%=ac%>"=="0"){--%>
            <%--alert("<%=mes%>");--%>
        <%--&lt;%&ndash;alert("<%=mes%>");&ndash;%&gt;--%>
        <%--&lt;%&ndash;alert("<%=id%>");&ndash;%&gt;--%>
        <%--&lt;%&ndash;alert("<%=pwd%>");&ndash;%&gt;--%>
    <%--}--%>

</script>

<form action="update_userinfo" method="post" enctype="multipart/form-data" id="infoform" onsubmit="return checkform()">
    <table>
        <tr style="visibility: hidden;display: none;">
            <td>ID</td>
            <td><input type="number" name="ID" id="ID"></td>
        </tr>
        <tr>
            <td>姓名</td>
            <td><input type="text" name="name" id="name"></td>
        </tr>
        <tr>
            <td>性别</td>
            <td>
                <input type="radio" name="sex" id="sex_nan" value="1">男
                <input type="radio" name="sex" id="sex_nv" value="2">女
            </td>
        </tr>
        <tr style="visibility: hidden;display: none">
            <td>密码</td>
            <td><input type="password" name="passwd" id="passwd"></td>
        </tr>
        <tr>
            <td>头像</td>
            <td><input type="file" name="image" id="image"></td>
        </tr>
        <tr>
            <td>电话</td>
            <td><input type="tel" name="phone" id="phone"></td>
        </tr>
        <tr>
            <td>Email</td>
            <td><input type="email" name="email" id="email"></td>
        </tr>
        <tr>
            <td>地址</td>
            <td><input type="text" name="address" id="address"></td>
        </tr>
        <tr>
            <td>简介</td>
            <td><input type="text" name="desc" id="desc"></td>
        </tr>
        <tr>
            <td colspan="2" style="">
                <input type="submit" value="提交">
                <input type="button" value="重置" onclick="getinfo()">
                <input type="button" value="修改密码" onclick="change_passwd()">
            </td>
        </tr>
    </table>
</form>
<%--
<a href="javascript:newwin()" target="_blank">123</a>
<script language="JavaScript">
    function newwin() {
        window.open("user_info.jsp","_blank");
    }
</script>
--%>
<script src="js/commons.js"></script>
<script language="JavaScript">

    function change_passwd() {
        window.location.href="Change_Passwd.jsp";
    }

    function checkform() {
        // var form=document.getElementById("infoform");
        var alr = prompt("请确认密码", "");
        if (alr != "" && alr != null) {
            var passwd = document.getElementById("passwd").value;
            if (alr == passwd)
                return true;
            else
                alert("密码错误！");
        }
        if (alr == "") {
            alert("请输入密码!");
        }
        return false;
    }
</script>

<script language="JavaScript">


    function reset_form(userid) {
        xmlHttp.open("GET", "/User_byID?user_id=" + userid, true);
        xmlHttp.onreadystatechange = function () {
            if (xmlHttp.readyState == 4) {
                var data = xmlHttp.responseText;
                var obj = JSON.parse(data);
                for (var i in obj) {
                    if (obj.length == 1) {
                        document.getElementById("ID").value = userid;
                        document.getElementById("name").value = obj[0].user_name;
                        if (obj[0].user_sex == "女")
                            document.getElementById("sex_nv").checked = true;
                        else
                            document.getElementById("sex_nan").checked = true;
                        // document.getElementById("image").value = obj[0].user_images;
                        document.getElementById("passwd").value = obj[0].user_passwd;
                        document.getElementById("phone").value = obj[0].user_phone;
                        document.getElementById("email").value = obj[0].user_email;
                        document.getElementById("address").value = obj[0].user_address;
                        document.getElementById("desc").value = obj[0].user_description;
                    }
                }
            }
        }
        xmlHttp.send();
    }
</script>
</body>
</html>
