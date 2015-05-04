<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="UserProfile.aspx.cs" Inherits="UserProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div class="userProfile-wrapper">
        <div class="userProfile-personalDatas">
            <div class="userProfile-picture-wrapper">
                <div class="userProfile-picture">
                    <asp:Image CssClass="imgUser" ID="Image1" runat="server" ImageUrl="pozeUseri/text.jpg" />
                    <asp:Button ID="Button2" runat="server" Text="Schimba poza" 
                        CssClass="btn primary-button changePicture"/>
                </div>
            </div>

            <div class="userProfile-datas-wrapper">
                <div class="userProfile-datas">
                    <div class="form-group">
                        <label>Nume utilizator:</label>
                        <asp:TextBox ID="Username" runat="server"  CssClass="form-control" />
                    </div>
                    <div class="form-group">
                        <label>Email:</label>
                        <asp:TextBox ID="Email" runat="server"  CssClass="form-control" />
                    </div>
                    <asp:Button ID="Button1" runat="server" Text="Actualizeaza datele" 
                        CssClass="btn primary-button" onclick="Button1_Click"/>
                    <asp:Label ID="changePassword" runat="server" Text="Schimba parola" CssClass="link"></asp:Label>
                                
                </div>
            </div>
        </div>
        <div class="userProfile-books">

        </div>
     <!--
        <div class="userProfile-datas">

             <div class="form-group">
                <label>Nume vechi utilizator:</label>
                <asp:TextBox ID="OldUsername" runat="server"  CssClass="form-control" />
             </div>
             <asp:Button ID="btnSubmit" runat="server" Text="Schimba nume utilizator" CssClass="btn primary-button"/>

             <!--
             <div class="form-group">
                <label class="col-sm-4 control-label">Nume nou utilizator:</label>
                <div class="col-sm-8 input-tb">
                    <asp:TextBox ID="NewUsername" runat="server"  CssClass="form-control" />
                </div>
             </div>

             <div class="form-group">
                <label class="col-sm-4 control-label">Email vechi:</label>
                <div class="col-sm-8 input-tb">
                    <asp:TextBox ID="OldEmail" runat="server"  CssClass="form-control" />
                </div>
             </div>

             <div class="form-group">
                <label class="col-sm-4 control-label">Email nou:</label>
                <div class="col-sm-8 input-tb">
                    <asp:TextBox ID="NewEmail" runat="server"  CssClass="form-control" />
                </div>
             </div>

             <div class="form-group">
                <label class="col-sm-4 control-label">Parola veche:</label>
                <div class="col-sm-8 input-tb">
                    <asp:TextBox ID="OldPassword" runat="server"  CssClass="form-control" />
                </div>
             </div>

             <div class="form-group">
                <label class="col-sm-4 control-label">Parola noua:</label>
                <div class="col-sm-8 input-tb">
                    <asp:TextBox ID="NewPassword" runat="server"  CssClass="form-control" />
                </div>
             </div>
             </div>-->
</div>


</asp:Content>

