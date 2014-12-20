<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="RegistrationPage.aspx.cs" Inherits="RegistrationPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div class="col-sm-12" 
        style="background-color: rgba(195, 195, 195, 0.4);">
<div style="width:50%; margin: 0 auto">
<h2>Date Inregistrare</h2>
<div class="form-group">
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
        ControlToValidate="UsernameTB" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
    <asp:Label ID="Label1" runat="server" Text="Nume:"></asp:Label>
    <asp:TextBox ID="UsernameTB" runat="server" class="form-control" placeHolder="Nume utilizator"></asp:TextBox>
    <!-- De verificat cu baza de date pentru username si email unice-->
</div>

<div class="form-group">
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
        ControlToValidate="EmailTB" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
    <asp:Label ID="Label2" runat="server" Text="Email:"></asp:Label>

    <asp:TextBox ID="EmailTB" runat="server" class="form-control" placeHolder="ex. nume.prenume@email.com"></asp:TextBox>
</div>

<div class="form-group">
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
        ControlToValidate="PasswordTB" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
    <asp:Label ID="Label3" runat="server" Text="Parola:"></asp:Label>
    <asp:TextBox ID="PasswordTB" runat="server" class="form-control" placeHolder="*****"></asp:TextBox>
</div>

<div class="form-group">
    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
        ControlToValidate="RepeatPasswordTB" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
    <asp:Label ID="Label4" runat="server" Text="Repeta Parola:"></asp:Label>
    <asp:TextBox ID="RepeatPasswordTB" runat="server" class="form-control" placeHolder="*****"></asp:TextBox>
</div>


<asp:Button ID="CompleteRegistrationFormButton" runat="server" Text="Inregistrare" />
<div class="form-group">
        	<span>Login</span>
</div>

</div>


</div>

</asp:Content>

