<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="LoginModal.aspx.vb" Inherits="LoginModal" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div class="modal fade" id="loginModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h3 class="modal-title">
                    <i class="fa fa-sign-in"></i>
                    Conecteaza-te
                </h3>
            </div>
            <div class="modal-body">
                <asp:Login ID="Login" runat="server" 
                    LoginButtonText="Intra in cont" 
                    PasswordLabelText="Parola:" 
                    UserNameLabelText="Nume utilizator:" 
                    RememberMeText="Tine minte" TitleText="" 
                    FailureText="Login nereusit. Va rugam incercati din nou."
                    CssClass="login-form-table">
                    <LoginButtonStyle CssClass="primaryButton" />
                </asp:Login>
            </div>
        </div>
    </div>
</div>

</asp:Content>

