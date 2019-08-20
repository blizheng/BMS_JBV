<%--
  Created by IntelliJ IDEA.
  User: zheng
  Date: 2019/8/5
  Time: 12:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>书库</title>
    <link href="css/BMS_book.css" rel="stylesheet"/>
</head>
<body onload="initAJAX();addmore();">
<%--javascript:returnbook_byid(2019080402,2019005596)--%>
<%--<a href="javascript:borrowbookfunc(2019080402,2019005596)">测试借书</a>--%>

<%--<a href="javascript:addmore()">12</a>--%>
<%
    String id = request.getParameter("id");
    String pwd = request.getParameter("pwd");
//    out.println("id:" + id + "<br>");
//    out.print("pwd:" + pwd);
%>
<script src="js/cookie_info.js"></script>
<script language="JavaScript">
    function addmore() {
        var info=getCookie_info();
        if(info.servletstop=="true")window.location.href="error.jsp";
        else if(info.user_id==""){
            // alert("请登录！");
            // window.location.href = "first.jsp";
        }
        getBookAll(info.user_id);
    }

</script>
<div class="show_list">
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

        <%--测试样例--%>
        <%--
        <tr>
            <td>
                <img src="images/book.jpg" class="list_img" id="book_img">
                <div id="book_name" calss="td_span">追风筝的人
                </div>
            </td>
            <td id="book_author">卡勒德·胡塞尼</td>
            <td id="book_pub">上海人民出版社</td>
            <td id="book_num" class="green">222222</td>
            <td id="book_price">21.6¥</td>
            <td id="isbn">9787208061644</td>
            <td id="book_category">综合性图书</td>
            <td id="book_desc">
                6666666666666666666666666
            </td>
            <td><a href="javascript:change_img_tb()" target="_self" id="operate">借书</a></td>
        </tr>--%>
        <%--测试样例--%>

        <tbody id="book_all"></tbody>
        <%--添加书籍信息--%>


    </table>
</div>

<script src="js/commons.js"></script>
<script src="js/book_index.js"></script>
<script src="js/borrow_index.js"></script>
<script language="JavaScript">


</script>


<script language="JavaScript">
    function change_img_tb() {
        document.getElementById("book_img").src = "images/login.png";
        document.getElementById("book_num").style.color = "red";
        document.getElementById("book_num").innerHTML = "25";
    }

    <%--

    function getBookAll1(){
        xmlHttp.open("GET", "/Book", true);
        xmlHttp.onreadystatechange = function () {
            if (xmlHttp.readyState == 4) {
                var data = xmlHttp.responseText;
                var obj = JSON.parse(data);
                var htmlall=document.getElementById("book_all");
                for (var i in obj) {
                    var listHtml = document.createElement("tr");
                    listHtml.innerHTML = '<td>\n' +
                        '                <img src="'+obj[i].book_image+'" class="list_img" id="book_img">\n' +
                        '                <div id="book_name" calss="td_span">'+obj[i].book_name+
                        '                </div>\n' +
                        '            </td>\n' +
                        '            <td id="book_author">'+obj[i].book_author+'</td>\n' +
                        '            <td id="book_pub">'+obj[i].book_pub+'</td>\n' +
                        '            <td id="book_num" class="green">'+obj[i].book_num+'</td>\n' +
                        '            <td id="book_price">'+obj[i].book_price+'</td>\n' +
                        '            <td id="isbn">'+obj[i].isbn+'</td>\n' +
                        '            <td id="book_category">'+obj[i].category_id+'</td>\n' +
                        '            <td id="book_desc">\n' +
                        // obj[i].book_description+

                        '            </td>\n' +
                        '            <td><a href="javascript:change_img_tb()" target="_self" id="operate">借书</a></td>  ';

                    htmlall.appendChild(listHtml);
                    htmlall.insertBefore(listHtml,htmlall.nextSibling);
                }
                // document.getElementById("book_all").innerHTML = htmlall;
                // document.getElementById("bb").innerHTML = listHtml;
                // insertBefore(newNode,refChild.nextSibling);
            }
        }
        xmlHttp.send();
    }

    --%>
</script>

<!--	  footer-->
<link rel="stylesheet" type="text/css" href="css/footer.css">
<div class="nyh_footer" style="position: relative;">
    <%--<div class="nyh_footer_nav">--%>
        <%--<a href="#" target="_blank">关于我们</a>--%>
        <%--<a href="#" target="_blank">一起惠 · 好优搜</a>--%>
        <%--<a href="#" target="_blank">购物返利</a>--%>
        <%--<a href="index.html" target="_blank">商城</a>--%>
        <%--<a href="#" target="_blank">优质商品</a>--%>
        <%--<a href="#" target="_blank">比价网</a>--%>
        <%--<a href="#" target="_blank">广告招商</a>--%>

    <%--</div>--%>
    <div class="nyh_copyright">南昌大学计算机科学与技术162班郑梓熙 © 2019  </div>
</div><!--	  footer-->
</body>
</html>
