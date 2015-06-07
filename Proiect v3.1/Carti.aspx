<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Carti.aspx.cs" Inherits="Carti" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ASPNETDB %>" 
        SelectCommand="SELECT Carti.Id AS CartiId, Carti.Titlu AS CartiTitlu, Carti.Text_Descriere, Carti.Poza_Coperta, Genuri.Gen, Autori.Prenume + ' ' + Autori.Nume AS NumeAutor FROM Autori INNER JOIN Genuri INNER JOIN Carti ON Genuri.Id = Carti.Id_Gen ON Autori.Id = Carti.Id_Autor">
    </asp:SqlDataSource>

<div class="books-wrapper">

    <div class="filtre">
        <h3>Genuri</h3>
        <div class="genuri">
        

            <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ASPNETDB %>" 
                SelectCommand="SELECT Genuri.Gen, Genuri.Id, COUNT(*) AS NumarGenuri 
                                FROM Carti INNER JOIN Genuri ON Carti.Id_Gen = Genuri.Id 
                                GROUP BY Genuri.Gen, Genuri.Id">
            </asp:SqlDataSource>

            <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource3">
                <ItemTemplate>
                    <asp:CheckBox ID="Genuri" runat="server" CssClass="numeGen"  Text='<%# Eval("Gen") %>' 
                    AutoPostBack="true" EnableViewState="true" OnCheckedChanged="Select_Gen"/>
                    <asp:HiddenField ID="GenId" runat="server" Value='<%# Eval("Id") %>'/>
                    (<asp:Label ID="DescriptionLabel" runat="server" Text='<%# Eval("NumarGenuri") %>' />)
                    <br />
                </ItemTemplate>
            </asp:Repeater>
        </div>
        
        <h3>Autori</h3>
        <div class="autori">
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ASPNETDB %>" 
                SelectCommand="SELECT Autori.Prenume +' '+Autori.Nume AS NumeAutor, COUNT(*) AS NumarAutori 
                                FROM Autori INNER JOIN Carti ON Autori.Id = Carti.Id_Autor 
                                GROUP BY Autori.Prenume,Autori.Nume">
            </asp:SqlDataSource>

            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource2">
                <ItemTemplate>
                    <asp:CheckBox ID="NumeAutor" runat="server" CssClass="numeAutor" Text='<%# Eval("NumeAutor") %>' 
                    AutoPostBack="true" EnableViewState="true" OnCheckedChanged="Select_Autor"/>
                    (<asp:Label ID="DescriptionLabel" runat="server" Text='<%# Eval("NumarAutori") %>' />)
                    <br />
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
    <div class="carti">
        <div class="carti-grid-wrapper">
            <asp:Repeater ID="Repeater3" runat="server">
                <ItemTemplate>
                    <div class="carti-grid">

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
        <div class="paginare-wrapper">
            <div class="paginare">
                <asp:Repeater ID="rptPaging" runat="server" OnItemCommand="rptPaging_ItemCommand">
                    <ItemTemplate>
                        <asp:LinkButton ID="btnPage" CssClass="numerePaginare" CommandName="Page" CommandArgument="<%# Container.DataItem %>" runat="server">
                            <%# Container.DataItem %>
                        </asp:LinkButton>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </div>
</div>

<!--
<div class="carti-wrapper-grid1">
    <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" 
        DataKeyField="CartiId" RepeatColumns="4" RepeatDirection="Horizontal" Width="100%">
        <ItemTemplate>

        <div class="row">
            <div class="col-sm-12 imagine_titlu">
                <div class="imagine" style="background: url('<%# "pozeCoperti/" + Eval("Poza_Coperta") %>')"></div>
                <h4>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("CartiTitlu") %>' />
                </h4>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-6 autor_carte">
                <h5>
                    <asp:Label ID="NumeAutorLabel" runat="server" Text='<%# Eval("NumeAutor") %>' />
                </h5>
            </div>
            <div class="col-sm-6 gen_carte">
                <h5>
                    Gen: <asp:Label ID="GenLabel" runat="server" Text='<%# Eval("Gen") %>' />
                </h5>
            </div>

        </ItemTemplate>
    </asp:DataList>

</div>-->


</asp:Content>

