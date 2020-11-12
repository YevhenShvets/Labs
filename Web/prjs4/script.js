function fun1(){
    var str = document.getElementById("text").innerHTML;
    var regx = /Lorem\b/g;
    var answer = str.replace(new RegExp(regx), "*First word*");
    document.getElementById("text").innerHTML = answer;
}