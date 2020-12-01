var test = [
    {
        question: "Рік незалежності України?",
        answers: ['1991','1996','2000', '1990']
    },
    {
        question: "В якому році прийняли Конституцію України?",
        answers: ['1996','2001','1991', '1992']
    },
    {
        question: "Як прізвище першого презедента незалежної України?",
        answers: ['Кравчук','Зеленський','Кучма', 'Порошенко']
    },
    {
        question: "Який по рахунку зараз презедент?",
        answers: ['6','4','3','7']
    },
    {
        question: "Який презедент украв все?",
        answers: ['Янукович','Янукевич','Якубович','Ябкевич']
    },
    {
        question: "Презедент, який обісрався?",
        answers: ['Всі','Янукович','Зеленський','Порошенко']
    }
]


function show_test(){
    var father = document.getElementById("test");
    for(var i=0;i<test.length;i++){
        var q = test[i].question;
        var answers = test[i].answers.slice(0, test[i].answers.length);
        console.log(answers);

        var div = document.createElement("div");
        div.setAttribute("class", "question");
        div.setAttribute("id", "question"+i);
        div.appendChild(document.createTextNode(q));
        div.appendChild(document.createElement("br"));
        while(answers.length!=0){
            var random_val = getRandomInt(answers.length);
            console.log(random_val);
            var radio = document.createElement('input');
            radio.setAttribute("type","radio");
            radio.setAttribute("name", "radio"+i);
            radio.setAttribute("value", answers[random_val]);
            div.appendChild(radio);
            div.appendChild(document.createTextNode(answers[random_val]));
            div.appendChild(document.createElement("br"));
            answers.splice(random_val, 1);
        }
        father.appendChild(div);
    }
    var button = document.createElement('input');
    button.setAttribute("type", "button");
    button.setAttribute("value", "Result");
    button.setAttribute("onclick",`getAnswer();`);
    father.appendChild(button);
}

function getAnswer(){
    var rez = 0;
    for(var i=0;i<test.length;i++){
        var test_answer = document.getElementsByName("radio"+i);
        for(var j=0;j<test_answer.length;j++){
            if(test_answer[j].checked){
                console.log(test_answer[j].value);
                console.log(test[i]);
                if(test_answer[j].value === test[i].answers[0]){
                    rez+=1;
                    document.getElementById("question"+i).setAttribute("style", "background-color: green;");
                }else{
                    document.getElementById("question"+i).setAttribute("style", "background-color: red;");
                }
            }
        }
    }
    document.getElementById("answer").innerHTML = "Your result = "+ rez;
}


function getRandomInt(max) {
    return Math.floor(Math.random() * Math.floor(max));
  }  