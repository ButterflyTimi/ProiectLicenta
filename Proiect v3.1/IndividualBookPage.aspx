<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="IndividualBookPage.aspx.cs" Inherits="IndividualBookPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="col-sm-12" style="margin-bottom: 50px; padding-bottom: 20px;">
        
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BazaDate %>">
        </asp:SqlDataSource>

                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
              DataSourceID="SqlDataSource1" Width="100%" 
              ShowHeader="False" GridLines="Horizontal" PageSize="5" 
              BorderColor="White" BorderStyle="Dotted" BorderWidth="2px">
              <Columns>
                  <asp:TemplateField  ItemStyle-Width="25%">
                        <ItemTemplate>
                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "~/IndividualBookPage.aspx?q=" + Eval("CartiId") %>'>
                                <asp:Image ID="Image1" runat="server" CssClass="imaginiCoperti" ImageUrl='<%# "~/pozeCoperti/" + Eval("Poza_Coperta") %>' />
                            </asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateField>

                  <asp:TemplateField ItemStyle-Width="40%">
                      <ItemTemplate>
                      <asp:HyperLink ID="HyperLink2" runat="server" Font-Underline="false" NavigateUrl='<%# "~/IndividualBookPage.aspx?q=" + Eval("CartiId") %>' ForeColor="Black" CssClass="titluCarte">
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("CartiTitlu") %>' Font-Bold="True" Font-Italic="True" Font-Size="XX-Large"></asp:Label>
                         </asp:HyperLink> 
                          <br />
                          <asp:Label ID="Label3" runat="server" Text='<%# Eval("NumeAutor") %>' Font-Italic="True" Font-Size="Large"></asp:Label>
                          <br />
                          <asp:Label ID="Label6" runat="server" Text="Gen: " CssClass="labeluriCarti"></asp:Label>
                          <asp:Label ID="Label2" runat="server" Text='<%# Bind("Gen") %>'></asp:Label>
                          <br />
                          <asp:Label ID="Label7" runat="server" Text="Editura: " CssClass="labeluriCarti"></asp:Label>
                          <asp:Label ID="Label4" runat="server" Text='<%# Bind("Nume_Editura") %>'></asp:Label>
                          <br />
                          <asp:Label ID="Label8" runat="server" Text="ISBN: " CssClass="labeluriCarti"></asp:Label>
                          <asp:Label ID="Label5" runat="server" Text='<%# Bind("Isbn") %>'></asp:Label>

                      </ItemTemplate>
                  </asp:TemplateField>
                    
                  <asp:TemplateField ItemStyle-Width="35%">
                      <ItemTemplate>
                      <div class="textDescriereCarte">
                          <asp:Label ID="Label5" runat="server" Text='<%# Bind("Text_Descriere") %>'></asp:Label>
                      </div>
                      </ItemTemplate>
                  </asp:TemplateField>


              </Columns>
              <PagerStyle ForeColor="#706664" HorizontalAlign="Center" Font-Size="Larger" Font-Bold="True" />
              <HeaderStyle Wrap="False" />
              <EmptyDataTemplate>
                  <asp:Label ID="Label9" runat="server" Text="0 rezultate"></asp:Label>
              </EmptyDataTemplate>
          </asp:GridView>
          

         <asp:Label ID="Label13" runat="server" Text="Introduceti un comentariu:" 
             Font-Size="Large" Font-Bold="True"></asp:Label><br />

         <asp:Table ID="Table1" runat="server" style="margin: 10px;">
         
            <asp:TableRow ID="TableRow1" runat="server" Width="100%">
                <asp:TableCell ID="TableCell1" runat="server" rowspan="2" Width="10%"  style="vertical-align: top;">
                <div class="userIcon">
                    <asp:Image ID="Image2" runat="server" ImageUrl="~/usericon.png" />
                </div>
                </asp:TableCell>
                 <asp:TableCell ID="TableCell2" runat="server" Width="90%">
                    <asp:TextBox id="TextBox1" TextMode="MultiLine" Rows="3" Columns="200" style="resize:none;" runat="server" CssClass="form-control input-lg" />
                 </asp:TableCell>
                 </asp:TableRow>
                 <asp:TableRow ID="TableRow2" runat="server">
                <asp:TableCell>
                    <asp:Button ID="Button1" runat="server" Text="Posteaza" OnClick="post_comment" CssClass="ButtonPostComment" />
                
                </asp:TableCell></asp:TableRow></asp:Table><!--
            </AnonymousTemplate>
            <RoleGroups>
                <asp:RoleGroup Roles="Admin">
                    <ContentTemplate>
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/InsertDatas.aspx" CssClass="insertDataLink">Adauga date</asp:HyperLink>



                    </ContentTemplate>
                </asp:RoleGroup>
                <asp:RoleGroup Roles="User">
                    <ContentTemplate>



                    </ContentTemplate>
                </asp:RoleGroup>
            </RoleGroups>
        </asp:LoginView>-->
        
        <asp:Label ID="ErrorLabel" runat="server"></asp:Label>
    </div>
</asp:Content>