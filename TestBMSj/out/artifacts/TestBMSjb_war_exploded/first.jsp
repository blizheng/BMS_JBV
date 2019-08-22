<%--
  Created by IntelliJ IDEA.
  User: zheng
  Date: 2019/8/6
  Time: 14:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录界面</title>
    <link href="css/bodystyle.css" rel="stylesheet"/>
</head>
<body onload="initAJAX();startcheck()">
<script src="js/cookie_info.js"></script>
<script language="JavaScript">
    function startcheck() {
        var info=getCookie_info();
        if(info.servletstop=="true")window.location.href="error.jsp";
        else getyzm();
    }
</script>
<form action="javascript:ajpost()" method="post" id="login_form" class="login_in">
    <table>
        <tr>
            <td class="log_tdname">用户名</td>
            <td><input type="text" name="ID" id="ID" class="login_input"></td>
        </tr>
        <tr>
            <td class="log_tdname">密 码</td>
            <td><input type="password" name="passwd" id="passwd" class="login_input"></td>
        </tr>
        <tr>
            <td class="log_tdname">验证码</td>
            <td><input type="text" name="yzmtext" id="yzmtext" value="" class="login_input"></td>
            <td><a href="javascript:getyzm()" target="_self">
                <img src="temp/yzm-test.jpg" style="height: 20px;width: 90px;border-radius: 4px;" id="yzmimg">
            </a>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center;">
                <input type="submit" value="登录" class="input_bt">
                <input type="button" value="注册" onclick="toregister()" class="input_bt">
            </td>
        </tr>
    </table>
</form>
<div style="visibility: hidden;display: none" id="yzm_imgtext"></div>
<%--<a href="javascript:ajpost()" target="_self">haha</a>--%>
<script src="js/jquery-1.4.2.min.js"></script>
<%--<script src="js/jquery.js"></script>--%>
<script src="js/commons.js"></script>
<script language="JavaScript">
    function toregister() {
        window.location.href="register.jsp";
    }

    function getyzm() {
        xmlHttp.open("GET", "/yzmimage", true);
        xmlHttp.onreadystatechange = function () {
            if (xmlHttp.readyState == 4) {
                var data = xmlHttp.responseText;
                var obj = JSON.parse(data);
                document.getElementById("yzmimg").src = obj.yzmload;
                document.getElementById("yzm_imgtext").value = obj.yzmtext;
                // alert(data);
            }
        }
        xmlHttp.send();
    }

    function ajpost() {
        var text1 = document.getElementById("yzmtext").value.toLowerCase();
        var text2="";
        if(document.getElementById("yzm_imgtext").value)
            text2 = document.getElementById("yzm_imgtext").value.toLowerCase();
        if (text1!=""&&text1==text2) {
            var getjson = {
                "ID": $("#ID").val(),
                "passwd": $("#passwd").val(),
                // "yzmimg":$("#yzmimg").val(),
            };
            $.ajax({
                type: "POST",
                url: "first_login",
                // contentType: "application/json", //如果提交的是json数据类型，则必须有此参数,表示提交的数据类型
                dataType: "json", //表示返回值类型，不必须
                // async:false,
                // data: JSON.stringify({ "InviteBidInfo":
                //         [{ 'BidProId': "1", 'BidProType': "2", 'BidProName': "3", 'ItemType': "4" }]
                // }),
                data: getjson,
                success: function (result) {

                    if (result == "success") {
                        // alert();
                        window.location.href = "showID.jsp?id="+document.getElementById("ID").value;
                    }
                    else if (result == "ID_error")
                        alert("账号错误！");
                    else alert("密码错误！");
                },
                error: function (data) {
                    alert("请重新填写！");
                }
            });
        }
        else alert("验证码不正确！");
    }
</script>
</body>
</html>
