<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Delete.aspx.cs" Inherits="Delete" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ASPNETDB %>"> 
        </asp:SqlDataSource>

    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
        <ItemTemplate>
            <div class="deleteBook-wrapper">
                <div class="deleteBook-image">
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "~/IndividualBookPage.aspx?q=" + Eval("CartiId") %>'>
                        <asp:Image CssClass="imaginiCoperti" ID="Image1" runat="server" ImageUrl='<%# "~/pozeCoperti/" + Eval("Poza_Coperta") %>' />
                    </asp:HyperLink>
                </div>

                <div class="deleteBook-details">
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("CartiTitlu") %>' CssClass="titles"></asp:Label>
                    de 
                    <asp:HyperLink ID="HyperLink2" runat="server" CssClass="link" NavigateUrl='<%# "~/Search.aspx?q=" + Eval("NumeAutor") %>'>
                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("NumeAutor") %>' CssClass="name"></asp:Label>
                    </asp:HyperLink>
                    <br />
                    Gen: <asp:Label ID="Label2" runat="server" Text='<%# Bind("Gen") %>'></asp:Label>
                </div>
            </div>
        </ItemTemplate>
    </asp:Repeater>

    <div class="row">
        <div class="col-sm-12">
            <h3>Sunteti siguri ca doriti sa stergeti cartea din baza de date?</h3>
            <asp:Button ID="Button1" CssClass="btn primary-button" runat="server" Text="Sterge" onclick="Button1_Click" />
            <asp:Button ID="Button2" CssClass="btn primary-button" runat="server" Text="Inapoi la pagina" onclick="Button2_Click" />
        </div>
   </div>
   <div class="row">
       <div class="col-sm-12">
           <asp:Label ID="ErrorLabel" runat="server"></asp:Label>
       </div>
    </div>
</asp:Content>

