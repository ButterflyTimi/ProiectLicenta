﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AboutPage.aspx.cs" Inherits="AboutPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div class="aboutUs-wrapper">
    <div class="aboutUs-body">
        <h2>Salut! Bine ai venit #LaOCarte!</h2>
        <p>
            Nu stii ce sa mai citesti? Ai nevoie de o mica biblioteca virtuala?<br />
            Noi suntem aici pentru toti cititorii inraiti, pentru omuletii cu nevoia de organizare care vor 
            sa-si tina evidenta la tot ceea ce au citit, citesc in prezent si vor sa mai citeasca,
            si pentru toti pasionatii si iubitorii de carti in general. <br />
            Aici veti gasi o colectie de peste 100 de carti din toate genurile, de la cei mai cunoscuti
            autori. 
            </p>
        <p class="question">
            Ce trebuie sa faci?
        </p>
        <div class="explanation-wrapper">
            <div class="explanation1">
                <strong>Pasul 1:</strong> <br />
                Daca nu ai un cont deja, creaza-ti unul
                <asp:HyperLink ID="HyperLink1" runat="server" CssClass="link" NavigateUrl='~/RegistrationPage.aspx'>
                    aici</asp:HyperLink>.
                Dureaza doar cateva minute si promitem ca nu iti cerem prea multe date.
            
            </div>

            <div class="explanation2">
                <strong>Pasul 2:</strong> <br />
                Cautati cartile preferate, adauga-le la favorite, scrie recenzii despre ele,
                voteaza-le pe cele care care iti plac. De asemenea, poti adauga cartile pe care vrei sa le citesti 
                pe viitor sau cele pe care deja le-ai citit in propriul portofoliu.
            </div>

            <div class="explanation3">
                <strong>Pasul 3:</strong> <br />
                Pe baza optiunilor tale, noi iti putem recomanda carti noi care te-ar putea
                interesa si care credem noi ca ti-ar placea, astfel incat sa nu te plictisesti
                niciodata.

            </div>
        </div>
    </div>
</div>
</asp:Content>
