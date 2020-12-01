function answer1(){
    var r = document.getElementById("value1").value;
    var radios = document.getElementsByName("r");
    var answer = 0;
    var rez = "";
    for(var i=0;i<radios.length;i++){
        if(radios[i].checked){
            if(radios[i].value == "L"){
                answer = 2*Math.PI*r;
                rez = "L = ";
            }else if(radios[i].value == "S"){
                answer = Math.PI* (r*r);
                rez = "S = ";
            }else{
                answer = (4/3)* Math.PI*(r*r*r);
                rez = "V = ";
            }
        }
    }
    document.getElementById("answer1").innerHTML = rez+ answer.toFixed(2);

}

function answer2(){
    var r = document.getElementById("value2").value;
    var h = document.getElementById("value2_2").value;
    var radios = document.getElementsByName("r1");
    var answer = 0;
    var rez = "";
    for(var i=0;i<radios.length;i++){
        if(radios[i].checked){
            if(radios[i].value == "Cone"){
                answer = (1/3)*Math.PI * (r*r)*h;
                rez = "V (cone) = ";
            }else{
                answer = Math.PI * (r*r)*h;
                rez = "V (cylinder) = ";
            }
        }
    }
    document.getElementById("answer2").innerHTML = rez+ answer.toFixed(2);

}