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
        $("#ContentPlaceHolder1_TabelDescrieri").css("display", "none");
    })
    $("#inserareGenuri").click(function () {
        $("#ContentPlaceHolder1_TabelGenuri").css("display", "initial");
        $("#ContentPlaceHolder1_TabelAutori").css("display", "none");
        $("#ContentPlaceHolder1_TabelEdituri").css("display", "none");
        $("#ContentPlaceHolder1_TabelCarti").css("display", "none");
        $("#ContentPlaceHolder1_TabelDescrieri").css("display", "none");
    })
    $("#inserareEdituri").click(function () {
        $("#ContentPlaceHolder1_TabelEdituri").css("display", "initial");
        $("#ContentPlaceHolder1_TabelAutori").css("display", "none");
        $("#ContentPlaceHolder1_TabelGenuri").css("display", "none");
        $("#ContentPlaceHolder1_TabelCarti").css("display", "none");
        $("#ContentPlaceHolder1_TabelDescrieri").css("display", "none");
    })
    $("#inserareCarti").click(function () {
        $("#ContentPlaceHolder1_TabelCarti").css("display", "initial");
        $("#ContentPlaceHolder1_TabelAutori").css("display", "none");
        $("#ContentPlaceHolder1_TabelEdituri").css("display", "none");
        $("#ContentPlaceHolder1_TabelGenuri").css("display", "none");
        $("#ContentPlaceHolder1_TabelDescrieri").css("display", "none");
    })
    $("#inserareDescrieri").click(function () {
        $("#ContentPlaceHolder1_TabelDescrieri").css("display", "initial");
        $("#ContentPlaceHolder1_TabelCarti").css("display", "none");
        $("#ContentPlaceHolder1_TabelAutori").css("display", "none");
        $("#ContentPlaceHolder1_TabelEdituri").css("display", "none");
        $("#ContentPlaceHolder1_TabelGenuri").css("display", "none");
    })




});