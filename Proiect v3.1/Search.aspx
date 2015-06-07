<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Search.aspx.cs" Inherits="Search" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="search-wrapper">
        <div class="sorting">
            <h3>Sortati dupa:</h3>
            <asp:RadioButtonList ID="RadioButtonList1" runat="server"
                AutoPostBack="true" EnableViewState="true" OnSelectedIndexChanged="Sort_By">
                <asp:ListItem Value="autor" >Autor</asp:ListItem>
                <asp:ListItem Value="titlu">Titlu</asp:ListItem>
            </asp:RadioButtonList> 

        </div>
        <div class="search-results">
            <h3>Rezultatele cautarii:</h3>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ASPNETDB %>">
            </asp:SqlDataSource>
            <div class="search-grid-wrapper">
                <asp:Repeater ID="Repeater3" runat="server" DataSourceID="SqlDataSource1">
                    <ItemTemplate>
                        <div class="search-grid">

                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "~/IndividualBookPage.aspx?q=" + Eval("CartiId") %>'>
                                <asp:Image ID="Image1" runat="server" ImageUrl='<%# "~/pozeCoperti/" + Eval("Poza_Coperta") %>' />
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("CartiTitlu") %>' CssClass="title"></asp:Label>
                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("NumeAutor") %>' CssClass="name"></asp:Label>
                            </asp:HyperLink>

                        </div>
                    </ItemTemplate>
                    <FooterTemplate>
                         <asp:Label ID="Label3"  CssClass="noResultsMessage" Visible='<%# Repeater3.Items.Count == 0 %>' runat="server" Text="Nu exista rezultate"></asp:Label>
                    </FooterTemplate>
                </asp:Repeater>
            </div>

        </div>
    </div>
    
    
    
    </div>
</asp:Content>

