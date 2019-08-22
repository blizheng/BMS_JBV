<%--
  Created by IntelliJ IDEA.
  User: zheng
  Date: 2019/8/20
  Time: 15:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>更改密码</title>
</head>

<body onload="initAJAX();getinfo();">

<script src="js/cookie_info.js"></script>
<script src="js/commons.js"></script>
<script language="JavaScript">

    function getinfo() {
        var info=getCookie_info();
        if(info.servletstop=="true")window.location.href="error.jsp";
        else if(info.user_id=="")
            window.location.href = "first.jsp";
        else re_form(info.user_id);

    }
</script>
<div style="position: absolute;top: 130px;left: 480px;">
<form action="javascript:tochange()" method="post" enctype="multipart/form-data" id="infoform">
    <table>
        <tr>
            <td>ID</td>
            <td><input type="text" name="ID" id="ID" readonly></td>
        </tr>
        <tr>
            <td>姓名</td>
            <td><input type="text" name="name" id="name" readonly></td>
        </tr>
        <tr>
            <td>原密码</td>
            <td><input type="password" name="oldpasswd" id="oldpasswd"></td>
        </tr>

        <tr>
            <td>新密码</td>
            <td><input type="password" name="newpasswd" id="newpasswd" onblur="checkpwd()"></td>
        </tr>
        <tr>
            <td>确认密码</td>
            <td><input type="password" name="newpasswd2" id="newpasswd2" onblur="checkpwd()" onchange="checkpwd()"></td>
            <td><span id="passwdspan"></span> </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center;">
                <input type="submit" value="提交">
                <input type="button" value="取消" onclick="touserinfo()">

            </td>
        </tr>
    </table>
</form>
</div>
<script src="js/jquery-1.4.2.min.js"></script>
<script language="JavaScript">

    function touserinfo() {
        window.location.href="showID.jsp";
    }

    function checkpwd() {
        var passwd=document.getElementById("newpasswd").value;
        var passwd2=document.getElementById("newpasswd2").value;
        if(passwd2==passwd&&passwd2!=""){
            document.getElementById("passwdspan").innerHTML="ok";
            return true;
        }
        else {
            document.getElementById("passwdspan").innerHTML="error";
            return false;
        }
        return  false;
    }

    function tochange() {
        var pwd=document.getElementById("newpasswd2").value;
        if(pwd!=""){
            var getjson = {
                "ID": $("#ID").val(),
                "oldpasswd": $("#oldpasswd").val(),
                "newpasswd": $("#newpasswd").val(),
            };
            $.ajax({
                type: "POST",
                url: "/changepasswd",
                // contentType: "application/json", //如果提交的是json数据类型，则必须有此参数,表示提交的数据类型
                dataType: "json", //表示返回值类型，不必须
                data: getjson,
                success: function (result) {
                    if(result==1) {
                        alert("修改成功！");
                        window.location.reload();
                    }
                    else if(result==3)
                        alert("密码错误！");
                    else if(result==2||result==0)
                        alert("系统错误！");
                },
                error: function (data) {
                    alert("请重新填写！");
                }
            });
        }
        else alert("请输入密码！");
    }



    function re_form(userid) {
        xmlHttp.open("GET", "/User_byID?user_id=" + userid, true);
        xmlHttp.onreadystatechange = function () {
            if (xmlHttp.readyState == 4) {
                var data = xmlHttp.responseText;
                var obj = JSON.parse(data);
                for (var i in obj) {
                    if (obj.length == 1) {
                        document.getElementById("ID").value = userid;
                        document.getElementById("name").value = obj[0].user_name;

                    }
                }
            }
        }
        xmlHttp.send();
    }
</script>
</body>
</html>
