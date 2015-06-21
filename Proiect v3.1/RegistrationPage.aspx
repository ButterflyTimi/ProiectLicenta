<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="RegistrationPage.aspx.cs" Inherits="RegistrationPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="register-wrapper">
        <div class="register-body">

        <h3>
            <i class="fa fa-user"></i>
            Date inregistrare
        </h3>
            

    <asp:CreateUserWizard ID="CreateUserWizard1" CssCLass="registerForm" runat="server" 
                CompleteSuccessText="Contul tau a fost creat" ContinueButtonText="Continua" 
                CreateUserButtonText="Inregistrare" 
                DuplicateEmailErrorMessage="Adresa de e-mail deja exista in baza de date" 
                DuplicateUserNameErrorMessage="Nume utilizator deja existent." 
                InvalidEmailErrorMessage="Va rugam introduceti o adresa de e-mail valida." 
                InvalidPasswordErrorMessage="Numar minim de caractere pentru parola: {0}." 
                oncreateduser="CreateUserWizard1_CreatedUser1">
        <WizardSteps>
            <asp:CreateUserWizardStep ID="CreateUserWizardStep1"  runat="server">
                <ContentTemplate>

                    <div class="form-horizontal">
                        <div class="form-group">

                            <asp:Label ID="UserNameLabel" CssClass="col-sm-3 control-label" runat="server" AssociatedControlID="UserName">Nume utilizator:</asp:Label>
                            <div class="col-sm-8 col-xs-11 input-tb">
                                <asp:TextBox ID="UserName" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="col-sm-1 col-xs-1 validators">
                                <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" 
                                    ControlToValidate="UserName" ErrorMessage="User Name is required." 
                                    ToolTip="User Name is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                            </div>

                        </div>

                        <div class="form-group">
                            <asp:Label ID="PasswordLabel" CssClass="col-sm-3 control-label" runat="server" AssociatedControlID="Password">Parola:</asp:Label>
                            <div class="col-sm-8 col-xs-11 input-tb">
                                <asp:TextBox ID="Password" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="col-sm-1 col-xs-1 validators">
                                <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" 
                                    ControlToValidate="Password" ErrorMessage="Password is required." 
                                    ToolTip="Password is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                            </div>

                        </div>

                        <div class="form-group">
                            <asp:Label ID="ConfirmPasswordLabel" CssClass="col-sm-3 control-label" runat="server" AssociatedControlID="ConfirmPassword">Confirma parola:</asp:Label>
                            <div class="col-sm-8 col-xs-11 input-tb">
                                <asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="col-sm-1 col-xs-1 validators">
                                <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" 
                                    ControlToValidate="ConfirmPassword" 
                                    ErrorMessage="Confirm Password is required." 
                                    ToolTip="Confirm Password is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                            </div>

                        </div>

                        <div class="form-group">
                            <asp:Label ID="EmailLabel" runat="server" CssClass="col-sm-3 control-label" AssociatedControlID="Email">E-mail:</asp:Label>
                            <div class="col-sm-8 col-xs-11 input-tb">
                                <asp:TextBox ID="Email" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="col-sm-1 col-xs-1 validators">
                                <asp:RequiredFieldValidator ID="EmailRequired" runat="server" 
                                    ControlToValidate="Email" ErrorMessage="E-mail is required." 
                                    ToolTip="E-mail is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                            </div>

                        </div>
                        <div class="form-group">
                            <div class="col-sm-9 col-sm-push-3 validators warning-message">
                                <asp:CompareValidator ID="PasswordCompare" runat="server" 
                                    ControlToCompare="Password" ControlToValidate="ConfirmPassword" 
                                    Display="Dynamic" ErrorMessage="Parolele trebuie sa corespunda." 
                                    ValidationGroup="CreateUserWizard1"></asp:CompareValidator>
                            </div>
                            <div class="col-sm-9 col-sm-push-3 validators warning-message">
                                <asp:Literal ID="ErrorMessage" runat="server" EnableViewState="False"></asp:Literal>
                            </div>
                        </div>
                    </div>

                </ContentTemplate>
                <CustomNavigationTemplate>
                    <div class="form-horizontal">
                        <div class="form-group">
                            <div class="col-sm-9 col-sm-push-3">
                                <asp:Button ID="StepNextButton" runat="server" CommandName="MoveNext" CssClass="btn primary-button"
                                        Text="Inregistrare" ValidationGroup="CreateUserWizard1" />
                            </div>
                        </div>
                    </div>
                </CustomNavigationTemplate>
            </asp:CreateUserWizardStep>
            <asp:CompleteWizardStep ID="CompleteWizardStep1" runat="server">
                <ContentTemplate>
                    
                    <div class="form-horizontal">
                        <div class="form-group">
                            <div class="col-sm-12 text-center">
                                Felicitari! Contul tau a fost creat.
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-12 text-center">

                                <asp:Button ID="ContinueButton" runat="server" CausesValidation="False" 
                                    CommandName="Continue" CssClass="btn primary-button" Text="Continua" 
                                    ValidationGroup="CreateUserWizard1" />

                            </div>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:CompleteWizardStep>
        </WizardSteps>
    </asp:CreateUserWizard>

    </div>
</div>

</asp:Content>

