<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="IndividualBookPage.aspx.cs" Inherits="IndividualBookPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ASPNETDB %>">
    </asp:SqlDataSource>

     <div class="detail-book-wrapper">
        <asp:TextBox ID="TBcount" CssClass="count" runat="server">0</asp:TextBox>

    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
    <ItemTemplate>
    <div class="book-picture">
        <asp:Image CssClass="imaginiCoperti" ID="Image1" runat="server" ImageUrl='<%# "~/pozeCoperti/" + Eval("Poza_Coperta") %>' />
    </div>

    <div class="book-details">
        <asp:Label ID="Label1" runat="server" Text='<%# Bind("CartiTitlu") %>' Font-Bold="True" Font-Italic="True" Font-Size="XX-Large"></asp:Label>
        <asp:Label ID="Label3" runat="server" Text='<%# Eval("NumeAutor") %>' Font-Italic="True" Font-Size="Large"></asp:Label>
    
        <div class="book-gen">
                <asp:Label ID="Label6" runat="server" Text="Gen: " CssClass="labeluriCarti"></asp:Label>
                <asp:Label ID="Label2" runat="server" Text='<%# Bind("Gen") %>'></asp:Label>
    </div>
        <div class="book-rating">
                
                <div class="row lead">
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" OnClick="bookRating">
                    <div id="stars" class="starrr" data-rating='<%# Eval("MedieNote") %>'></div>
                    </asp:LinkButton>
	            </div>
            </div>
    </div>
    <div class="book-description">
        <asp:Label ID="Label4" runat="server" Text='<%# Bind("Text_Descriere") %>'></asp:Label>
    </div>
    

    
    </ItemTemplate>
    </asp:Repeater>

    
          <h3>Comentarii:</h3>

          <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
             DataSourceID="SqlDataSource2" Width="100%" 
              ShowHeader="False" GridLines="None">

              <Columns>
                  <asp:TemplateField  ItemStyle-Width="100%">
                        <ItemTemplate>
    <asp:Table ID="Table1" runat="server" CssClass="comentarii">
         
            <asp:TableRow ID="TableRow1" runat="server" Width="100%">
                <asp:TableCell ID="TableCell1" runat="server" rowspan="3" Width="10%"  style="vertical-align: top;">
                <div class="userIcon">
                    <asp:Image ID="Image3" runat="server" ImageUrl="~/usericon.png" />
                </div>
                </asp:TableCell>
                 <asp:TableCell ID="TableCell2" runat="server" Width="90%">
                    Postat de <i><%#Eval("UserName")%></i> la <i><%#Eval("Data")%></i>:
                 </asp:TableCell>
                </asp:TableRow>

                <asp:TableRow ID="TableRow33" runat="server" Width="100%">
                 <asp:TableCell ID="TableCell3" runat="server" Width="90%">
                    <span class="comentariu"><%#Eval("Comentariu_Text")%>
                 </asp:TableCell>
                 </asp:TableRow>
                
                 <asp:TableRow ID="TableRow3" runat="server">
                 <asp:TableCell ID="TableCell5" runat="server">
                 <asp:LoginView ID="LoginView2" runat="server">
                 <RoleGroups>
    <asp:RoleGroup Roles="Admin">
    <ContentTemplate>
                  
                  
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "~/DeleteComm.aspx?q=" + Eval("Id") %>'>Sterge</asp:HyperLink>
    </ContentTemplate>
    </asp:RoleGroup>
    </RoleGroups>
    </asp:LoginView>
    </asp:TableCell>
                 </asp:TableRow>
    
                 </asp:Table>
                        </ItemTemplate>

                    </asp:TemplateField>
                    </Columns>
              <EmptyDataTemplate>
                  <asp:Label ID="Label14" runat="server" Text="0 comentarii"></asp:Label>
              </EmptyDataTemplate>
              </asp:GridView>
          

         <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ASPNETDB %>"></asp:SqlDataSource>
          

         <asp:Label ID="Label13" runat="server" Text="Adaugati un comentariu:" 
             Font-Size="Large" Font-Bold="True"></asp:Label><br />
                
        <asp:LoginView ID="LoginView1" runat="server">
        <AnonymousTemplate>
                
                <asp:Label ID="Label13" runat="server" Text="Trebuie sa va logati pentru a putea comenta" 
             Font-Size="Medium"></asp:Label><br />

        </AnonymousTemplate>
        <LoggedInTemplate>
         
         <asp:Table ID="Table1" runat="server" style="margin: 10px;">
         
            <asp:TableRow ID="TableRow1" runat="server" Width="100%">
                <asp:TableCell ID="TableCell1" runat="server" rowspan="2" Width="10%"  style="vertical-align: top;">
                <div class="userIcon">
                    <asp:Image ID="Image2" runat="server" ImageUrl="~/usericon.png" />
                </div>
                </asp:TableCell>
                 <asp:TableCell ID="TableCell2" runat="server" Width="90%">
                    
                     <asp:TextBox id="TBComentariu" TextMode="MultiLine" Rows="3" Columns="200" style="resize:none;" runat="server" CssClass="form-control input-lg" />
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="" ControlToValidate="TBComentariu"></asp:RequiredFieldValidator>                
                    </asp:TableCell></asp:TableRow><asp:TableRow ID="TableRow2" runat="server">
                <asp:TableCell>
                    <asp:Button ID="Button1" runat="server" Text="Posteaza" OnClientClick="adaugareComm()" OnClick="post_comment" CssClass="ButtonPostComment" />
                
                </asp:TableCell></asp:TableRow></asp:Table></LoggedInTemplate></asp:LoginView>
                
                
    </div>
</asp:Content>