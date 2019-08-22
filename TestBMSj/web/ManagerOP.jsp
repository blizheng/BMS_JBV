<%--
  Created by IntelliJ IDEA.
  User: zheng
  Date: 2019/8/20
  Time: 21:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>系统管理</title>
    <link href="css/BMS_book.css" rel="stylesheet"/>
    <style>
        .addbookbt{
            border: none;
            /*background-color: #2b542c;*/
            color: #2b6fd5;
        }
        .addbookbt:hover{
            color: #761c19;
        }
    </style>
</head>
<body onload="initAJAX();startcheck()">
<script src="js/cookie_info.js"></script>
<script src="js/commons.js"></script>
<script src="js/jquery-1.4.2.min.js"></script>
<script src="js/jquery-form.js"></script>
<script src="js/manager_bu.js"></script>
<script language="JavaScript">
    function startcheck() {
        var manager=getCookie_info();
        if(manager.manager_ID=="")
        {
            alert("请先登录！");
            window.location.href="manager.jsp";
        }
        else {
            getmanagerinfo(manager.manager_ID);
        }

    }
</script>
<script language="JavaScript">
    function getmanagerinfo(mid) {
        xmlHttp.open("GET", "/managerinfo?mid="+mid, true);
        xmlHttp.onreadystatechange = function () {
            if (xmlHttp.readyState == 4) {
                var data = xmlHttp.responseText;
                var obj = JSON.parse(data);
                document.getElementById("manager_id").innerHTML=obj[0].manager_id;
                document.getElementById("manager_name").innerHTML=obj[0].manager_name;
                document.getElementById("manager_privilege").innerHTML=obj[0].manager_privilege;

            }
        }
        xmlHttp.send();
    }
</script>
<link href="css/menu.css" rel="stylesheet"/>
<link href="css/BMS_userbook.css" rel="stylesheet"/>
<link href="css/manager.css" rel="stylesheet"/>
<%--菜单模块--%>
<div class="menu_head">
    <div class="MSname MSnamefont" style="position: absolute;top: -100px;">
        <a href="">书</a>
        <a href="">籍</a>
        <a href="">管</a>
        <a href="">理</a>
        <a href="">系</a>
        <a href="">统</a>
    </div>

    <div class="head_a_pos" style="left: 1080px;top: 10px;">
        <div><a href="javascript:book_add_js()" target="_blank">上新</a></div>
        <div><a href="javascript:book_dn_js()" target="_self">下架</a></div>
        <div><a href="javascript:book_change_js()" target="_self">变更</a></div>
        <%--<div><a href="first.jsp" target="_blank">删除用户</a></div>--%>
        <div><a href="/book.jsp" target="_blank">书库</a></div>
        <div><a href="/cookieclear?cid=2" target="_self">退出</a></div>
    </div>
</div>
<hr color="#00cc66" size="3" class="hr_set" style="width: 1400px">
<script language="JavaScript">
    function book_add_js() {
        document.getElementById("addbook_control_head").style.visibility="visible";
        document.getElementById("addbook_control_head").style.display="";
        document.getElementById("addbook_control_hdiv").style.visibility="visible";
        document.getElementById("addbook_control_hdiv").style.display="";
        document.getElementById("addbook_control_table").style.visibility="visible";
        document.getElementById("addbook_control_table").style.display="";


        document.getElementById("changebook_control_head").style.visibility="hidden";
        document.getElementById("changebook_control_head").style.display="none";
        document.getElementById("changebook_control_hdiv").style.visibility="hidden";
        document.getElementById("changebook_control_hdiv").style.display="none";
        document.getElementById("changebook_control_table").style.visibility="hidden";
        document.getElementById("changebook_control_table").style.display="none";


        document.getElementById("dnbook_control_head").style.visibility="hidden";
        document.getElementById("dnbook_control_head").style.display="none";
        document.getElementById("dnbook_control_hdiv").style.visibility="hidden";
        document.getElementById("dnbook_control_hdiv").style.display="none";
        document.getElementById("dnbook_control_table").style.visibility="hidden";
        document.getElementById("dnbook_control_table").style.display="none";

    }
    function book_dn_js() {
        document.getElementById("dnbook_control_head").style.visibility="visible";
        document.getElementById("dnbook_control_head").style.display="";
        document.getElementById("dnbook_control_hdiv").style.visibility="visible";
        document.getElementById("dnbook_control_hdiv").style.display="";
        document.getElementById("dnbook_control_table").style.visibility="visible";
        document.getElementById("dnbook_control_table").style.display="";


        document.getElementById("changebook_control_head").style.visibility="hidden";
        document.getElementById("changebook_control_head").style.display="none";
        document.getElementById("changebook_control_hdiv").style.visibility="hidden";
        document.getElementById("changebook_control_hdiv").style.display="none";
        document.getElementById("changebook_control_table").style.visibility="hidden";
        document.getElementById("changebook_control_table").style.display="none";


        document.getElementById("addbook_control_head").style.visibility="hidden";
        document.getElementById("addbook_control_head").style.display="none";
        document.getElementById("addbook_control_hdiv").style.visibility="hidden";
        document.getElementById("addbook_control_hdiv").style.display="none";
        document.getElementById("addbook_control_table").style.visibility="hidden";
        document.getElementById("addbook_control_table").style.display="none";
    }
    function book_change_js() {
        // document.getElementById("bookinfo_all").innerHTML="";
        get_Bookinfo();
        document.getElementById("changebook_control_head").style.visibility="visible";
        document.getElementById("changebook_control_head").style.display="";
        document.getElementById("changebook_control_hdiv").style.visibility="visible";
        document.getElementById("changebook_control_hdiv").style.display="";
        document.getElementById("changebook_control_table").style.visibility="visible";
        document.getElementById("changebook_control_table").style.display="";


        document.getElementById("addbook_control_head").style.visibility="hidden";
        document.getElementById("addbook_control_head").style.display="none";
        document.getElementById("addbook_control_hdiv").style.visibility="hidden";
        document.getElementById("addbook_control_hdiv").style.display="none";
        document.getElementById("addbook_control_table").style.visibility="hidden";
        document.getElementById("addbook_control_table").style.display="none";


        document.getElementById("dnbook_control_head").style.visibility="hidden";
        document.getElementById("dnbook_control_head").style.display="none";
        document.getElementById("dnbook_control_hdiv").style.visibility="hidden";
        document.getElementById("dnbook_control_hdiv").style.display="none";
        document.getElementById("dnbook_control_table").style.visibility="hidden";
        document.getElementById("dnbook_control_table").style.display="none";
    }

</script>




<%--管理员信息--%>
<div class="user_head" id="manager_info" style="width: 1000px">

    <div class="user_head_div manager_id_pos">ID</div><div class="div_manager_id" id="manager_id">123</div>
    <div class="user_head_div manager_name_pos">姓名</div><div class="div_manager_name" id="manager_name">5455</div>
    <div class="user_head_div manager_privilege_pos">权限</div><div class="div_manager_privilege" id="manager_privilege">5555</div>
    <div class="startservlet_bt_pos"><a href="javascript:stopservlet()" class="st_s_bt"target="_self">系统维护</a> </div>
    <div class="stopservlet_bt_pos"><a href="javascript:restart()" class="st_s_bt" target="_self">重启系统</a></div>
</div>
<script language="JavaScript">
    function stopservlet() {
        alert("关闭成功！");
        window.open("/stopservlet","_blank");

    }
    function restart() {
        alert("即将下线");
        window.location.href="/startservlet";
        // window.location.href="/startservlet";
    }
</script>

<div style="height: 300px"></div>

<%--添加书籍--%>
<div class="list_head" id="addbook_control_head">添加书籍</div>
<div style="height: 50px" id="addbook_control_hdiv"></div>
<div class="show_list" id="addbook_control_table">
    <form action="/addbook" id="book_add_form" method="post" enctype="multipart/form-data" onsubmit="return bacheck()">
        <table class="table_book" border="0" cellspacing="0" cellpadding="0" id="ss">
            <tr>
                <td class="th_img title_bg">图片</td>
                <td class="th_author title_bg">作者信息</td>
                <td class="th_pub title_bg">出版社</td>
                <td class="th_num title_bg">馆藏数量</td>
                <td class="th_price title_bg">价格</td>
                <td class="th_isbn title_bg">ISBN</td>
                <td class="th_category title_bg">所属类别</td>
                <td class="th_desc title_bg">相关简介</td>
                <td class="th_operate title_bg">操作</td>
            </tr>

            <%--测试使用样例--%>

            <tr>
                <td>
                    <input type="file" name="b_img" id="b_img" style="width: 50px;height: 30px;">
                    <input type="text" name="b_name" id="b_name" placeholder="点击输入书名" style="border: none">

                </td>
                <td id="book_author"><input type="text" name="b_author" id="b_author" placeholder="点击输入"
                                            style="border: none"></td>
                <td id="book_pub"><input type="text" name="b_pub" id="b_pub" placeholder="点击输入" style="border: none">
                </td>
                <td id="book_num" class="green"><input type="text" name="b_num" id="b_num" placeholder="点击输入"
                                                       style="border: none"></td>
                <td id="book_price"><input type="text" name="b_price" id="b_price" placeholder="点击输入"
                                           style="border: none"></td>
                <td id="isbn"><input type="text" name="b_isbn" id="b_isbn" placeholder="*点击输入" style="border: none">
                </td>
                <td id="book_category"><input type="text" name="b_category" id="b_category" placeholder="*点击输入"
                                              style="border: none"></td>
                <td id="book_desc">
                    <%--<input type="text" name="b_desc" id="b_desc2" placeholder="点击输入" style="border: none">--%>
                    <textarea name="b_desc" id="b_desc" placeholder="点击输入" style="border: none"></textarea>
                </td>
                <%--<td><a href="javascript:add_books()" target="_self" id="operateadd" >添加</a></td>--%>
                <td><input type="submit" value="添加" class="addbookbt"></td>
            </tr>

        </table>
    </form>
</div><%--添加书籍--%>

<script language="JavaScript">
    function add_books() {
        document.getElementById("book_add_form").submit();
    }


    function bacheck() {
        var da = $("#b_isbn").val();
        var ca = $("#b_category").val();

        if (da != "" && ca != "") {
            $("#book_add_form").ajaxSubmit(function (message) {
                if (message == 1) {
                    alert("添加成功！");
                    document.getElementById("book_add_form").reset();
                }
                else if (message == 3) {
                    alert("该书已存在！");
                }
                else {
                    alert("请重试！");
                }
                // alert(message);
            });
        }
        else alert("请输入必要信息");
        return false; // 必须返回false，否则表单会自己再做一次提交操作，并且页面跳转
    }

</script>


<%--变更书籍信息--%>
<div class="list_head" id="changebook_control_head" style="visibility: hidden;display: none">变更书籍信息</div>
<div style="height: 50px" id="changebook_control_hdiv" style="visibility: hidden;display: none"></div>
<div class="show_list" id="changebook_control_table" style="visibility: hidden;display: none">
    <%--<form action="/updatebookinfo" id="book_change_form" method="post" enctype="multipart/form-data" onsubmit="return bccheck()">--%>
    <table class="table_book" border="0" cellspacing="0" cellpadding="0" id="bc">
        <tr>
            <td class="th_img title_bg">图片</td>
            <td class="th_author title_bg">作者信息</td>
            <td class="th_pub title_bg">出版社</td>
            <td class="th_num title_bg">馆藏数量</td>
            <td class="th_price title_bg">价格</td>
            <td class="th_isbn title_bg">ISBN</td>
            <td class="th_category title_bg">所属类别</td>
            <td class="th_desc title_bg">相关简介</td>
            <td class="th_operate title_bg">操作</td>
        </tr>

        <%--测试使用样例--%>
        <%----%>
        <%--<tr>--%>
        <%--<td>--%>
        <%--<img src="../images/book.jpg" class="list_img" id="bc_img">--%>
        <%--<input type="text" name="bc_name" id="bc_name"  style="border: none">--%>

        <%--</td>--%>
        <%--<td id="book_author"><input type="text" name="bc_author" id="bc_author" style="border: none"></td>--%>
        <%--<td id="book_pub"><input type="text" name="bc_pub" id="bc_pub" style="border: none">--%>
        <%--</td>--%>
        <%--<td id="book_num" class="green"><input type="text" name="bc_num" id="bc_num" style="border: none"></td>--%>
        <%--<td id="book_price"><input type="text" name="bc_price" id="bc_price" style="border: none"></td>--%>
        <%--<td id="isbn"><input type="text" name="bc_isbn" id="bc_isbn" style="border: none">--%>
        <%--</td>--%>
        <%--<td id="book_category"><input type="text" name="bc_category" id="bc_category" style="border: none"></td>--%>
        <%--<td id="book_desc">--%>
        <%--&lt;%&ndash;<input type="text" name="b_desc" id="b_desc2" placeholder="点击输入" style="border: none">&ndash;%&gt;--%>
        <%--<textarea name="bc_desc" id="bc_desc" style="border: none"></textarea>--%>
        <%--</td>--%>
        <%--&lt;%&ndash;<td><a href="javascript:addbookinfo()" target="_self" id="operate" >添加</a></td>&ndash;%&gt;--%>
        <%--<td><input type="submit" value="更新"></td>--%>
        <%--</tr>--%>

        <tbody id="bookinfo_all"></tbody>
    </table>
    <%--</form>--%>
</div><%--变更书籍信息--%>

<%--<a href="javascript:get_Bookinfo()" target="_self">asa</a>--%>
<script language="JavaScript">
    function bccheck() {

    }
</script>


<%--下架书籍--%>
<div class="list_head" id="dnbook_control_head" style="visibility: hidden;display: none">下架书籍</div>
<div style="height: 50px" id="dnbook_control_hdiv" style="visibility: hidden;display: none"></div>
<div class="show_list" id="dnbook_control_table" style="visibility: hidden;display: none">
    <table class="table_book" border="0" cellspacing="0" cellpadding="0" id="bd">
        <tr>
            <td class="th_isbn title_bg"></td>


            <td class="th_isbn title_bg">ISBN</td>
            <td class="th_operate title_bg">操作</td>
            <td class="th_isbn title_bg"></td>
            <td class="th_isbn title_bg"></td>
        </tr>
        <tr>
            <td class="th_isbn title_bg"></td>
            <td class="th_isbn title_bg"><input type="text" name="bd_isbn" id="bd_isbn" placeholder="输入书号" style="border: none"></td>
            <td class="th_isbn title_bg"> <a href="javascript:dnbookingo()" target="_self" id="operatedn" >下架</a></td>
            <td class="th_isbn title_bg"></td>
            <td class="th_isbn title_bg"></td>
        </tr>
    </table>
</div><%--下架书籍--%>
<script language="JavaScript">

    function dnbookingo() {
        $.ajax({
            type: "POST",
            url: "/dnbook",
            dataType: "json", //表示返回值类型，不必须
            data: {"isbn":$("#bd_isbn").val()},
            success: function (result) {
                if (result==1)
                    alert("下架成功！");
                else alert("输入有误！");
                // alert(result);
            },
            error: function (data) {
                alert("请重试！");
            }
        });
    }
</script>








<%--<div class="bookadd_div" id="bookadd">--%>
<%--<form action="" method="post" id="bookadd_form">--%>
    <%--<table>--%>
        <%--<tr>--%>
            <%--<td>ISBN</td>--%>
            <%--<td><input type="text" name="bookid" id="bookid"></td>--%>
        <%--</tr>--%>
        <%--<tr>--%>
            <%--<td>书名</td>--%>
            <%--<td><input type="text" name="bookname" id="bookname"></td>--%>
        <%--</tr>--%>
        <%--<tr>--%>
            <%--<td>作者</td>--%>
            <%--<td><input type="text" name="bookauthor" id="bookauthor"></td>--%>
        <%--</tr>--%>


        <%--<tr>--%>
            <%--<td colspan="2" style="text-align: center;">--%>
                <%--<input type="button" value="检查" onclick="managercheck()">--%>
                <%--<input type="button" value="继续" onclick="toregister()">--%>
            <%--</td>--%>
        <%--</tr>--%>
    <%--</table>--%>
<%--</div>--%>
<%--</form>--%>






<!--	  footer-->
<div style="height: 50px;"></div>
<link rel="stylesheet" type="text/css" href="css/footer.css">
<div class="nyh_footer" style="position: relative;">

    <div class="nyh_copyright">南昌大学计算机科学与技术162班郑梓熙 © 2019  </div>
</div><!--	  footer-->

</body>
</html>
