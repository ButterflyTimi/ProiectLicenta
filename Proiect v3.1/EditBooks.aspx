<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="EditBooks.aspx.cs" Inherits="EditBooks" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="editBook-wrapper">
        <div class="editBook-image">
            <asp:Image CssClass="imaginiCoperti" ID="Image1" runat="server" ImageUrl='<%# "~/pozeCoperti/" + Eval("Poza_Coperta") %>' />
        </div>

        <div class="editBook-details">
            <div class="form-horizontal">
                <div class="form-group">
                    <asp:Label ID="LabelTitlu" runat="server" CssClass="col-sm-4 control-label" Text="Titlu"></asp:Label>
                    <div class="col-sm-8 input-tb">
                        <asp:TextBox ID="TBTitlu" runat="server"  CssClass="form-control"></asp:TextBox>  
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label ID="LabelAutor" runat="server" CssClass="col-sm-4 control-label" Text="Autor"></asp:Label>
                    <div class="col-sm-8 input-tb">
                        
                        <asp:SqlDataSource ID="SqlDataSourceAutor" runat="server" ConnectionString="<%$ ConnectionStrings:ASPNETDB %>" 
                        SelectCommand="SELECT Prenume+' '+Nume AS NumeAutor, Id FROM Autori">
                        </asp:SqlDataSource>
                        <asp:DropDownList ID="DDLAutor" runat="server" CssClass="input-primary-style" DataSourceID="SqlDataSourceAutor" DataTextField="NumeAutor" DataValueField="Id">
                        </asp:DropDownList>

                    </div>
                </div>
                <div class="form-group">
                    <asp:Label ID="LabelGen" runat="server" CssClass="col-sm-4 control-label" Text="Gen"></asp:Label>
                    <div class="col-sm-8 input-tb">
                        <asp:SqlDataSource ID="SqlDataSourceGen" runat="server" ConnectionString="<%$ ConnectionStrings:ASPNETDB %>" 
                        SelectCommand="SELECT Gen, Id FROM Genuri">
                        </asp:SqlDataSource>
                        <asp:DropDownList ID="DDLGen" runat="server" CssClass="input-primary-style" DataSourceID="SqlDataSourceGen" DataTextField="Gen" DataValueField="Id">
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label ID="LabelDescriere" CssClass="col-sm-4 control-label" runat="server" Text="Descriere"></asp:Label>
                    <div class="col-sm-8 input-tb">
                        <asp:TextBox id="TBDescriere" TextMode="multiline" CssClass="form-control" Columns="50" Rows="5" runat="server" />
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-8 col-sm-push-3 input-tb">
                        <asp:Button ID="ButtonInsertData" runat="server" CssClass="btn primary-button" Text="Modifica" OnClick="submit_updateCarte"/>

                        <asp:Button ID="Button2" runat="server" Text="Inapoi la pagina" CssClass="btn primary-button" onclick="back_home" />
                     </div>
                </div>
            </div>
        </div>

       <asp:Label ID="ErrorLabel" runat="server"></asp:Label>
   </div>
</asp:Content>