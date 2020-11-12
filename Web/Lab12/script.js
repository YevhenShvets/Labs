function z1(){
    var l = document.getElementById("l").value;
    var pk = l/8.81;
    var saka = (0.07929*l)/8.81;

    var answer = pk+"pk\n"+saka+"sak";
    document.getElementById('answer1').innerHTML = answer;
}

function z2(){
    if(window.confirm('Ви ввели число?')){
        let value = parseInt(document.getElementById("n").value);
        let str = "Increment: " + (value+1) + " Decrement: " + (value-1);
        document.getElementById('answer2').innerHTML = str;
    }
}