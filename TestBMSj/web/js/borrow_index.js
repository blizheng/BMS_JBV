/*获取所有书籍信息*/
function getBorrowAll(id) {
    xmlHttp.open("GET", "/BorrowView?user_id=" + id, true);
    xmlHttp.onreadystatechange = function () {
        if (xmlHttp.readyState == 4) {
            var data = xmlHttp.responseText;
            var obj = JSON.parse(data);
            var tbody = document.getElementById("get_bookborrow");
            for (var i in obj) {
                var trow = getborrowbookDataRow(obj[i]); //定义一个方法,返回tr数据
                tbody.appendChild(trow);
            }
        }
    }
    xmlHttp.send();
}

/*将书籍信息加入表格中*/
function getborrowbookDataRow(borrowbook) {
    var row = document.createElement('tr'); //创建行

    var imgCell = document.createElement('td'); //图片
    if (!borrowbook.book_image) borrowbook.book_image = "";
    if (!borrowbook.book_name) borrowbook.book_name = "";
    imgCell.innerHTML = '<img src="' + borrowbook.book_image + '" class="list_img" id="book_img">\n' +
        '                <div id="book_name" calss="td_span">' + borrowbook.book_name +
        '                </div>'; //填充数据
    row.appendChild(imgCell); //加入行

    var authorCell = document.createElement('td'); //作者
    if (!borrowbook.book_author) borrowbook.book_author = "";
    authorCell.innerHTML = borrowbook.book_author; //填充数据
    row.appendChild(authorCell); //加入行

    var pubCell = document.createElement('td'); //出版社
    if (!borrowbook.book_pub) borrowbook.book_pub = "";
    pubCell.innerHTML = borrowbook.book_pub; //填充数据
    row.appendChild(pubCell); //加入行

    var priceCell = document.createElement('td'); //价格
    if (!borrowbook.book_price) borrowbook.book_price = "";
    priceCell.innerHTML = borrowbook.book_price.toFixed(2); //填充数据
    row.appendChild(priceCell); //加入行

    var isbnCell = document.createElement('td'); //isbn
    if (!borrowbook.isbn) borrowbook.isbn = "";
    isbnCell.innerHTML = borrowbook.isbn; //填充数据
    row.appendChild(isbnCell); //加入行

    var categoryCell = document.createElement('td'); //书籍分类
    if (!borrowbook.category_name) borrowbook.category_name = "";
    categoryCell.innerHTML = borrowbook.category_name; //填充数据
    row.appendChild(categoryCell); //加入行

    var descCell = document.createElement('td'); //书籍相关简介
    if (!borrowbook.book_description) borrowbook.book_description = "";
    // descCell.onmousemove=function(){getbookdesc(book.book_description)};//详细简介
    descCell.innerHTML = borrowbook.book_description.substring(0, 18) + "......"; //填充数据
    row.appendChild(descCell); //加入行

    var borrowtimeCell = document.createElement('td'); //借书时间
    if (!borrowbook.borrow_time) borrowbook.borrow_time = "";
    borrowtimeCell.innerHTML = borrowbook.borrow_time; //填充数据
    row.appendChild(borrowtimeCell); //加入行

    var returntimeCell = document.createElement('td'); //还书时间

    returntimeCell.innerHTML = getreturntime(borrowbook.borrow_time);
    row.appendChild(returntimeCell); //加入行

    var opeCell = document.createElement('td'); //操作模块
    opeCell.innerHTML = '  <a href="javascript:returnbook_byid(' + borrowbook.book_id + ',' + borrowbook.user_id + ')" target="_self" id="operate">还书</a>' +
        ' /  <a href="javascript:goonborrow_byid(' + borrowbook.book_id + ',' + borrowbook.user_id + ')" target="_self" id="operate">续借</a>  '; //填充数据
    row.appendChild(opeCell); //加入行

    return row; //返回tr数据
}

/*得到应还日期*/
function getreturntime(time) {
    var getmounth = Number(time.substring(4, 6));//得到月份
    var returntime = "";
    if (getmounth <= 7) {
        var temp = Number(time.substring(0, 4));
        getmounth = "0" + (getmounth + 2);
        returntime = temp + getmounth + time.substring(6);
    }
    else if (getmounth <= 10)
        returntime = time.substring(0, 4) + (getmounth + 2) + time.substring(6);
    else {
        var temp = Number(time.substring(0, 4)) + 1;
        getmounth = "0" + (getmounth - 10);
        returntime = temp + getmounth + time.substring(6);
    }
    return returntime;
}

/*借书函数*/
function getupdateinfo(bookID, userID) {
    var now = new Date();
    var year = now.getFullYear(); //得到年份
    var month = now.getMonth();//得到月份
    var date = now.getDate();//得到日期
    var hour = now.getHours();//得到小时
    var minu = now.getMinutes();//得到分钟
    month = month + 1;
    if (month < 10) month = "0" + month;
    if (date < 10) date = "0" + date;
    if (hour < 10) hour = "0" + hour;
    if (minu < 10) minu = "0" + minu;
    var timenow = year + month + date + hour + minu;
    // alert(timenow);
    // alert(bookID + "-" + userID);
    var arr = {
        'book_id': bookID,
        'user_id': userID,
        'time': timenow
    };
    var arr1 = [bookID, userID, timenow];
    return arr1;
}

/*还书调用函数*/
function returnbook_byid(bookID, userID) {
    xmlHttp.open("GET", "/ReturnBook?returnarr=" + getupdateinfo(bookID, userID), true);
    xmlHttp.onreadystatechange = function () {
        if (xmlhttp.readyState == 4) {// 4 = "loaded"
            if (xmlhttp.status == 200) {// 200 = OK
                // ...our code here...
            }
            else {
                alert("Problem retrieving XML data");
            }
        }
    }
    xmlHttp.send();
}


/*续借函数*/
function goonborrow_byid(bookID, userID) {
    xmlHttp.open("GET", "/GoonBorrow?goonarr=" + getupdateinfo(bookID, userID), true);
    xmlHttp.onreadystatechange = function () {
        if (xmlhttp.readyState == 4) {// 4 = "loaded"
            if (xmlhttp.status == 200) {// 200 = OK
                // ...our code here...
            }
            else {
                alert("Problem retrieving XML data");
            }
        }
    }
    xmlHttp.send();

}

function showss(num1, num2) {
    alert(num1);
    alert(num2);
}


/*借书传值测试*/
function testajax(bookID, userID) {
    // xmlHttp.open("GET", "/BorrowBook?borrowarr=" + bookID+"--"+userID, true);
    xmlHttp.open("GET", "/BorrowBook?borrowarr=" + getupdateinfo(bookID, userID), true);
    xmlHttp.onreadystatechange = function () {
        if (xmlhttp.readyState == 4) {// 4 = "loaded"
            if (xmlhttp.status == 200) {// 200 = OK
                // ...our code here...
            }
            else {
                alert("Problem retrieving XML data");
            }
        }
    }
    xmlHttp.send();
}

/*测试*/
function cv(bookID, userID) {
    $.ajax({
        type: "POST",//POST方法
        url: "BorrowBook",//Servlet中对应的url-pattern
        data: borrowbook_byid(bookID, userID),//上面定义的json数据
        dataType: "json",//后台返回的数据格式类型
        success: function (msg) {
            console.log(msg);//控制台输入后台返回的数据信息
        },
        error: function () {
            //如果后台无法返回数据到前台，则输出前台想要传到到后台的信息和Error标识
            console.info(JSON.stringify(user) + "\nError");
        }
    });
}

/*
* 获取用户信息*/
/*
function getUserInfo(user_id) {
    xmlHttp.open("GET", "/User_byID?user_id=" + user_id, true);
    xmlHttp.onreadystatechange = function () {
        if (xmlHttp.readyState == 4) {
            var data = xmlHttp.responseText;
            var obj = JSON.parse(data);
            var str = "";
            for (var i in obj) {
                str += obj[i].user_name;
                str += obj[i].user_passwd;
            }
            document.getElementById("user_info").innerHTML = str;
        }
    }
    xmlHttp.send();
}
*/

/*传值示例*/
/*
function loadXMLDoc()
{

    var xmlhttp=null;
    if (window.XMLHttpRequest)
    {// code for all new browsers
        xmlhttp=new XMLHttpRequest();
    }
    else if (window.ActiveXObject)
    {// code for IE5 and IE6
        xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
    }
    if (xmlhttp!=null)
    {
        xmlhttp.onreadystatechange=state_Change(xmlhttp);
        xmlhttp.open("GET","/BorrowBook?username="+123,true);
        xmlhttp.send(null);
    }
    else
    {
        alert("Your browser does not support XMLHTTP.");
    }
}
function state_Change(xmlhttp)
{
    if (xmlhttp.readyState==4)
    {// 4 = "loaded"
        if (xmlhttp.status==200)
        {// 200 = OK
            // ...our code here...
        }
        else
        {
            alert("Problem retrieving XML data");
        }
    }
}
*/