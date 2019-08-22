<%--
  Created by IntelliJ IDEA.
  User: zheng
  Date: 2019/8/11
  Time: 17:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理员登录</title>
    <link href="css/bodystyle.css" rel="stylesheet"/>
</head>
<body onload="initAJAX();startcheck()">
<script src="js/cookie_info.js"></script>
<script language="JavaScript">
    function startcheck() {

    }
</script>

<form action="" method="post" id="login_form" class="login_in">
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
            <td colspan="2" style="text-align: center;">
                <input type="button" value="登录" onclick="managercheck()" class="input_bt">
                <input type="button" value="取消" onclick="tofirst()" class="input_bt">
            </td>
        </tr>
    </table>
</form>
<script src="js/jquery-1.4.2.min.js"></script>
<script src="js/commons.js"></script>
<script language="JavaScript">
    function tofirst() {
        window.location.href="first.jsp";
    }
    function managercheck() {
        var getjson = {
            "ID": $("#ID").val(),
            "passwd": $("#passwd").val(),
        };
        $.ajax({
            type: "POST",
            url: "/manager_list",
            // contentType: "application/json", //如果提交的是json数据类型，则必须有此参数,表示提交的数据类型
            dataType: "json", //表示返回值类型，不必须
            data: getjson,
            success: function (result) {
                if(result==1)
                    window.location.href="ManagerOP.jsp";
                else alert("密码账号错误！");
            },
            error: function (data) {
                alert("请重新填写！");
            }
        });
    }


</script>




<%--<!--	  footer-->--%>
<%--<link rel="stylesheet" type="text/css" href="css/footer.css">--%>
<%--<div class="nyh_footer" style="position: relative;">--%>

    <%--<div class="nyh_copyright">南昌大学计算机科学与技术162班郑梓熙 © 2019  </div>--%>
<%--</div><!--	  footer-->--%>

</body>
</html>
