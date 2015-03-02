<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="RegistrationPage.aspx.cs" Inherits="RegistrationPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="col-md-12" style="background-color: rgba(195, 195, 195, 0.4);" id="content">
    <div style="width:50%; margin: 0 auto;">

        <asp:CreateUserWizard ID="CreateUserWizard1" runat="server" 
            CompleteSuccessText="" 
            DuplicateEmailErrorMessage="Adresa introdusa exista deja in baza de date! Va rugam incercati alta adresa!" 
            DuplicateUserNameErrorMessage="Numele exista deja in baza de date. Va rugam incercati alt nume de utilizator!" 
            InvalidEmailErrorMessage="Va rugam introduceti o adresa de email valida." 
            InvalidPasswordErrorMessage="Caractere minime pentru parola: {0}. Minim {1} caracter non-alphanumeric." 
            InvalidQuestionErrorMessage="Va rugam introduceti alta intrebare de securitate." 
            UnknownErrorMessage="Contul nu a putut fi creat. Va rugam incercati din nou!" 
            ContinueButtonText="Inapoi la pagina principala">
            <WizardSteps>
                <asp:CreateUserWizardStep ID="CreateUserWizardStep1" runat="server" Title="Date inregistrare:">
                    <ContentTemplate>
                        <table>
                            <tr>
                                <td align="center" colspan="2">
                                    <h2>Date inregistrare:</h2>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">Nume:</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" 
                                        ControlToValidate="UserName" ForeColor="Red" ToolTip="User Name is required." 
                                        ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Parola:</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" 
                                        ControlToValidate="Password" ForeColor="Red" ToolTip="Password is required." 
                                        ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="ConfirmPasswordLabel" runat="server" 
                                        AssociatedControlID="ConfirmPassword">Confirma parola:</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" 
                                        ControlToValidate="ConfirmPassword" ForeColor="Red" 
                                        ToolTip="Confirm Password is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="Email">E-mail:</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="Email" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="EmailRequired" runat="server" 
                                        ControlToValidate="Email" ForeColor="Red" ToolTip="E-mail is required." 
                                        ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="QuestionLabel" runat="server" AssociatedControlID="Question">Intrebare securitate:</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="Question" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="QuestionRequired" runat="server" 
                                        ControlToValidate="Question" ForeColor="Red" 
                                        ToolTip="Security question is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="AnswerLabel" runat="server" AssociatedControlID="Answer">Raspuns:</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="Answer" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="AnswerRequired" runat="server" 
                                        ControlToValidate="Answer" ForeColor="Red" 
                                        ToolTip="Security answer is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" colspan="2">
                                    <asp:CompareValidator ID="PasswordCompare" runat="server" 
                                        ControlToCompare="Password" ControlToValidate="ConfirmPassword" 
                                        Display="Dynamic" 
                                        ErrorMessage="Atentie! Parolele nu corespund!" 
                                        ValidationGroup="CreateUserWizard1" ForeColor="Red"></asp:CompareValidator>
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                    <CustomNavigationTemplate>
                        <table border="0" cellspacing="5" style="width:100%;height:100%;">
                            <tr align="right">
                                <td align="right" colspan="0">
                                    <asp:Button ID="StepNextButton" runat="server" CommandName="MoveNext" 
                                        Text="Create User" ValidationGroup="CreateUserWizard1" />
                                </td>
                            </tr>
                        </table>
                    </CustomNavigationTemplate>
                </asp:CreateUserWizardStep>
                <asp:CompleteWizardStep ID="CompleteWizardStep1" runat="server" 
                    Title="Inregistrare realizata cu succes!">
                    <ContentTemplate>
                        <table>
                            <tr>
                                <td align="center">
                                    Inregistrare realizata cu succes!</td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Button ID="ContinueButton" runat="server" CausesValidation="False" 
                                        CommandName="Continue" Text="Inapoi la pagina principala" 
                                        ValidationGroup="CreateUserWizard1" onclick="ContinueButton_Click" />
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:CompleteWizardStep>
            </WizardSteps>
            <FinishNavigationTemplate>
                <asp:Button ID="FinishPreviousButton" runat="server" CausesValidation="False" 
                    CommandName="MovePrevious" Text="Previous" />
                <asp:Button ID="FinishButton" runat="server" CommandName="MoveComplete" 
                    Text="Finish" />
            </FinishNavigationTemplate>
            <StartNavigationTemplate>
                <asp:Button ID="StartNextButton" runat="server" CommandName="MoveNext" 
                    Text="Next" />
            </StartNavigationTemplate>
            <StepNavigationTemplate>
                <asp:Button ID="StepPreviousButton" runat="server" CausesValidation="False" 
                    CommandName="MovePrevious" Text="Previous" />
                <asp:Button ID="StepNextButton" runat="server" CommandName="MoveNext" 
                    Text="Next" />
            </StepNavigationTemplate>
        </asp:CreateUserWizard>

    </div>
</div>

</asp:Content>

