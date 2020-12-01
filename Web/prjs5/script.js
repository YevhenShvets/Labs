function draw(){
    var canvas = document.getElementById('canva');
    var ctx = canvas.getContext('2d');
 
    for(var i=0;i<1000;i+=100){
        ctx.beginPath();
        ctx.arc(i, i, 10, 0, 2 * Math.PI);

        var rand = getRandomInt(colors.length);
        ctx.fillStyle = colors[rand];
        ctx.fill();
    }
}

function getRandomInt(max) {
    return Math.floor(Math.random() * Math.floor(max));
  }

var colors = [
    'green',
    'orange',
    'blue',
    'yellow'
]