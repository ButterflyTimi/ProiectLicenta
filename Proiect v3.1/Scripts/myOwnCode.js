function adaugareComm() {
    var comm = $("#ContentPlaceHolder1_LoginView1_TBComentariu");
    var t = document.getElementById("ContentPlaceHolder1_LoginView1_TBComentariu");
    var text = comm.val();
    text = text.replace(/\r?\n/g, "(new_line)");
    comm.val(text);
}
var colors = ["#FFC6FF", "#FFFFFF", "#C2C9FC", "#89FFAF", "#E6FF89"];
var ui = $(".userIcon");

for (var i = 0; i < ui.length; i++) {
    var random = Math.floor((Math.random() * 4)); ;
    var randomColor = colors[random];
    console.log(ui[i]);
    //ui[i].css("background-color", randomColor);
}

$(document).ready(function () {

    $("h1").click(function () {
        window.location = "Home.aspx";
    })

    $("#LoginView1_registrationButton").click(function () {
        window.location = "RegistrationPage.aspx";
    })

    $("#LoginView1_loginButton").click(function () {
        $(".blackBackground").fadeToggle();
        $(".loginForm").fadeToggle();

        $(".blackBackground").css("z-index", "10");
        $(".loginForm").css("z-index", "11");
    })

    $(".blackBackground").click(function () {
        $(this).fadeToggle();
        $(".loginForm").fadeToggle();
    })

    $("#inserareAutori").click(function () {
        $("#ContentPlaceHolder1_TabelAutori").css("display", "initial");
        $("#ContentPlaceHolder1_TabelGenuri").css("display", "none");
        $("#ContentPlaceHolder1_TabelEdituri").css("display", "none");
        $("#ContentPlaceHolder1_TabelCarti").css("display", "none");
    })
    $("#inserareGenuri").click(function () {
        $("#ContentPlaceHolder1_TabelGenuri").css("display", "initial");
        $("#ContentPlaceHolder1_TabelAutori").css("display", "none");
        $("#ContentPlaceHolder1_TabelEdituri").css("display", "none");
        $("#ContentPlaceHolder1_TabelCarti").css("display", "none");
    })
    $("#inserareEdituri").click(function () {
        $("#ContentPlaceHolder1_TabelEdituri").css("display", "initial");
        $("#ContentPlaceHolder1_TabelAutori").css("display", "none");
        $("#ContentPlaceHolder1_TabelGenuri").css("display", "none");
        $("#ContentPlaceHolder1_TabelCarti").css("display", "none");
    })
    $("#inserareCarti").click(function () {
        $("#ContentPlaceHolder1_TabelCarti").css("display", "initial");
        $("#ContentPlaceHolder1_TabelAutori").css("display", "none");
        $("#ContentPlaceHolder1_TabelEdituri").css("display", "none");
        $("#ContentPlaceHolder1_TabelGenuri").css("display", "none");
    })

});