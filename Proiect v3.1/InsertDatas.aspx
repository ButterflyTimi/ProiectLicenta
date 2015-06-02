<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="InsertDatas.aspx.cs" Inherits="InsertDatas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="col-md-12">

<table>
<tr>
    <td><h4 class="tabeleHeadere" id="inserareEdituri">Inserati Edituri</h4></td>
    <td><h4 class="tabeleHeadere" id="inserareAutori">Inserati Autori</h4></td>
    <td><h4 class="tabeleHeadere" id="inserareGenuri">Inserati Genuri</h4></td>
    <td><h4 class="tabeleHeadere" id="inserareCarti">Inserati Carti</h4></td>
    <td><h4 class="tabeleHeadere" id="inserareCartiEdituri">Inserati Carti</h4></td>
</tr>
</table>

<asp:Table ID="TabelEdituri" runat="server">
    <asp:TableRow ID="TableRow3" runat="server">
            <asp:TableCell ID="TableCell5" runat="server">
                <asp:Label ID="Label4" runat="server" Text="Nume Editura"></asp:Label>
            </asp:TableCell>
            <asp:TableCell ID="TableCell6" runat="server">
                <asp:TextBox ID="TBEditura" runat="server"></asp:TextBox>  
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ForeColor="Red"
                ErrorMessage="*" ControlToValidate="TBEditura" ValidationGroup="validatorEdituri"></asp:RequiredFieldValidator>
            </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow ID="TableRow5" runat="server">
            <asp:TableCell ID="TableCell9" runat="server">
                <asp:Label ID="Label5" runat="server" Text="Link Editura"></asp:Label>
            </asp:TableCell>
            <asp:TableCell ID="TableCell10" runat="server">
                <asp:TextBox ID="TBLinkEditura" runat="server"></asp:TextBox>
            </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow ID="TableRow12" runat="server">
            <asp:TableCell ID="TableCell21" runat="server">
                <asp:Button ID="Button2" runat="server" Text="Insereaza" OnClick="submit_editura" ValidationGroup="validatorEdituri" />
            </asp:TableCell>
        </asp:TableRow>
</asp:Table>


<asp:Table ID="TabelAutori" runat="server">
    <asp:TableRow ID="TableRow9" runat="server">
            <asp:TableCell ID="TableCell17" runat="server">
                <asp:Label ID="Label2" runat="server" Text="Prenume"></asp:Label>
            </asp:TableCell>
            <asp:TableCell ID="TableCell18" runat="server">
                <asp:TextBox ID="TBPrenume" runat="server"></asp:TextBox>  
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ForeColor="Red"
                ErrorMessage="*" ControlToValidate="TBPrenume" ValidationGroup="validatorAutori"></asp:RequiredFieldValidator>
            </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow ID="TableRow8" runat="server">
            <asp:TableCell ID="TableCell15" runat="server">
                <asp:Label ID="Label1" runat="server" Text="Nume"></asp:Label>
            </asp:TableCell>
            <asp:TableCell ID="TableCell16" runat="server">
                <asp:TextBox ID="TBNume" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ForeColor="Red"
                ErrorMessage="*" ControlToValidate="TBNume" ValidationGroup="validatorAutori"></asp:RequiredFieldValidator>
            </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow ID="TableRow10" runat="server">
            <asp:TableCell ID="TableCell14" runat="server">
                <asp:Button ID="ButtonInsertAutor" runat="server" Text="Insereaza" OnClick="submit_autor" ValidationGroup="validatorAutori" />
            </asp:TableCell>
        </asp:TableRow>
</asp:Table>

<asp:Table ID="TabelGenuri" runat="server">
    <asp:TableRow ID="TableRow11" runat="server">
            <asp:TableCell ID="TableCell19" runat="server">
                <asp:Label ID="Label3" runat="server" Text="Gen"></asp:Label>
            </asp:TableCell>
            <asp:TableCell ID="TableCell20" runat="server">
                <asp:TextBox ID="TBGen" runat="server"></asp:TextBox>  
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ForeColor="Red"
                ErrorMessage="*" ControlToValidate="TBGen" ValidationGroup="validatorGenuri"></asp:RequiredFieldValidator>
            </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow ID="TableRow13" runat="server">
            <asp:TableCell ID="TableCell23" runat="server">
                <asp:Button ID="Button1" runat="server" Text="Insereaza" ValidationGroup="validatorGenuri" OnClick="submit_gen"/>
            </asp:TableCell>
        </asp:TableRow>
</asp:Table>

    <asp:Table ID="TabelCarti" runat="server">
    <asp:TableRow ID="TableRow1" runat="server">
            <asp:TableCell ID="TableCell1" runat="server">
                <asp:Label ID="LabelTitlu" runat="server" Text="Titlu"></asp:Label>
            </asp:TableCell>
            <asp:TableCell ID="TableCell2" runat="server">
                <asp:TextBox ID="TBTitlu" runat="server"></asp:TextBox>  
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ForeColor="Red"
                ErrorMessage="*" ControlToValidate="TBTitlu" ValidationGroup="validatorCarti"></asp:RequiredFieldValidator>
            </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow ID="TableRow2" runat="server">
            <asp:TableCell ID="TableCell3" runat="server">
                <asp:Label ID="LabelAutor" runat="server" Text="Autor"></asp:Label>
            </asp:TableCell>
            <asp:TableCell ID="TableCell4" runat="server">
               
                <asp:SqlDataSource ID="SqlDataSourceAutor" runat="server" ConnectionString="<%$ ConnectionStrings:ASPNETDB %>" 
                SelectCommand="SELECT Prenume+' '+Nume AS NumeAutor, Id FROM Autori">
            </asp:SqlDataSource>
                <asp:DropDownList ID="DDLAutor" runat="server" DataSourceID="SqlDataSourceAutor" DataTextField="NumeAutor" DataValueField="Id">
                </asp:DropDownList>

            </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow ID="TableRow4" runat="server">
            <asp:TableCell ID="TableCell7" runat="server">
                <asp:Label ID="LabelGen" runat="server" Text="Gen"></asp:Label>
            </asp:TableCell>
            <asp:TableCell ID="TableCell8" runat="server">

            <asp:SqlDataSource ID="SqlDataSourceGen" runat="server" ConnectionString="<%$ ConnectionStrings:ASPNETDB %>" 
            SelectCommand="SELECT Gen, Id FROM Genuri">
            </asp:SqlDataSource>

            <asp:DropDownList ID="DDLGen" runat="server" DataSourceID="SqlDataSourceGen" DataTextField="Gen" DataValueField="Id">
            </asp:DropDownList>

            </asp:TableCell>
    </asp:TableRow>

    <asp:TableRow ID="TableRow20" runat="server">
            <asp:TableCell ID="TableCell33" runat="server">
                <asp:Label ID="Label8" runat="server" Text="Descriere:"></asp:Label>
            </asp:TableCell>
            <asp:TableCell ID="TableCell34" runat="server">
                <asp:TextBox id="TBDescriere" TextMode="multiline" Columns="50" Rows="5" runat="server" />  
                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ForeColor="Red"
                ErrorMessage="*" ControlToValidate="TBDescriere" ValidationGroup="validatorCarti"></asp:RequiredFieldValidator>
            </asp:TableCell></asp:TableRow>

    <asp:TableRow ID="TableRow6" runat="server">
            <asp:TableCell ID="TableCell11" runat="server">
                <asp:Label ID="LabelPozaCoperta" runat="server" Text="Poza Coperta"></asp:Label>
            </asp:TableCell>
            <asp:TableCell ID="TableCell12" runat="server">
                <asp:FileUpload ID="FileUploadPozaCoperta" runat="server" />
            </asp:TableCell>
    </asp:TableRow>

     <asp:TableRow ID="TableRow7" runat="server">
            <asp:TableCell ID="TableCell13" runat="server">
                <asp:Button ID="ButtonInsertData" runat="server" Text="Insereaza" OnClick="submit_carte" ValidationGroup="validatorCarti" />
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>

    <asp:Table ID="TabelCartiEdituri" runat="server">
    <asp:TableRow ID="TableRow14" runat="server">
            <asp:TableCell ID="TableCell22" runat="server">
                <asp:Label ID="Label6" runat="server" Text="Nume Carte"></asp:Label>
            </asp:TableCell>
            <asp:TableCell ID="TableCell24" runat="server">
            
                <asp:SqlDataSource ID="SqlDataSourceCarti" runat="server" ConnectionString="<%$ ConnectionStrings:ASPNETDB %>" 
            SelectCommand="SELECT Titlu, Id FROM Carti">
            </asp:SqlDataSource>

            <asp:DropDownList ID="DDLCarte" runat="server" DataSourceID="SqlDataSourceCarti" DataTextField="Titlu" DataValueField="Id">
            </asp:DropDownList>

            </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow ID="TableRow15" runat="server">
            <asp:TableCell ID="TableCell25" runat="server">
                <asp:Label ID="Label7" runat="server" Text="Nume Editura"></asp:Label>
            </asp:TableCell>
            <asp:TableCell ID="TableCell26" runat="server">
            
                <asp:SqlDataSource ID="SqlDataSourceEdituri" runat="server" ConnectionString="<%$ ConnectionStrings:ASPNETDB %>" 
            SelectCommand="SELECT Editura, Id FROM Edituri">
            </asp:SqlDataSource>

            <asp:DropDownList ID="DDLEditura" runat="server" DataSourceID="SqlDataSourceEdituri" DataTextField="Editura" DataValueField="Id">
            </asp:DropDownList>

            </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow ID="TableRow16" runat="server">
            <asp:TableCell ID="TableCell27" runat="server">
                <asp:Button ID="Button3" runat="server" Text="Insereaza" OnClick="submit_carteEditura"/>
            </asp:TableCell>
        </asp:TableRow>
</asp:Table>



            
            <asp:Label ID="ErrorLabel" runat="server"></asp:Label>

    </div>
</asp:Content>
