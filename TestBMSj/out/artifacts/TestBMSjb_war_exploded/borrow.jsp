<%--
  Created by IntelliJ IDEA.
  User: zheng
  Date: 2019/8/12
  Time: 16:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>所借书籍</title>
    <link href="css/BMS_book.css" rel="stylesheet"/>
</head>
<body onload="initAJAX();startpage();">
<script src="js/commons.js"></script>
<script src="js/borrow_index.js"></script>
<%
    String id = request.getParameter("id");
    String pwd = request.getParameter("pwd");
//    out.println("id:" + id + "<br>");
//    out.print("pwd:" + pwd);
%>
<script src="js/cookie_info.js"></script>
<script language="JavaScript">
    function startpage() {
        getBorrowAll(<%=id%>);
    }

</script>

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
