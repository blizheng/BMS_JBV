<%--
  Created by IntelliJ IDEA.
  User: zheng
  Date: 2019/8/21
  Time: 20:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<script src="../js/commons.js"></script>
<script src="../js/jquery-1.4.2.min.js"></script>

<script src="../js/jquery-form.js"></script>
<%--<script src="https://code.jquery.com/jquery-3.4.1.js"></script>--%>


<form action="/UploadServlet1" id="book_add_form" method="post" enctype="multipart/form-data" onsubmit="return ss()">
    <input type="file" name="b_img" id="b_img">
    <input type="text" name="aas" id="aas" placeholder="as">
    <input type="text" name="b_price" id="b_price" placeholder="点击输入" style="border: none">
    <%--<input type="button" value="submit" onclick="addbookinfo()">--%>
<input type="submit" value="sss">
</form>
<a href="javascript:ss()" target="_self">asd</a>
<script language="JavaScript">
    function ss() {
        // document.getElementById("book_add_form").action="/";
        // document.getElementById("book_add_form").submit();
        // jquery 表单提交
        $("#book_add_form").ajaxSubmit(function(message) {
// 对于表单提交成功后处理，message为提交页面saveReport.htm的返回内容
            alert(12);
        });
        alert(55);
        return false; // 必须返回false，否则表单会自己再做一次提交操作，并且页面跳转
    }
    function addbookinfo() {

            var getjson = {
                "fileoo": $("#fileoo").val(),
            };
            $.ajax({
                type: "POST",
                url: "/UploadServlet1",
                // contentType: "application/json", //如果提交的是json数据类型，则必须有此参数,表示提交的数据类型
                dataType: "json", //表示返回值类型，不必须
                // async:false,
                // data: JSON.stringify({ "InviteBidInfo":
                //         [{ 'BidProId': "1", 'BidProType': "2", 'BidProName': "3", 'ItemType': "4" }]
                // }),
                data: getjson,
                success: function (result) {

                    alert(result);
                },
                error: function (data) {
                    alert("请重新添加！");
                    // window.location.href="register.jsp";
                }
            });

    }
</script>

</body>
</html>
