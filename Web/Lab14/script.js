var timeout;

function set_(obj){
    var end_time = new Date(obj.datetime_name.value);
    var start_time = new Date(Date.now());
    var times = (end_time.getTime()- start_time.getTime());
    console.log(times);
    timeout = setTimeout("alert_()", times);
}

function alert_(){
    alert("Єржан вставай");
}

function clear_(){
    clearTimeout(timeout);
}