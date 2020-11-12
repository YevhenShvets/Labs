var a = prompt("a = ");

if(a === '1'){
    alert("Вірно");
}else{
    alert("Невірно");
}

var sum = 0;
var value = 1;
while(value <= 100){
    sum = sum + value;
    value= value+1;
}
alert("Сума від 1 до 100 = "+sum);