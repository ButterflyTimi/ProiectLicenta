﻿function adaugareComm() {
    var comm = $("#ContentPlaceHolder1_LoginView1_TBComentariu");
    var t = document.getElementById("ContentPlaceHolder1_LoginView1_TBComentariu");
    var text = comm.val();
    text = text.replace(/\r?\n/g, "(new_line)");
    comm.val(text);
}

function errorMessages(messageText, messageType) {
    $.notify({
        // optiuni
        message: messageText
    }, {
        // setari
        type: messageType,
        placement: {
		    from: "top",
		    align: "center"
	    }
    });
}

$(document).ready(function () {

    $("#inserareEdituri").click(function () {
        $("#ContentPlaceHolder1_TabelEdituri").css("display", "initial");
        $("#ContentPlaceHolder1_TabelAutori").css("display", "none");
        $("#ContentPlaceHolder1_TabelGenuri").css("display", "none");
        $("#ContentPlaceHolder1_TabelEdituri").css("display", "none");
        $("#ContentPlaceHolder1_TabelCarti").css("display", "none");
        $("#ContentPlaceHolder1_TabelCartiEdituri").css("display", "none");
    })

    $("#inserareAutori").click(function () {
        $("#ContentPlaceHolder1_TabelEdituri").css("display", "none");
        $("#ContentPlaceHolder1_TabelAutori").css("display", "initial");
        $("#ContentPlaceHolder1_TabelGenuri").css("display", "none");
        $("#ContentPlaceHolder1_TabelEdituri").css("display", "none");
        $("#ContentPlaceHolder1_TabelCarti").css("display", "none");
        $("#ContentPlaceHolder1_TabelCartiEdituri").css("display", "none");
    })
    $("#inserareGenuri").click(function () {
        $("#ContentPlaceHolder1_TabelEdituri").css("display", "none");
        $("#ContentPlaceHolder1_TabelGenuri").css("display", "initial");
        $("#ContentPlaceHolder1_TabelAutori").css("display", "none");
        $("#ContentPlaceHolder1_TabelEdituri").css("display", "none");
        $("#ContentPlaceHolder1_TabelCarti").css("display", "none");
        $("#ContentPlaceHolder1_TabelCartiEdituri").css("display", "none");
    })
    $("#inserareEdituri").click(function () {
        $("#ContentPlaceHolder1_TabelEdituri").css("display", "none");
        $("#ContentPlaceHolder1_TabelEdituri").css("display", "initial");
        $("#ContentPlaceHolder1_TabelAutori").css("display", "none");
        $("#ContentPlaceHolder1_TabelGenuri").css("display", "none");
        $("#ContentPlaceHolder1_TabelCarti").css("display", "none");
        $("#ContentPlaceHolder1_TabelCartiEdituri").css("display", "none");
    })
    $("#inserareCarti").click(function () {
        $("#ContentPlaceHolder1_TabelEdituri").css("display", "none");
        $("#ContentPlaceHolder1_TabelCarti").css("display", "initial");
        $("#ContentPlaceHolder1_TabelAutori").css("display", "none");
        $("#ContentPlaceHolder1_TabelEdituri").css("display", "none");
        $("#ContentPlaceHolder1_TabelGenuri").css("display", "none");
        $("#ContentPlaceHolder1_TabelCartiEdituri").css("display", "none");
    })

    $("#inserareCartiEdituri").click(function () {
        $("#ContentPlaceHolder1_TabelCartiEdituri").css("display", "initial");
        $("#ContentPlaceHolder1_TabelEdituri").css("display", "none");
        $("#ContentPlaceHolder1_TabelCarti").css("display", "none");
        $("#ContentPlaceHolder1_TabelAutori").css("display", "none");
        $("#ContentPlaceHolder1_TabelEdituri").css("display", "none");
        $("#ContentPlaceHolder1_TabelGenuri").css("display", "none");
    })

});