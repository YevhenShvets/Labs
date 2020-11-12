Math.func28 = function(x,y,z) {
    var rez = undefined;
    if( x*y !== 0){
        rez = 2*x+y - (z/(x*y));
    }

    return rez;
}

function click1(){
    var x = parseFloat(prompt("Enter x"));
    var y = parseFloat(prompt("Enter y"));
    var z = parseFloat(prompt("Enter z"));

    var rez = Math.func28(x,y,z);

    alert("Answer = "+ rez);
}