<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="Contact" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div class="contact-wrapper">
    <div class="contact-body">

    <asp:Label ID="TB" runat="server" />

        <asp:Panel ID="Panel1" runat="server" DefaultButton="btnSubmit">

        <div class="form-horizontal">
             <div class="form-group">
                <label class="col-sm-3 control-label">Nume utilizator:</label>
                <div class="col-sm-8 col-xs-11 input-tb">
                    <asp:TextBox ID="YourName" runat="server"  CssClass="form-control" />

                </div>
                <div class="col-sm-1 col-xs-1 validators">

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="*"
                    ControlToValidate="YourName" ValidationGroup="save" />

                </div>
             </div>

             <div class="form-group">
                <label class="col-sm-3 control-label">Email:</label>
                <div class="col-sm-8 col-xs-11 input-tb">
                    <asp:TextBox ID="YourEmail" runat="server" CssClass="form-control" />

                </div>
                <div class="col-sm-1 col-xs-1 validators">

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*"
                    ControlToValidate="YourEmail" ValidationGroup="save" />

                </div>
             </div>

             <div class="form-group">
                <label class="col-sm-3  control-label">Subiect:</label>
                <div class="col-sm-8 col-xs-11 input-tb">
                    <asp:TextBox ID="YourSubject" runat="server" CssClass="form-control"/>

                </div>
                <div class="col-sm-1 col-xs-1 validators">

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*"
                    ControlToValidate="YourSubject" ValidationGroup="save" />

                </div>
             </div>

             <div class="form-group">
                <label class="col-sm-3 control-label">Mesaj/Intrebare:</label>
                <div class="col-sm-8 col-xs-11 input-tb">

                    <asp:TextBox ID="Comments" runat="server" CssClass="form-control"
                        TextMode="MultiLine" Rows="10"/>
                </div>
                <div class="col-sm-1 col-xs-1 validators">

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*"
                    ControlToValidate="Comments" ValidationGroup="save" />

                </div>
             </div>

            <div class="form-group">
                <div class="col-sm-8 col-sm-offset-3">
                    <asp:Button ID="btnSubmit" runat="server" Text="Trimite" CssClass="btn primary-button"
                            OnClick="Button1_Click" ValidationGroup="save" />
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-8 col-sm-offset-3 validators good-message">
                    <asp:Label ID="DisplayMessage" runat="server" Visible="false" />
                </div>
            </div>
    </div>

        </asp:Panel>

    </div>
</div>

</asp:Content>

