var users = [];
var ind = 0;


class User{
    constructor(surname, year){
        this.surname = surname;
        this.year = year;
    }

    getExp(){
        var today = new Date(Date.now()).getFullYear();
        var answer = today - parseInt(this.year);
        return answer;
    }
}

function add_(){
    var surname = document.getElementById("surname");
    var year = document.getElementById("year");
    var u = new User(surname.value, year.value);
    users.push(u);
    ind+=1;
    surname.value = "";
    year.value = "";
}


function show_(){
    var l = [];
    var d = [];
    users.forEach(function(val){
        l.push(val.surname);
        d.push(val.getExp());
    });
    var ctx = document.getElementById('myChart');
        var myChart = new Chart(ctx, {
            type: 'line',
            data: {
                labels: l,
                datasets: [{
                    label: 'Experience',
                    data: d,
                    backgroundColor: [
                        'rgba(255, 159, 64, 0.5)'
                    ],
                    borderColor: [
                        'rgba(54, 162, 235, 1)',
                    ],
                    borderWidth: 1
                }]
            },
            options: {
                tooltips: {
                    mode: 'index'
                },
                responsive: true,
            maintainAspectRatio: false,
                scales: {
                    yAxes: [{
                        ticks: {
                            beginAtZero: true
                        }
                    }]
                }
            }
        });
}