<%--
  Created by IntelliJ IDEA.
  User: zheng
  Date: 2018/10/31
  Time: 10:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>个人界面</title>
    <link href="css/BMS_book.css" rel="stylesheet"/>
    <link href="css/BMS_userbook.css" rel="stylesheet"/>
    <link href="css/menu.css" rel="stylesheet"/>
</head>
<body onload="initAJAX();startpage();">
<script src="js/commons.js"></script>
<script src="js/borrow_index.js"></script>
<script src="js/user_get.js"></script>
<script src="js/menu.js"></script>
<%--<a href="javascript:getBorrowAll(<%=id%>)" target="_self">表格</a>--%>

<%--<a href="javascript:testajax(<%=id%>,<%=pwd%>)" target="_self">测试ajax</a>--%>
<%--<a href="javascript:showss(<%=id%>,<%=pwd%>)" target="_self">添加</a>--%>
<%--<br>--%>
<%--<a href="javascript:getUserInfo(<%=id%>)" target="_self">显示</a>--%>
<%--<div id="user_info1"></div>--%>
<script src="js/cookie_info.js"></script>
<script language="JavaScript">

    function startpage() {
        var dt=document.cookie;
        var infoarr=getCookie_info();
        if(infoarr.servletstop=="true")window.location.href="error.jsp";
        else if(dt==""||infoarr.user_id=="") {
            alert("请先登录！");
            window.location.href = "first.jsp";
        }
        else {
            getUserInfo(infoarr.user_id);
            // getBookAll(infoarr.user_id);
            // getBorrowAll(infoarr.user_id);
        }
    }
</script>

<%--菜单模块--%>
<div class="menu_head">
    <div class="MSname MSnamefont">
        <a href="">书</a>
        <a href="">籍</a>
        <a href="">管</a>
        <a href="">理</a>
        <a href="">系</a>
        <a href="">统</a>
    </div>

    <div class="head_a_pos">
    <div><a href="book.jsp" target="_blank">书库</a></div>
    <div><a href="javascript:showBook()" target="_self">借书</a></div>
    <div><a href="javascript:showBorrow()" target="_self">还书</a></div>
    <div><a href="first.jsp" target="_blank">登录</a></div>
    <div><a href="javascript:menu_changeuserinfo()" target="_blank">设置</a></div>
    <div><a href="/cookieclear?cid=1" target="_self">退出</a></div>
    </div>
</div>
<br>
<%--<hr class="hr_head">--%>
<hr color="#00cc66" size="3" class="hr_set" style="width: 1400px">

<%--用户信息--%>
<div class="user_head" id="user_info">

    <div class="div_user_img"><img src="images/head_test.jpg" class="user_img" id="user_image"></div>
    <div class="user_head_div user_id_pos">ID</div><div class="div_user_id" id="user_id"></div>
    <div class="user_head_div user_name_pos">姓名</div><div class="div_user_name" id="user_name"></div>
    <div class="user_head_div user_sex_pos">性别</div><div class="div_user_sex" id="user_sex"></div>
    <div class="user_head_div user_phone_pos">Phone</div><div class="div_user_phone" id="user_phone"></div>
    <div class="user_head_div user_email_pos">Email</div> <div class="div_user_email" id="user_email"></div>
    <div class="user_head_div user_address_pos">地址</div><div class="div_user_address" id="user_address"></div>
    <div class="user_head_div user_desc_pos">个人简介</div><div class="div_user_desc" id="user_desc"></div>

</div>
<div style="height: 270px"></div>


<%--显示书库--%>

<script src="js/book_index.js"></script>


<div class="list_head" id="book_control_head" style="visibility: hidden;display: none">所有书籍信息</div>
<div style="height: 50px"id="book_control_hdiv" style="visibility: hidden;display: none"></div>
<div class="show_list" id="book_control_table" style="visibility: hidden;display: none">
    <table class="table_book" border="0" cellspacing="0" cellpadding="0">
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
        <%--
        <tr>
            <td>
                <img src="images/book.jpg" class="list_img" id="book_img1">
                <div id="book_name1" calss="td_span">追风筝的人
                </div>
            </td>
            <td id="book_author1">卡勒德·胡塞尼</td>
            <td id="book_pub1">上海人民出版社</td>
            <td id="book_num1" class="green">222222</td>
            <td id="book_price1">21.6</td>
            <td id="isbn1">9787208061644</td>
            <td id="book_category1">综合性图书</td>
            <td id="book_desc1">
                6666666666666666666666666
            </td>
            <td><a href="javascript:change_img_tb()" target="_self" id="operate1">借书</a></td>
        </tr>--%>
        <%--测试使用样例--%>

        <tbody id="book_all"></tbody>
        <%--添加书籍信息--%>
    </table>
</div>

<%--显示所借书籍--%>
<div class="list_head" id="borrow_control_head">所借书籍信息</div>
<div style="height: 50px" id="borrow_control_hdiv"></div>
<div class="show_list" id="borrow_control_table">
    <table class="table_book" border="0" cellspacing="0" cellpadding="0">
        <tr>
            <td class="th_img title_bg">图片</td>
            <td class="th_author title_bg">作者信息</td>
            <td class="th_pub title_bg">出版社</td>
            <td class="th_price title_bg">价格</td>
            <td class="th_isbn title_bg">ISBN</td>
            <td class="th_category title_bg">所属类别</td>
            <td class="th_desc title_bg">相关简介</td>
            <td class="th_borrowtime title_bg">借书日期</td>
            <td class="th_returntime title_bg">应还日期</td>
            <td class="th_operate title_bg">操作</td>
        </tr>

        <%--测试使用样例--%>
        <%--
        <tr>
            <td>
                <img src="images/book.jpg" class="list_img" id="book_img">
                <div id="book_name" calss="td_span">追风筝的人
                </div>
            </td>
            <td id="book_author">卡勒德·胡塞尼</td>
            <td id="book_pub">上海人民出版社</td>
            <td id="book_price">21.6</td>
            <td id="isbn">9787208061644</td>
            <td id="book_category">综合性图书</td>
            <td id="book_desc">
                6666666666666666666666666
            </td>
            <td id="borrow_time">20190802</td>
            <td id="return_time">20191002</td>
            <td><a href="javascript:change_img_tb()" target="_self" id="operate">还书</a></td>
        </tr>
        --%>
        <%--测试使用样例--%>

        <tbody id="get_bookborrow"></tbody>
    </table>
</div>



<!--	  footer-->
<link rel="stylesheet" type="text/css" href="css/footer.css">
<div class="nyh_footer" style="position: relative;">
    <div class="nyh_copyright">南昌大学计算机科学与技术162班郑梓熙 © 2019  </div>
</div><!--	  footer-->

<script language="JavaScript">

</script>
</body>
</html>

