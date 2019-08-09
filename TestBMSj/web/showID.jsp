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
    <title>我猜中文会乱码</title>
    <link href="css/BMS_book.css" rel="stylesheet"/>
    <link href="css/BMS_userbook.css" rel="stylesheet"/>
</head>
<body onload="initAJAX();startpage();">
<script src="js/commons.js"></script>
<script src="js/borrow_index.js"></script>
<script src="js/user_get.js"></script>

<%
    String id = request.getParameter("id");
    String pwd = request.getParameter("pwd");
//    out.println("id:" + id + "<br>");
//    out.print("pwd:" + pwd);
%>
<%--<a href="javascript:getBorrowAll(<%=id%>)" target="_self">表格</a>--%>

<%--<a href="javascript:testajax(<%=id%>,<%=pwd%>)" target="_self">测试ajax</a>--%>
<%--<a href="javascript:showss(<%=id%>,<%=pwd%>)" target="_self">添加</a>--%>
<%--<br>--%>
<%--<a href="javascript:getUserInfo(<%=id%>)" target="_self">显示</a>--%>
<%--<div id="user_info1"></div>--%>

<script language="JavaScript">
    function startpage() {
        <%--var id ="${requestScope.id}";--%>
        var id = "<%=id%>";
        getUserInfo(id);
        // getBorrowAll(id);
    }

</script>

<%--菜单模块--%>
<div class="menu_head">
    <div><a href="" target="_blank">书库</a></div>
    <div><a href="" target="_blank">借书</a></div>
    <div><a href="" target="_blank">还书</a></div>
    <div><a href="" target="_blank">登录</a></div>
    <div><a href="" target="_blank">编辑资料</a></div>
    <div><a href="" target="_blank">退出</a></div>
</div>

<hr>
<%--用户信息--%>
<div class="user_head" id="user_info">

    <div class="div_user_img"><img src="images/kittens.jpg" class="user_img" id="user_image"></div>
    <div class="user_head_div user_id_pos">ID</div><div class="div_user_id" id="user_id">6130116096</div>
    <div class="user_head_div user_name_pos">姓名</div><div class="div_user_name" id="user_name">hahah</div>
    <div class="user_head_div user_sex_pos">性别</div><div class="div_user_sex" id="user_sex">男</div>
    <div class="user_head_div user_phone_pos">Phone</div><div class="div_user_phone" id="user_phone">123654455</div>
    <div class="user_head_div user_email_pos">Email</div> <div class="div_user_email" id="user_email">1145@qq.com</div>
    <div class="user_head_div user_address_pos">地址</div><div class="div_user_address" id="user_address">江西南昌</div>
    <div class="user_head_div user_desc_pos">个人描述</div><div class="div_user_desc" id="user_desc">这hi竞爱仕达按手打</div>

</div>
<div style="height: 50px"></div>
<%--显示所借书籍--%>
<div class="list_head">所借书籍信息</div>
<div style="height: 50px"></div>
<div class="show_list">
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
        <tbody id="get_bookborrow"></tbody>
    </table>
</div>
</body>
</html>

