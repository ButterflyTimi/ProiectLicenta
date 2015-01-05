<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="EditBooks.aspx.cs" Inherits="EditBooks" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="col-sm-12" style="margin-bottom: 50px; padding-bottom: 20px; top: 0px; left: 0px;">
         
        <asp:Table ID="TabelUpdate" runat="server">

            <asp:TableRow ID="TableRow6" runat="server">
                <asp:TableCell ID="TableCell11" runat="server" rowspan="7">
                    <asp:Image CssClass="imaginiCoperti" ID="Image1" runat="server" ImageUrl='<%# "~/pozeCoperti/" + Eval("Poza_Coperta") %>' />
                    
                </asp:TableCell>
            </asp:TableRow>

            <asp:TableRow ID="TableRow1" runat="server">
                <asp:TableCell ID="TableCell1" runat="server">
                    <asp:Label ID="LabelTitlu" runat="server" Text="Titlu"></asp:Label>
                </asp:TableCell>
                <asp:TableCell ID="TableCell2" runat="server">
                    <asp:TextBox ID="TBTitlu" runat="server"></asp:TextBox>  
                    </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow ID="TableRow2" runat="server">
                <asp:TableCell ID="TableCell3" runat="server">
                    <asp:Label ID="LabelAutor" runat="server" Text="Autor"></asp:Label>
                </asp:TableCell>
                <asp:TableCell ID="TableCell4" runat="server">
               
                    <asp:SqlDataSource ID="SqlDataSourceAutor" runat="server" ConnectionString="<%$ ConnectionStrings:BazaDate %>" 
                    SelectCommand="SELECT Prenume+' '+Nume AS NumeAutor, Id FROM Autori">
                    </asp:SqlDataSource>
                    <asp:DropDownList ID="DDLAutor" runat="server" DataSourceID="SqlDataSourceAutor" DataTextField="NumeAutor" DataValueField="Id">
                    </asp:DropDownList>

                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow ID="TableRow3" runat="server">
                <asp:TableCell ID="TableCell5" runat="server">
                    <asp:Label ID="LabelIsbn" runat="server" Text="ISBN"></asp:Label>
                </asp:TableCell>
                <asp:TableCell ID="TableCell6" runat="server">
                    <asp:TextBox ID="TBIsbn" runat="server"></asp:TextBox>  
                    </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow ID="TableRow4" runat="server">
                <asp:TableCell ID="TableCell7" runat="server">
                    <asp:Label ID="LabelGen" runat="server" Text="Gen"></asp:Label>
                </asp:TableCell>
                <asp:TableCell ID="TableCell8" runat="server">

                    <asp:SqlDataSource ID="SqlDataSourceGen" runat="server" ConnectionString="<%$ ConnectionStrings:BazaDate %>" 
                    SelectCommand="SELECT Gen, Id FROM Genuri">
                    </asp:SqlDataSource>
                    <asp:DropDownList ID="DDLGen" runat="server" DataSourceID="SqlDataSourceGen" DataTextField="Gen" DataValueField="Id">
                    </asp:DropDownList>

                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow ID="TableRow5" runat="server">
                <asp:TableCell ID="TableCell9" runat="server">
                    <asp:Label ID="LabelEditura" runat="server" Text="Editura"></asp:Label>
                </asp:TableCell>
                <asp:TableCell ID="TableCell10" runat="server">
         
                    <asp:SqlDataSource ID="SqlDataSourceEditura" runat="server" ConnectionString="<%$ ConnectionStrings:BazaDate %>" 
                    SelectCommand="SELECT Id, Nume_Editura FROM Edituri">

                    </asp:SqlDataSource>
                    <asp:DropDownList ID="DDLEditura" runat="server" DataSourceID="SqlDataSourceEditura" DataTextField="Nume_Editura" DataValueField="Id">
                    </asp:DropDownList>
             
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell ID="TableCell19" runat="server">
                    <asp:Label ID="LabelDescriere" runat="server" Text="Descriere"></asp:Label>
                </asp:TableCell>
                <asp:TableCell ID="TableCell111" runat="server">
                    <asp:TextBox id="TBDescriere" TextMode="multiline" Columns="50" Rows="5" runat="server" />
                </asp:TableCell>
           </asp:TableRow>
           <asp:TableRow ID="TableRow7" runat="server">
                <asp:TableCell></asp:TableCell>
                <asp:TableCell ID="TableCell13" runat="server">
                    <asp:Button ID="ButtonInsertData" runat="server" Text="Modifica" OnClick="submit_updateCarte"/>
                </asp:TableCell>
                <asp:TableCell ID="TableCell12" runat="server">
                    <asp:Button ID="Button2" runat="server" Text="Inapoi la pagina" onclick="back_home" />
                </asp:TableCell>
           </asp:TableRow>
       </asp:Table>

       <asp:Label ID="ErrorLabel" runat="server"></asp:Label>
   </div>
</asp:Content>