<%--
  Created by IntelliJ IDEA.
  User: zheng
  Date: 2019/8/21
  Time: 12:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body onload="initAJAX();">

<link href="../css/BMS_book.css" rel="stylesheet"/>

<script src="../js/commons.js"></script>
<script src="../js/jquery-1.4.2.min.js"></script>
<script src="../js/jquery-form.js"></script>

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
                <%--<td><a href="javascript:addbookinfo()" target="_self" id="operate" >添加</a></td>--%>
                <td><input type="submit" value="添加"></td>
            </tr>

        </table>
    </form>
</div><%--添加书籍--%>

<script language="JavaScript">
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
<div class="list_head" id="changebook_control_head">变更书籍信息</div>
<div style="height: 50px" id="changebook_control_hdiv"></div>
<div class="show_list" id="changebook_control_table">
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
<script src="../js/manager_bu.js"></script>
<a href="javascript:get_Bookinfo()" target="_self">asa</a>
<script language="JavaScript">
    function bccheck() {

    }
</script>


<%--下架书籍--%>
<div class="list_head" id="dnbook_control_head">下架书籍</div>
<div style="height: 50px" id="dnbook_control_hdiv"></div>
<div class="show_list" id="dnbook_control_table">
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
            <td class="th_isbn title_bg"> <a href="javascript:dnbookingo()" target="_self" id="operate" >下架</a></td>
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





<script language="JavaScript">
    function addbookinfo() {
        var da = $("#b_isbn").val();
        var ca = $("#b_category").val();

        if (da != "" && ca != "") {
            var getjson = {
                "img": $("#b_img").val(),
                "name": $("#b_name").val(),
                "author": $("#b_author").val(),
                "pub": $("#b_pub").val(),
                "num": $("#b_num").val(),
                "price": $("#b_price").val(),
                "isbn": $("#b_isbn").val(),
                "category": $("#b_category").val(),
                "desc": $("#b_desc").val(),
            };
            $.ajax({
                type: "POST",
                url: "/addbook",
                // contentType: "application/json", //如果提交的是json数据类型，则必须有此参数,表示提交的数据类型
                dataType: "json", //表示返回值类型，不必须
                // async:false,
                // data: JSON.stringify({ "InviteBidInfo":
                //         [{ 'BidProId': "1", 'BidProType': "2", 'BidProName': "3", 'ItemType': "4" }]
                // }),
                data: getjson,
                success: function (result) {
                    if (result == 1) {
                        alert("添加成功！");
                        document.getElementById("book_add_form").reset();
                    }
                    else if (result == 3) {
                        alert("该书已存在！");
                    }
                    else {
                        alert("请重试！");
                    }
                    // alert(result);
                },
                error: function (data) {
                    alert("请重新添加！");
                    // window.location.href="register.jsp";
                }
            });
        } else alert("请输入相关信息");
    }

</script>


</body>
</html>
