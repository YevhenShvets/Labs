function load_(){
    var checks = ["Новини", "Гості", "Нагороди", "Освіта",  "Дозвілля", "Розваги", "Кар'єра"];
    create_checks("checks", checks, "checkbox");

    var checks2 = ["Українська", "Англійська", "Німецька", "Румунська", "Польська"];
    create_checks("checks2", checks2, "checkbox2");
}

function create_checks(name_father, array, id){
    var checks = array;
    var father = document.getElementById(name_father);
    var index = 0;
    checks.forEach(element =>
        {
            var div = document.createElement("div");
            div.setAttribute("class", "checkbox");
            div.setAttribute("onclick", `checkval("${id+index.toString()}")`);
            
            var checkbox = document.createElement("input");
            checkbox.setAttribute("type", "checkbox");
            checkbox.setAttribute("id", id + index);
            checkbox.setAttribute("value", element);
            checkbox.setAttribute("name", id + "_name");
            checkbox.setAttribute("onclick", `checkval("${id+index.toString()}")`);

            var text = document.createElement("span");
            text.innerHTML = element;
            div.appendChild(checkbox);
            div.appendChild(text);


            father.appendChild(div);
            index+=1;
        });
}

function checkval(id){
    document.getElementById(id).checked = !document.getElementById(id).checked;
}

var student_id = 0;
function add_to_textarea(){
    var checks = document.getElementsByName("checkbox_name");

    var str = "Студент " + student_id + "  ";

    for(var i=0;i<checks.length;i++){
        if(checks[i].checked){
            str+="+"+ checks[i].value+" ";
        }else{
            str+="-"+ checks[i].value+" ";
        }
    }
    document.getElementById("textarea").value+=str+"\n";
    student_id+=1;
}


function add_2(){
    var array = [
        {l: "Українська",
         b: 100},
        {l: "Англійська",
         b: 50},
        {l: "Німецька",
         b: 80},
        {l: "Румунська",
         b: 1000},
        {l: "Польська",
         b: 500},
    ]
    var name = document.getElementById("name").value;
    var checks = document.getElementsByName("checkbox2_name");
    var bal = 0;
    for(var i=0;i<checks.length;i++){
        if(checks[i].checked){
            for(var j=0;j<array.length;j++){
                if(checks[i].value == array[j].l){
                    bal+=array[j].b;
                }
            }
        }
    }
    document.getElementById("textarea2").innerHTML+=name +"   "+ bal +"<br>";
    document.getElementById("name").value = "";
}


function change_course(){

    var price_list = [
        {
            course: "Інформатика",
            price: ['250', '500', '1000']
        },
        {
            course: "Бази даних",
            price: ['400', '800', '1600']
        },
        {
            course: "Ресурси Інтернет",
            price: ['300', '600', '1200']
        },
        {
            course: "Аналіз алгоритмів",
            price: ['600', '1200', '2400']
        },
    ];
    var price = '';
    var course_name = document.getElementById("course_name-id");
    var course_time = document.getElementById("course_time-id");
    var course_lan = document.getElementById("course_lan-id");
    var course_zv = document.getElementById("course_zv-id");
    

    document.getElementsByName('course_lan')[0].options[0].disabled = false;
    document.getElementsByName('course_lan')[0].options[1].disabled = false;
    document.getElementsByName('course_zv')[0].options[0].disabled = false;
    document.getElementsByName('course_zv')[0].options[1].disabled = false;

    if(course_time.value == "36"){
        document.getElementsByName('course_lan')[0].options[1].disabled = true;
        document.getElementsByName('course_lan')[0].value =  document.getElementsByName('course_lan')[0].options[0].value;
    }else{
        document.getElementsByName('course_lan')[0].options[0].disabled = true;
        document.getElementsByName('course_lan')[0].value =  document.getElementsByName('course_lan')[0].options[1].value;
    }

    if(course_lan.value == "Англійська"){
        document.getElementsByName('course_zv')[0].options[0].disabled = true;
        document.getElementsByName('course_zv')[0].value =  document.getElementsByName('course_zv')[0].options[1].value;
    }else{
        document.getElementsByName('course_zv')[0].options[1].disabled = true;
        document.getElementsByName('course_zv')[0].value =  document.getElementsByName('course_zv')[0].options[0].value;
    }

    for(var i=0;i<price_list.length;i++){
        if(course_name.value == price_list[i].course){
            if(course_time.value == '36'){
                price = price_list[i].price[0];
            }
            if(course_time.value == '64'){
                price = price_list[i].price[1];
            }
            if(course_time.value == '128'){
                price = price_list[i].price[2];
            }
        }
    }
    document.getElementById("price").innerHTML = "Вартість "+ price+" uah";
}