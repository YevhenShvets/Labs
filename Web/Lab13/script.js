function load(){
    var username = prompt("Enter your name");
    document.getElementById("name").innerHTML = username;

    z1();
    z3();
}


function z1(){
    var date = new Date(Date.now());

    var month = getMonth(date.getMonth());
    document.getElementById("mounth").innerHTML = month.toString();
    
    var end_date = new Date(2021,06,20);
    var count_to_end = new Date(end_date - date).getMonth();    
    document.getElementById("count").innerHTML = count_to_end + " місяців до диплома";
}


function getMonth(val){
    var month = "";
    switch(val){
        case 0: month = "Січень"; break;
        case 1: month = "Лютий"; break;
        case 2: month = "Березень"; break;
        case 3: month = "Квітень"; break;
        case 4: month = "Травень"; break;
        case 5: month = "Червень"; break;
        case 6: month = "Липень"; break;
        case 7: month = "Серпень"; break;
        case 8: month = "Вересень"; break;
        case 9: month = "Жовтень"; break;
        case 10: month = "Листопад"; break;
        case 11: month = "Грудень"; break;
    }
    return month;
}

function getRandomInt(max) {
    return Math.floor(Math.random() * Math.floor(max));
}

function random_game(obj){
    var val = obj.val.value;
    var answer = "";
    switch(parseInt(val)){
        case getRandomInt(10): answer = "Winner"; break;
        case getRandomInt(10): answer = "Winner"; break;
        case getRandomInt(10): answer = "Winner"; break;
        case getRandomInt(10): answer = "Winner"; break;
        case getRandomInt(10): answer = "Winner"; break;
        case getRandomInt(10): answer = "Winner"; break;
        case getRandomInt(10): answer = "Winner"; break;
        case getRandomInt(10): answer = "Winner"; break;
        case getRandomInt(10): answer = "Winner"; break;
        case getRandomInt(10): answer = "Winner"; break;
        default: answer = "Loser";
    }
    document.getElementById('ans').innerHTML = answer;
}

function z3(){
    let max = 10;
    for(i =0;i<max;i++){
        document.getElementById('z3').innerHTML+= Math.random().toString(36).substring(2,56)+ "<br>";
    }
}

