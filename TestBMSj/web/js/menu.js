function borrow_page(user_id,passwd) {

}
function menu_changeuserinfo() {
    window.open("user_info.jsp","_blank");
}
function menu_Bookallpage() {
    window.open("book.jsp","_blank");
}
function menu_loginout() {

}

function showBook() {
    document.getElementById("book_all").innerHTML="";
    var info=getCookie_info();
    getBookAll(info.user_id);
    document.getElementById("borrow_control_head").style.visibility="hidden";
    document.getElementById("borrow_control_head").style.display="none";
    document.getElementById("borrow_control_hdiv").style.visibility="hidden";
    document.getElementById("borrow_control_hdiv").style.display="none";
    document.getElementById("borrow_control_table").style.visibility="hidden";
    document.getElementById("borrow_control_table").style.display="none";

    document.getElementById("book_control_head").style.visibility="visible";
    document.getElementById("book_control_head").style.display="";
    document.getElementById("book_control_hdiv").style.visibility="visible";
    document.getElementById("book_control_hdiv").style.display="";
    document.getElementById("book_control_table").style.visibility="visible";
    document.getElementById("book_control_table").style.display="";

}

function showBorrow() {
    document.getElementById("get_bookborrow").innerHTML="";
    var infoarr=getCookie_info();
    getBorrowAll(infoarr.user_id);

    document.getElementById("borrow_control_head").style.visibility="visible";
    document.getElementById("borrow_control_head").style.display="";
    document.getElementById("borrow_control_hdiv").style.visibility="visible";
    document.getElementById("borrow_control_hdiv").style.display="";
    document.getElementById("borrow_control_table").style.visibility="visible";
    document.getElementById("borrow_control_table").style.display="";

    document.getElementById("book_control_head").style.visibility="hidden";
    document.getElementById("book_control_head").style.display="none";
    document.getElementById("book_control_hdiv").style.visibility="hidden";
    document.getElementById("book_control_hdiv").style.display="none";
    document.getElementById("book_control_table").style.visibility="hidden";
    document.getElementById("book_control_table").style.display="none";
}