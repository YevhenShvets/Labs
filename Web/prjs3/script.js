var currentImgNumber = 1;
var numberOFImages = 10;

function window_load(){
        setTimeout("switchImage()", 1000);
}

function switchImage(){
    currentImgNumber++;
    document.img.src = "https://picsum.photos/200/300?random=" + currentImgNumber;
    if (currentImgNumber < numberOFImages) {
        setTimeout("switchImage()",1000);
    }
}


function showInput(){
    var date  = new Date(document.getElementById("dateV").value);
    var day = "";
    switch(date.getDay()){
        case 0: day = "Неділя"; break;
        case 1: day = "Понеділок"; break;
        case 2: day = "Вівторок"; break;
        case 3: day = "Середа"; break;
        case 4: day = "Четвер"; break;
        case 5: day = "П'ятниця"; break;
        case 6: day = "Субота"; break;
    }
    alert(day);
}