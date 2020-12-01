function window_click(){
    //alert("Hello");
}

function text_change(){
    alert('the text has been changed');
}

function on_focus(){
    var z1 = document.getElementById('z1').value;
    var z2 = document.getElementById('z2').value;
    var z3 = document.getElementById('z3').value;

    var s_z = (parseInt(z1) + parseInt(z2) + parseInt(z3))/3;
    alert("Answer = "+ s_z.toFixed(2))
}


var for_hour;
var hour;
function z3(){
    for_hour = parseFloat(prompt("Enter $/hour"));
    hour = parseInt(prompt("Enter hour"));
}
function z3_1(){
    var answer = for_hour* hour;
    alert("Answer = " + answer.toFixed(2));
}


function z4(){
    var value = document.getElementById("z4").value;
    alert("Answer = "+ Math.sqrt(value).toFixed(2));
}

function z5(){
    var dol = 29;
    var eur = 33;
    var uah = parseInt(document.getElementById("z5").value);
    var answer_dol = (uah/dol).toFixed(5);
    var answer_eur = (uah/eur).toFixed(5);
    document.getElementById("z5_ans").innerHTML = "Dol = "+ answer_dol+"<br>" + "Eur = "+ answer_eur;
}


class MyString{
    reverse(value){
        var array_value = value.split("");
        var reverse = array_value.reverse();
        var rezult = reverse.join("");
        return rezult;
    }

    ucFirst(value){
        var answer = value[0].toUpperCase();
        answer += value.slice(1,value.lenght);
        return answer;
    }

    ucWorlds(value){
        var array = value.split(" ");
        var answer = value.split(" ");
        var v;
        for (var i=0; i<array.length;i++){
            v = array[i];
            answer[i] = v[0].toUpperCase();
            answer[i]+=v.slice(1,v.lenght);
        }
        return answer.join(" ");
    }
}

function reverse_(){
    var value = document.getElementById("last_z").value;
    var cl = new MyString();
    alert(cl.reverse(value));
}
function ucfirst_(){
    var value = document.getElementById("last_z").value;
    var cl = new MyString();
    alert(cl.ucFirst(value));
}
function ucworlds_(){
    var value = document.getElementById("last_z").value;
    var cl = new MyString();
    alert(cl.ucWorlds(value));
}