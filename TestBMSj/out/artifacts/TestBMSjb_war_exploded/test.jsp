<%--
  Created by IntelliJ IDEA.
  User: zheng
  Date: 2019/8/6
  Time: 14:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>测试使用</title>
</head>
<body onload="initAJAX();">
<script src="js/commons.js"></script>

<form method="POST" enctype="multipart/form-data" action="UploadServlet" id="forminfo">
    <table>
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
        <tr>
            <td>文件: </td>
            <td>
            <input type="file" name="up" id="fileimg"></td>
        </tr>
        <tr>
        <td> <input type="submit" value="上传"></td>
        </tr>
    </table>
</form>
<script language="JavaScript">
    function aas() {
        var data=document.getElementById("forminfo").value;
        alert(data);
        var formData = new FormData();
        var picFileList = document.getElementById("fileimg").value;
        formData.append("fileimg" , picFileList[0]);
        alert(formData.value);

    }


    function ssd() {



        xmlHttp.open("POST", "/UploadServlet", true);
        xmlHttp.onreadystatechange = function () {
            if (xmlHttp.readyState==4) {

            }
            // reset_form(userinfo_arr[0]);
        }
        xmlHttp.send();

    }
</script>
<%--<c:if test="${not empty errorMessage}">--%>
    <%--<input type="text" id="errorMessage" value="${errorMessage}" style="color:red;" disabled="disabled">--%>
<%--</c:if>--%>

<%--
<form action="" method="" id="infoform" enctype="application/x- www-form-urlencoded">
    <table>
<tr>
    <td>头像</td>
    <td><input type="file" name="image" id="image"></td>
</tr>
        <tr>
            <td>路径</td>
            <td><input type="text" name="path" id="path"></td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center;">
                <input type="button" value="提交" onclick="show()">
                <input type="button" value="重置" onclick="update()">
            </td>
        </tr>
    </table>
</form>
<div align="center">
    <form action="test" enctype="multipart/form-data" method="post">
        名称：<input name="name" /> <br>
        上传文件：<input name="img" type="file"/><br>
        <input type="submit" value="提交" /> &nbsp;&nbsp;
        <input type="reset" value="重置" />
    </form>
</div>
--%>
<script language="JavaScript">
    function show() {
        var filepath=document.getElementById("image").value;
        alert(filepath);
        document.getElementById("path").value=filepath;

    }

    function update() {
        var path=document.getElementById("path").value;
        alert(path);
        xmlHttp.open("GET", "/test?path=" + path, true);
        xmlHttp.onreadystatechange = function () {
            if (xmlHttp.readyState==4) {
                alert(1222);
            }
            // reset_form(userinfo_arr[0]);
        }
        xmlHttp.send();
    }
</script>
<script language="JavaScript">
    function getconfigURL() {


    }
</script>
</body>
</html>
