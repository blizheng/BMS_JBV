

function get_Bookinfo() {
    document.getElementById("bookinfo_all").innerHTML="";
    xmlHttp.open("GET", "/Book", true);
    xmlHttp.onreadystatechange = function () {
        if (xmlHttp.readyState == 4) {
            var data = xmlHttp.responseText;
            var obj = JSON.parse(data);
            var tbody = document.getElementById("bookinfo_all");
            for (var i in obj) {
                var trow = getbookDataRow(obj[i]);
                tbody.appendChild(trow);
            }
        }
    }
    xmlHttp.send();
}

function getbookDataRow(book) {
    var row = document.createElement('tr'); //创建行

    var imgCell = document.createElement('td'); //图片
    if (!book.book_image) book.book_image = "";
    if (!book.book_name) book.book_name = "";
    imgCell.innerHTML = '<img src="'+book.book_image+'" class="list_img" id="bc_img_'+book.book_id+'">' +
        '<input type="text" name="bc_name" id="bc_name_'+book.book_id+'"  style="border: none" value="'+book.book_name+'">';
    row.appendChild(imgCell);

    var authorCell = document.createElement('td'); //作者
    if (!book.book_author) book.book_author = "";
    authorCell.innerHTML = '<input type="text" name="bc_author" id="bc_author_'+book.book_id+'" style="border: none" value="'+book.book_author+'">';
    row.appendChild(authorCell);

    var pubCell = document.createElement('td'); //出版社
    if (!book.book_pub) book.book_pub = "";
    pubCell.innerHTML = '<input type="text" name="bc_pub" id="bc_pub_'+book.book_id+'" style="border: none" value="'+book.book_pub+'">';
    row.appendChild(pubCell); //加入行

    var numCell = document.createElement('td'); //数量
    if (!book.book_num&&book.book_num!=0) book.book_num = "";
    numCell.innerHTML ='<input type="text" name="bc_num" id="bc_num_'+book.book_id+'" style="border: none" value="'+book.book_num+'">';
    row.appendChild(numCell);

    var priceCell = document.createElement('td'); //价格
    if (!book.book_price) book.book_price = "";
    // var priceval=book.book_price.toFixed(2)+"¥";
    var priceval=book.book_price.toFixed(2);
    priceCell.innerHTML ='<input type="text" name="bc_price" id="bc_price_'+book.book_id+'" style="border: none" value="'+priceval+'">';
    row.appendChild(priceCell);

    var isbnCell = document.createElement('td'); //isbn
    if (!book.isbn) book.isbn = "";
    // isbnCell.innerHTML ='<input type="text" name="bc_isbn" id="bc_isbn_'+book.book_id+'" style="border: none" value="'+book.isbn+'">';
    isbnCell.innerHTML ='<span id="bc_isbn_'+book.book_id+'">'+book.isbn+'</span>';
    row.appendChild(isbnCell);

    var categoryCell = document.createElement('td'); //书籍分类
    if (!book.category_id) book.category_id = "";
    categoryCell.innerHTML = '<input type="text" name="bc_category" id="bc_category_'+book.book_id+'" style="border: none" value="'+book.category_id+'">';
    row.appendChild(categoryCell);

    var descCell = document.createElement('td'); //书籍相关简介
    if (!book.book_description) book.book_description = "";
    // descCell.onmousemove=function(){getbookdesc(book.book_description)};//详细简介
    descCell.innerHTML = '<textarea name="bc_desc" id="bc_desc_'+book.book_id+'" style="height: 30px;border: none">'+book.book_description+'</textarea>';
    row.appendChild(descCell);


    var opeCell = document.createElement('td'); //操作模块
    opeCell.innerHTML = '  <a href="javascript:update_bookinfo(' + book.book_id  + ')" target="_self" id="operate_'+book.book_id+'">更新</a>';
    row.appendChild(opeCell);

    return row; //返回tr数据

}

function update_bookinfo(bookid) {

    // var img="bc_img_"+bookid;
    var name="bc_name_"+bookid;
    var author="bc_author_"+bookid;
    var pub="bc_pub_"+bookid;
    var num="bc_num_"+bookid;
    var price="bc_price_"+bookid;
    var isbn="bc_isbn_"+bookid;
    var category="bc_category_"+bookid;
    var desc="bc_desc_"+bookid;

    // alert($("#"+name).val());
    // alert($("#"+author).val());
    // alert($("#"+pub).val());
    // alert($("#"+num).val());
    // alert($("#"+price).val());
    // alert(document.getElementById(isbn).innerHTML);
    // alert(document.getElementById(isbn).innerText);
    // alert($("#"+category).val());
    // alert($("#"+desc).val());

    var getjson = {
        "img":"",
        "name": $("#"+name).val(),
        "author":$("#"+author).val(),
        "pub": $("#"+pub).val(),
        "num": $("#"+num).val(),
        "price": $("#"+price).val(),
        "isbn": document.getElementById(isbn).innerHTML,
        "category": $("#"+category).val(),
        "desc": $("#"+desc).val(),
    };
    $.ajax({
        type: "POST",
        url: "/updatebookinfo",
        dataType: "json", //表示返回值类型，不必须
        data: getjson,
        success: function (result) {
            if (result==1)
                alert("更新信息成功！");
            else alert("信息有误！");
            // alert(result);
        },
        error: function (data) {
            alert("请重试！");
        }
    });

}