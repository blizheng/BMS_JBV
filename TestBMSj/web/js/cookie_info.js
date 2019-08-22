
function getCookie_info() {
    // var strCookie = document.cookie;
    // var arrCookie = strCookie.split(";");
    var user_id="";
    // var user_passwd="";
    var servletstop="";
    var manager_ID="";
    var manager_privilege="";
    if(getCookie("user_ID")!=null)
        user_id=getCookie("user_ID");
    // if(getCookie("user_Passwd")!=null)
    //     user_passwd=getCookie("user_Passwd");
    if(getCookie("servletstop")!=null)
        servletstop=getCookie("servletstop");
    if(getCookie("manager_ID")!=null)
        manager_ID=getCookie("manager_ID");
    if(getCookie("manager_privilege")!=null)
        manager_privilege=getCookie("manager_privilege");
    // for(var i = 0; i < arrCookie.length; i++){
    //     if(arrCookie[i].split("=")[0]=="user_ID")
    //         user_id=arrCookie[i].split("=")[1];
    //     else if(arrCookie[i].split("=")[0]=="user_Passwd")
    //         user_passwd=arrCookie[i].split("=")[1];
    //     else if(arrCookie[i].split("=")[0]=="servletstop")
    //         servletstop=arrCookie[i].split("=")[1];
    // }
    return {user_id,servletstop,manager_ID,manager_privilege};
}
function testcookie() {
    var cookies=document.cookie.split(";");
    var cookname="2";
for(var i=0;i<cookies.length;i++){
    if(cookies[i].split("=")[0]=="user_Passwd") {
        cookname = cookies[i].split("=")[1];
        alert(cookies[i].split("=")[1]);
        alert(cookname);
    }
    }
    alert(getCookie("user_Passwd"));



}

//写cookies

function setCookie(name,value)
{
    var Days = 30;
    var exp = new Date();
    exp.setTime(exp.getTime() + Days*24*60*60*1000);
    document.cookie = name + "="+ escape (value) + ";expires=" + exp.toGMTString();
}

//读取cookies
function getCookie(name)
{
    var arr,reg=new RegExp("(^| )"+name+"=([^;]*)(;|$)");

    if(arr=document.cookie.match(reg))

        return unescape(arr[2]);
    else
        return null;
}

//删除cookies
function delCookie(name)
{
    var exp = new Date();
    exp.setTime(exp.getTime() - 1);
    var cval=getCookie(name);
    if(cval!=null)
        document.cookie= name + "="+cval+";expires="+exp.toGMTString();
}
//使用示例
//setCookie("name","hayden");
//alert(getCookie("name"));

//程序代码
function setCookie2(name,value,time)
{
    var strsec = getsec(time);
    var exp = new Date();
    exp.setTime(exp.getTime() + strsec*1);
    document.cookie = name + "="+ escape (value) + ";expires=" + exp.toGMTString();
}
function getsec(str)
{
    alert(str);
    var str1=str.substring(1,str.length)*1;
    var str2=str.substring(0,1);
    if (str2=="s")
    {
        return str1*1000;
    }
    else if (str2=="h")
    {
        return str1*60*60*1000;
    }
    else if (str2=="d")
    {
        return str1*24*60*60*1000;
    }
}

//这是有设定过期时间的使用示例：
//s20是代表20秒
//h是指小时，如12小时则是：h12
//d是天数，30天则：d30

//setCookie("name","hayden","s20");