<%--
  Created by IntelliJ IDEA.
  User: zheng
  Date: 2019/8/12
  Time: 16:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>更改信息</title>
</head>
<body onload="initAJAX();reset_form(2019005596);">

<form action="" method="" id="infoform">
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
            <td>密码</td>
            <td><input type="text" name="passwd" id="passwd"></td>
        </tr>
        <tr>
            <td>头像</td>
            <td><input type="file" name="image" id="image"></td>
        </tr>
        <tr>
            <td>电话</td>
            <td><input type="text" name="phone" id="phone"></td>
        </tr>
        <tr>
            <td>Email</td>
            <td><input type="text" name="email" id="email"></td>
        </tr>
        <tr>
            <td>地址</td>
            <td><input type="text" name="address" id="address"></td>
        </tr>
        <tr>
            <td>描述</td>
            <td><input type="text" name="desc" id="desc"></td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center;">
                <input type="button" value="提交" onclick="submit_form(2019005596)">
                <input type="button" value="重置" onclick="reset_form(2019005596)">
            </td>
        </tr>
    </table>
</form>
<script src="js/commons.js"></script>
<script language="JavaScript">

    function submit_form(userid) {
        alert(document.getElementById("image").src);
        var alr=prompt("请输入密码","");
        if(alr!=""&&alr!=null) {
            var arr = getinfo(userid);
            arr[8] = alr;
            update_userinfo(arr);
        }
        if(alr==""){
            alert("请输入密码!");
        }
    }
    function getinfo(userid) {

        var infoarr=[];
        infoarr[0]=userid;
        infoarr[1]=document.getElementById("name").value;

        var sexval=document.getElementsByName("sex");
        for (i = 0; i < sexval.length; ++i) { //遍历数组中的对象，查看有没有被选择的值
            if (sexval[i].checked) {  //checked代表被选择
                infoarr[2]=sexval[i].value;
            }
        }
        infoarr[3]=document.getElementById("phone").value;
        infoarr[4]=document.getElementById("image").value;

        infoarr[5]=document.getElementById("email").value;
        infoarr[6]=document.getElementById("address").value;
        infoarr[7]=document.getElementById("desc").value;
        return infoarr;

    }



    function update_userinfo(userinfo_arr) {
        xmlHttp.open("GET", "/UserInfoChange_byID?user_info=" + userinfo_arr, true);
        xmlHttp.onreadystatechange = function () {
            if (xmlHttp.readyState==4) {
                var data=xmlHttp.responseText;
                if(data==1)
                    alert("修改成功！");
                else if(data==2)
                    alert("修改失败，请重试！");
                else alert("未知错误！");
                reset_form(userinfo_arr[0]);
            }
            // reset_form(userinfo_arr[0]);
        }
        xmlHttp.send();
    }


    function reset_form(userid) {
        xmlHttp.open("GET", "/User_byID?user_id=" + userid, true);
        xmlHttp.onreadystatechange = function () {
            if (xmlHttp.readyState==4) {
                var data = xmlHttp.responseText;
                var obj = JSON.parse(data);
                for (var i in obj) {
                    if (obj.length == 1) {
                        document.getElementById("name").value = obj[0].user_name;
                        if(obj[0].user_sex=="男")
                            document.getElementById("sex_nan").checked=true;
                        if(obj[0].user_sex=="女")
                            document.getElementById("sex_nv").checked=true;
                        document.getElementById("image").value = obj[0].user_images;
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
