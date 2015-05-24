<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master"  %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ASPNETDB %>" 
        SelectCommand="SELECT Carti.Id AS CartiId, Carti.Titlu AS CartiTitlu, Carti.Text_Descriere, Carti.Poza_Coperta, Genuri.Gen, Autori.Prenume + ' ' + Autori.Nume AS NumeAutor FROM Autori INNER JOIN Genuri INNER JOIN Carti ON Genuri.Id = Carti.Id_Gen ON Autori.Id = Carti.Id_Autor">
    </asp:SqlDataSource>

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

</div>

<div class="carti-wrapper-grid2">
        <asp:DataList ID="DataList2" runat="server" DataSourceID="SqlDataSource1" 
        DataKeyField="CartiId">
        <ItemTemplate>
        <div class="row">
            <div class="col-sm-4">
                    <asp:Image CssClass="imaginiCoperti" ID="Image1" runat="server" ImageUrl='<%# "~/pozeCoperti/" + Eval("Poza_Coperta") %>' />
            </div>
            <div class="col-sm-8">
                <h4>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("CartiTitlu") %>' />
                </h4>
                <h5>
                    <asp:Label ID="NumeAutorLabel" runat="server" Text='<%# Eval("NumeAutor") %>' />
                </h5>
                <small>
                    Gen: <asp:Label ID="GenLabel" runat="server" Text='<%# Eval("Gen") %>' />
                </small>
            </div>
        </div>
                
        </ItemTemplate>

        </asp:DataList>
</div>

</asp:Content>

