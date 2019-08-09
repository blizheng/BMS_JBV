/*
* 获取用户信息*/

/*
function getUserInfo1() {
    xmlHttp.open("GET", "/User_byID", true);
    xmlHttp.onreadystatechange = function () {
        if (xmlHttp.readyState == 4) {
            var data = xmlHttp.responseText;
            var obj = JSON.parse(data);
            var tbody=document.getElementById("book_all")
            for (var i in obj) {
                var trow = getDataRow(obj[i]); //定义一个方法,返回tr数据
                tbody.appendChild(trow);
            }
        }
    }
    xmlHttp.send();
}*/

function getUserInfo(user_id) {
    xmlHttp.open("GET", "/User_byID?user_id=" + user_id, true);
    xmlHttp.onreadystatechange = function () {
        if (xmlHttp.readyState == 4) {

            var data = xmlHttp.responseText;
            var obj = JSON.parse(data);
            // var user_arr;
            for (var i in obj) {
                /*
                if(!obj[i].user_id)obj[i].user_id="";
                if(!obj[i].user_name)obj[i].user_name="";
                if(!obj[i].user_sex)obj[i].user_sex="";
                if(!obj[i].user_phone)obj[i].user_phone="";
                if(!obj[i].user_email)obj[i].user_email="";
                if(!obj[i].user_address)obj[i].user_address="";
                if(!obj[i].user_description)obj[i].user_description="";
                */
                if (obj.length == 1) {
                    // user_arr=[obj[0].user_id,obj[0].user_name,obj[0].user_sex,obj[0].user_phone,obj[0].user_email,
                    //     obj[0].user_address,obj[0].user_desc];
                    document.getElementById("user_id").innerHTML = obj[0].user_id;
                    document.getElementById("user_name").innerHTML = obj[0].user_name;
                    document.getElementById("user_sex").innerHTML = obj[0].user_sex;
                    document.getElementById("user_phone").innerHTML = obj[0].user_phone;
                    document.getElementById("user_email").innerHTML = obj[0].user_email;
                    document.getElementById("user_address").innerHTML = obj[0].user_address;
                    document.getElementById("user_desc").innerHTML = obj[0].user_description;
                }

            }
            getBorrowAll(user_id);
            // document.getElementById("user_info").innerHTML = str;
            // document.getElementById("user_id").innerHTML = "1212";
            // document.getElementById("user_name").innerHTML = "1212";
            // document.getElementById("user_sex").innerHTML = "1212";
            // document.getElementById("user_phone").innerHTML = "1212";
            // document.getElementById("user_email").innerHTML = "1212";
            // document.getElementById("user_address").innerHTML = "1212";
            // document.getElementById("user_desc").innerHTML = "54564";

            // document.getElementById("user_id").innerHTML = user_arr[0];
            // document.getElementById("user_name").innerHTML = user_arr[1];
            // document.getElementById("user_sex").innerHTML = user_arr[2];
            // document.getElementById("user_phone").innerHTML = user_arr[3];
            // document.getElementById("user_email").innerHTML = user_arr[4];
            // document.getElementById("user_address").innerHTML = user_arr[5];
            // document.getElementById("user_desc").innerHTML = user_arr[6];
        }
    }
    xmlHttp.send();
}