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


});