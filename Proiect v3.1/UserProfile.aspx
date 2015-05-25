<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="UserProfile.aspx.cs" Inherits="UserProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div class="userProfile-wrapper">
        <div class="userProfile-personalDatas">
            <div class="userProfile-picture-wrapper">
                <div class="userProfile-picture">

                    <asp:Image CssClass="imgUser" ID="UserImage" runat="server" />
                    <button class="btn primary-button changePicture">Schimba poza</button>
                    <asp:FileUpload ID="UserProfilePicture" runat="server" ClientIDMode="Static" onchange="this.form.submit()"  CssClass="actualChangePictureButton" />
                </div>
            </div>

            <div class="userProfile-datas-wrapper">
                <div class="userProfile-datas">
                    <div class="form-group">
                        <label>Nume utilizator:</label>
                        <asp:TextBox ID="Username" runat="server" CssClass="form-control"></asp:TextBox>  
                    </div>
                    <div class="form-group">
                        <label>Email:</label>
                        <asp:TextBox ID="Email" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <asp:Button ID="Button1" runat="server" Text="Actualizeaza datele" CssClass="btn primary-button" OnClick="submit_userInformation"/>
                    <asp:Label ID="changePassword" runat="server" Text="Schimba parola" CssClass="link" data-toggle="modal" data-target="#changePass"></asp:Label>
                </div>
            </div>
        </div>
        <div class="userProfile-books">

        </div>

</div>
            <div class="modal fade" id="changePass">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h3 class="modal-title">
                                <i class="fa fa-key"></i>
                                Schimba parola
                            </h3>
                        </div>
                        <div class="modal-body">
                              
                            <asp:ScriptManager ID="ScriptManager2" runat="server"></asp:ScriptManager>
                                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                    <ContentTemplate>
                                        <asp:ChangePassword ID="ChangePassword1" runat="server">
                                        </asp:ChangePassword>
                                 
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                    </div>
                 </div>
            </div>
 

</asp:Content>

