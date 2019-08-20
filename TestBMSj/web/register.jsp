<%--
  Created by IntelliJ IDEA.
  User: zheng
  Date: 2019/8/19
  Time: 14:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户注册</title>
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
<form action="javascript:user_register()" method="post" id="register_form" onsubmit="check_form()">
    <table>
        <tr id="uid">
            <td><span style="color: red">*</span>用户名</td>
            <td><input type="text" name="ID" id="ID" placeholder="纯数字（1-9位）" onblur="checkid()"></td>
            <td><span id="idspan"></span></td>
        </tr>
        <tr id="uname">
            <td><span style="color: red">*</span>姓名</td>
            <td><input type="text" name="name" id="name"></td>
        </tr>
        <tr id="usex">
            <td><span style="color: red">*</span>性别</td>
            <td>
                <input type="radio" name="sex" id="sex_nan" value="1">男
                <input type="radio" name="sex" id="sex_nv" value="2">女
            </td>
        </tr>
        <tr id="upasswd">
            <td><span style="color: red;">*</span>密码</td>
            <td><input type="password" name="passwd" id="passwd" onblur="checkpasswd()"></td>
        </tr>
        <tr id="upasswd2">
            <td><span style="color: red">*</span>确认密码</td>
            <td><input type="password" name="passwd2" id="passwd2" onblur="checkpasswd()"></td>
            <td><span id="passwdspan"></span> </td>
        </tr>
            <tr id="uyzm">
                <td>验证码</td>
                <td><input type="text" name="yzmtext" id="yzmtext" value=""></td>
                <td><a href="javascript:getyzm()" target="_self">
                    <img src="temp/yzm-test.jpg" style="height: 20px;width: 90px" id="yzmimg">
                </a>
                </td>
            </tr>
            <tr id="uhide">
                <td colspan="2" style="text-align: center;">
                    <input type="button" value="注册" onclick="goon_reg()">
                    <input type="button" value="取消" onclick="tologin()">
                </td>
            </tr>


        <tr id="uimage" style="visibility: hidden;display: none">
        <td>头像</td>
        <td><input type="file" name="image" id="image"></td>
    </tr>
        <tr id="uphone" style="visibility: hidden;display: none">
            <td>电话</td>
            <td><input type="tel" name="phone" id="phone"></td>
        </tr>
        <tr id="uemail" style="visibility: hidden;display: none">
            <td>Email</td>
            <td><input type="email" name="email" id="email"></td>
        </tr>
        <tr id="uaddress" style="visibility: hidden;display: none">
            <td>地址</td>
            <td><input type="text" name="address" id="address"></td>
        </tr>
        <tr id="udesc" style="visibility: hidden;display: none">
            <td>简介</td>
            <td><input type="text" name="desc" id="desc"></td>
        </tr>

        <tr id="usubmit" style="visibility: hidden;display: none">
            <td colspan="2" style="text-align: center;">
                <input type="submit" value="确认">
                <input type="submit" value="跳过">
            </td>
        </tr>

    </table>
</form>
<a href="javascript:getsex()" target="_self">ceshi</a>
<script language="JavaScript">

    function tologin() {
        window.location.href="first.jsp";
    }

    function goon_reg() {
        if(check_form()){
            document.getElementById("uid").style.visibility="hidden";
            document.getElementById("uid").style.display="none";
            document.getElementById("uname").style.visibility="hidden";
            document.getElementById("uname").style.display="none";
            document.getElementById("usex").style.visibility="hidden";
            document.getElementById("usex").style.display="none";
            document.getElementById("upasswd").style.visibility="hidden";
            document.getElementById("upasswd").style.display="none";
            document.getElementById("upasswd2").style.visibility="hidden";
            document.getElementById("upasswd2").style.display="none";
            document.getElementById("uyzm").style.visibility="hidden";
            document.getElementById("uyzm").style.display="none";
            document.getElementById("uhide").style.visibility="hidden";
            document.getElementById("uhide").style.display="none";

            document.getElementById("uimage").style.visibility="visible";
            document.getElementById("uimage").style.display="";
            document.getElementById("uphone").style.visibility="visible";
            document.getElementById("uphone").style.display="";
            document.getElementById("uemail").style.visibility="visible";
            document.getElementById("uemail").style.display="";
            document.getElementById("uaddress").style.visibility="visible";
            document.getElementById("uaddress").style.display="";
            document.getElementById("udesc").style.visibility="visible";
            document.getElementById("udesc").style.display="";
            document.getElementById("usubmit").style.visibility="visible";
            document.getElementById("usubmit").style.display="";
        }

    }
</script>
<div style="visibility: hidden;display: none" id="yzm_imgtext"></div>
<script src="js/commons.js"></script>
<script src="js/jquery-1.4.2.min.js"></script>
<script language="JavaScript">

    function isIDok() {

        var id=document.getElementById("idspan").innerHTML;
        if(id=="ok")return true;
        else return false;


    }

    function getsex() {

        var radio_tag = document.getElementsByName("sex");
        for(var i=0;i<radio_tag.length;i++){
            if(radio_tag[i].checked){
                // var checkvalue = radio_tag[i].value;
                if(radio_tag[i].value==1)
                    return $("#sex_nan").val();
                if(radio_tag[i].value==2)
                    return $("#sex_nv").val();
            }
        }
        return "";
    }

    function checkid() {
        var uid=document.getElementById("ID").value;
        if(uid.length<=9){
            xmlHttp.open("GET", "/idcheck?reg_id="+uid, true);
            xmlHttp.onreadystatechange = function () {
                if (xmlHttp.readyState == 4&&xmlHttp.status==200) {
                    var data = xmlHttp.responseText;
                    // var obj = JSON.parse(data);
                    if (data==1)
                    {
                        document.getElementById("idspan").innerHTML="ok";

                    }
                    else {
                        document.getElementById("idspan").innerHTML="error";
                    }
                }
            }
            xmlHttp.send();
        }
        else{
            document.getElementById("idspan").innerHTML="error";
    }

    }

    function checkpasswd() {
        var passwd=document.getElementById("passwd").value;
        var passwd2=document.getElementById("passwd2").value;
        if(passwd2==passwd&&passwd2!=""){
            document.getElementById("passwdspan").innerHTML="ok";
            return true;
        }
        else {
            document.getElementById("passwdspan").innerHTML="error";
            return false;
        }
    }

    function check_form() {
        var id=document.getElementById("ID").value;
        var name=document.getElementById("name").value;
        var sex=getsex();
        var passwd=document.getElementById("passwd").value;
        var passwd2=document.getElementById("passwd2").value;
        if(id==""){
            alert("请输入ID！");
            return false;
        }
        else if(name==""){
            alert("请输入姓名！");
            return false;
        }
        else if(sex==""){
            alert("请选择性别！");
            return false;
        }
        else if(passwd==""||passwd!=passwd2){
            alert("请确认密码！")
            return false;
        }
        else if(!checkyzm()){
            alert("验证码错误!");
            return false;
        }
        else if(!isIDok()||!checkpasswd()){
            alert("hahaha");
            return false;
        }
        else return true;
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

    function checkyzm() {
        var text1 = document.getElementById("yzmtext").value.toLowerCase();
        var text2 = "";
        if (document.getElementById("yzm_imgtext").value)
            text2 = document.getElementById("yzm_imgtext").value.toLowerCase();
        if (text1 != "" && text1 == text2) {
            return true;
        }
        else return false;
    }

    function user_register() {

                var getjson = {
                    "ID": $("#ID").val(),
                    "name": $("#name").val(),
                    "passwd": $("#passwd2").val(),
                    "sex": getsex(),
                    "headimg": $("#image").val(),
                    "phone": $("#phone").val(),
                    "email": $("#email").val(),
                    "address": $("#address").val(),
                    "desc": $("#desc").val(),
                };
                $.ajax({
                    type: "POST",
                    url: "/registerset",
                    // contentType: "application/json", //如果提交的是json数据类型，则必须有此参数,表示提交的数据类型
                    dataType: "json", //表示返回值类型，不必须
                    // async:false,
                    // data: JSON.stringify({ "InviteBidInfo":
                    //         [{ 'BidProId': "1", 'BidProType': "2", 'BidProName': "3", 'ItemType': "4" }]
                    // }),
                    data: getjson,
                    success: function (result) {
                        if(result==1){
                            var id=document.getElementById("ID").value;
                            window.location.href="showID.jsp?id="+id;
                        }
                        else
                        {
                            alert("请重试！");
                            window.location.href="register.jsp";
                        }
                        // alert(result);
                    },
                    error: function (data) {
                        alert("请重新注册！");
                        window.location.href="register.jsp";
                    }
                });

    }
</script>
</body>
</html>
