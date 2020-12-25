
$(document).ready(function () {
    $("#hide").click(function () {
        $("tr:odd").hide();
    });
    $("#show").click(function () {
        $("tr:odd").show();
    });
    $("#doubleclick").dblclick(function () {
        if ($("#image").attr('class') != "center"){
            $("#image").addClass("center");
        }else{
            $("#image").removeClass("center");
        }
    });


    $("#div_show").click(function () {
        let i = getRandomInt(1,5);


        $("#div" + i.toString()).removeClass("hide");
        $("#div" + i.toString()).addClass("show");
    });

    $("#images_img").click(function () {
        if(is_active){
            for(var i=2;i<=6;i+=2)
                $("#image"+i).slideUp("slow");
        }else{
            for(var i=2;i<=6;i+=2)
                $("#image"+i).slideDown("slow");
        }
        is_active = !is_active;
    });
});
var is_active = true;

function getRandomInt(min, max) {
    min = Math.ceil(min);
    max = Math.floor(max);
    return Math.floor(Math.random() * (max - min + 1)) + min;
}
    