/*获取所有书籍信息*/
function getBookAll(userid) {
    xmlHttp.open("GET", "/BookView", true);
    xmlHttp.onreadystatechange = function () {
        if (xmlHttp.readyState == 4) {
            var data = xmlHttp.responseText;
            var obj = JSON.parse(data);
            var tbody = document.getElementById("book_all")
            for (var i in obj) {
                var trow = getDataRow(obj[i], userid); //定义一个方法,返回tr数据
                tbody.appendChild(trow);
            }
        }
    }
    xmlHttp.send();
}

/*将书籍信息加入表格中*/
function getDataRow(book, userid) {

    var row = document.createElement('tr'); //创建行

    var imgCell = document.createElement('td'); //图片
    if (book.book_image==null) book.book_image = "";
    if (book.book_name==null) book.book_name = "";
    imgCell.innerHTML = '<img src="' + book.book_image + '" class="list_img" id="book_img">\n' +
        '                <div id="book_name" calss="td_span">' + book.book_name +
        '                </div>'; //填充数据
    row.appendChild(imgCell); //加入行

    var authorCell = document.createElement('td'); //作者
    if (book.book_author==null) book.book_author = "";
    authorCell.innerHTML = book.book_author; //填充数据
    row.appendChild(authorCell); //加入行

    var pubCell = document.createElement('td'); //出版社
    if (book.book_pub==null) book.book_pub = "";
    pubCell.innerHTML = book.book_pub; //填充数据
    row.appendChild(pubCell); //加入行

    var numCell = document.createElement('td'); //馆藏数量
    if (book.book_num==null) book.book_num = "0";
    numCell.innerHTML = book.book_num; //填充数据
    row.appendChild(numCell); //加入行

    var priceCell = document.createElement('td'); //价格
    if (book.book_price==null) book.book_price = "";
    priceCell.innerHTML = book.book_price.toFixed(2)+"¥"; //填充数据
    row.appendChild(priceCell); //加入行

    var isbnCell = document.createElement('td'); //isbn
    if (book.isbn==null) book.isbn = "";
    isbnCell.innerHTML = book.isbn; //填充数据
    row.appendChild(isbnCell); //加入行

    var categoryCell = document.createElement('td'); //书籍分类
    if (book.category_name==null) book.category_name = "";
    categoryCell.innerHTML = book.category_name; //填充数据
    row.appendChild(categoryCell); //加入行

    var descCell = document.createElement('td'); //书籍相关简介
    // descCell.onmousemove=function(){getbookdesc(book.book_description)};//详细简介
    if (book.book_description==null) book.book_description = "";
    descCell.innerHTML = book.book_description.substring(0, 18) + "......"; //填充数据
    row.appendChild(descCell); //加入行


    var opeCell = document.createElement('td'); //操作模块
    opeCell.innerHTML = '<a href="javascript:borrowbook_byid(' + book.book_id + ',' + book.book_num + ',' + userid + ')" target="_self" id="operate">借书</a>'; //填充数据
    row.appendChild(opeCell); //加入行

    return row; //返回tr数据
}

/*借书函数
* */

function borrowbook_byid(bookid, booknum, userid) {
    if (booknum == 0) alert("已借完！");
    else {
        borrowbookfunc(bookid, userid);
    }
}

function borrowbookfunc(bookid, userid) {

    var arr = getborrowbyuser(bookid, userid);
    xmlHttp.open("GET", "/BorrowBook?borrowarr=" + arr, true);

    xmlHttp.onreadystatechange = function () {

        if (xmlHttp.readyState == 4) {
            var data=xmlHttp.responseText;
            if(data==0)
                alert("借阅失败！");
            else if(data==1)
                alert("借书成功！");
            else if(data==2)
                alert("您已借阅！");
            else alert("系统错误！");
        }

    }

    xmlHttp.send();

}

/*获取借书相关信息--传入后台，用户借书*/
function getborrowbyuser(bookID, userID) {
    var borrowarr = getupdateinfo(bookID, userID);
    return borrowarr;

}


/*获取书籍简介*/
function getbookdesc(bookdesc) {
    alert(bookdesc);
}


