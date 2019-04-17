//时间
function fn(){
    var time = new Date();
    var str= "";
    var div = document.getElementById("time");
    var year = time.getFullYear();
    var mon = time.getMonth()+1;
    var day = time.getDate();
    var h = time.getHours();
    var m = time.getMinutes();
    var s = time.getSeconds();
    var week = time.getDay();
    switch (week){
        case 0:week="日";
            break;
        case 1:week="一";
            break;
        case 2:week="二";
            break;
        case 3:week="三";
            break;
        case 4:week="四";
            break;
        case 5:week="五";
            break;
        case 6:week="六";
            break;
    }
    str = year +"年"+totwo(mon)+"月"+totwo(day)+"日"+"&nbsp;"+totwo(h)+":"+totwo(m)+":"+totwo(s)+"&nbsp;"+"星期"+week;
    div.innerHTML = str;
}
fn();
setInterval(fn,1000);


