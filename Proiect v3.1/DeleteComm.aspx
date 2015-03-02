<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="DeleteComm.aspx.cs" Inherits="DeleteComm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="col-md-12">
<h3>Sunteti siguri ca doriti sa stergeti comentariul din baza de date?</h3>
        <asp:Button ID="Button1" runat="server" Text="Sterge" onclick="Button1_Click" />
        <asp:Button ID="Button2" runat="server" Text="Inapoi la pagina principala" onclick="Button2_Click" />
        <br />

        <asp:Label ID="ErrorLabel" runat="server"></asp:Label>
        </div>
</asp:Content>

