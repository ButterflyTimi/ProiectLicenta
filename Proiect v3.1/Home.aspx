<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="col-sm-2" style="margin-bottom: 50px;">
<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ASPNETDB %>" 
        SelectCommand="SELECT Gen FROM Genuri">
        </asp:SqlDataSource>

<asp:DataList id="datalist1" runat="server" DataSourceID="SqlDataSource2">

<HeaderTemplate>
<h3>Genuri:</h3>
</HeaderTemplate>

<ItemTemplate>
<asp:HyperLink ID="HyperLink4" runat="server"  Font-Underline="false" NavigateUrl='<%# "~/Search.aspx?q=" + Eval("Gen") %>' ForeColor="Gray">
    <asp:Label ID="Label10" runat="server" CssClass="categorii" Text='<%# Eval("Gen") %>'></asp:Label>
</asp:HyperLink>                 
</ItemTemplate>
</asp:DataList>

<asp:SqlDataSource ID="SqlDataSource3" runat="server"  ConnectionString="<%$ ConnectionStrings:ASPNETDB %>" 
        SelectCommand="SELECT Prenume + ' ' + Nume AS NumeAutor FROM Autori">
        </asp:SqlDataSource>
<asp:DataList id="datalist2" runat="server" DataSourceID="SqlDataSource3">

<HeaderTemplate>
<h3>Autori:</h3>
</HeaderTemplate>

<ItemTemplate>
<asp:HyperLink ID="HyperLink4" runat="server"  Font-Underline="false" NavigateUrl='<%# "~/Search.aspx?q=" + Eval("NumeAutor") %>' ForeColor="Gray">
    <asp:Label ID="Label10" runat="server" CssClass="categorii" Text='<%# Eval("NumeAutor") %>'></asp:Label>
</asp:HyperLink>                 
</ItemTemplate>
</asp:DataList>

</div>

    <div class="col-sm-10" style="margin-bottom: 50px;">
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ASPNETDB %>" 
        SelectCommand="SELECT Carti.Id AS CartiId, Carti.Titlu AS CartiTitlu, Carti.Isbn, Carti.Poza_Coperta, Genuri.Gen, Edituri.Nume_Editura, Autori.Prenume + ' ' + Autori.Nume AS NumeAutor FROM Autori INNER JOIN Genuri INNER JOIN Carti ON Genuri.Id = Carti.Id_Gen INNER JOIN Edituri ON Carti.Id_Editura = Edituri.Id ON Autori.Id = Carti.Id_Autor">
        </asp:SqlDataSource>

        <asp:LoginView ID="LoginView1" runat="server">
            <AnonymousTemplate>

                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                DataSourceID="SqlDataSource1" AllowPaging="True" Width="100%" 
                ShowHeader="False" GridLines="Horizontal" AllowSorting="True" PageSize="5" 
                BorderColor="White" BorderStyle="Dotted" BorderWidth="2px">
                <Columns>
                    <asp:TemplateField  ItemStyle-Width="20%">
                        <ItemTemplate>
                            <asp:HyperLink runat="server" NavigateUrl='<%# "~/IndividualBookPage.aspx?q=" + Eval("CartiId") %>'>
                                <asp:Image CssClass="imaginiCoperti" ID="Image1" runat="server" ImageUrl='<%# "~/pozeCoperti/" + Eval("Poza_Coperta") %>' />
                            </asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField SortExpression="CartiTitlu"  ItemStyle-Width="40%">
                        <ItemTemplate>
                            <asp:HyperLink ID="HyperLink2" runat="server" Font-Underline="false" NavigateUrl='<%# "~/IndividualBookPage.aspx?q=" + Eval("CartiId") %>' ForeColor="Black" CssClass="titluCarte">
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("CartiTitlu") %>' Font-Bold="True" Font-Italic="True" Font-Size="XX-Large"></asp:Label>
                            </asp:HyperLink>
                            <br />
                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("NumeAutor") %>' Font-Italic="True" Font-Size="Large"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                  
                    <asp:TemplateField ItemStyle-Height="20%">
                        <ItemTemplate>
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
              </Columns>
              <PagerStyle ForeColor="#706664" HorizontalAlign="Center" Font-Size="Larger" Font-Bold="True" />
              <HeaderStyle Wrap="False" />
              </asp:GridView>
         </AnonymousTemplate>

            <RoleGroups>
                <asp:RoleGroup Roles="Admin">
                    <ContentTemplate>
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/InsertDatas.aspx" CssClass="insertDataLink">Adauga date</asp:HyperLink>


                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                        DataSourceID="SqlDataSource1" AllowPaging="True" Width="100%" 
                        ShowHeader="False" GridLines="Horizontal" AllowSorting="True" PageSize="5"
                        BorderColor="White" BorderStyle="Dotted" BorderWidth="2px">
                        <Columns>
                            <asp:TemplateField  ItemStyle-Width="20%">
                                <ItemTemplate>
                                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "~/IndividualBookPage.aspx?q=" + Eval("CartiId") %>'>
                                        <asp:Image CssClass="imaginiCoperti" ID="Image1" runat="server" ImageUrl='<%# "~/pozeCoperti/" + Eval("Poza_Coperta") %>' />
                                    </asp:HyperLink>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField SortExpression="CartiTitlu" ItemStyle-Width="40%">
                                <ItemTemplate>
                                    <asp:HyperLink ID="HyperLink2" runat="server" Font-Underline="false" NavigateUrl='<%# "~/IndividualBookPage.aspx?q=" + Eval("CartiId") %>' ForeColor="Black" CssClass="titluCarte">
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("CartiTitlu") %>' Font-Bold="True" Font-Italic="True" Font-Size="XX-Large"></asp:Label>
                                    </asp:HyperLink>
                                    <br />
                                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("NumeAutor") %>' Font-Italic="True" Font-Size="Large"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                  
                            <asp:TemplateField ItemStyle-Height="20%">
                                <ItemTemplate>
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

                            <asp:HyperLinkField DataNavigateUrlFields="CartiId" DataNavigateUrlFormatString="~/EditBooks.aspx?id={0}" Text="Modifica" ItemStyle-Width="10%" />       
                            <asp:HyperLinkField DataNavigateUrlFields="CartiId" DataNavigateUrlFormatString="~/Delete.aspx?id={0}" Text="Sterge" ItemStyle-Width="10%" />

                        </Columns>
                        <PagerStyle ForeColor="#706664" HorizontalAlign="Center" Font-Size="Larger" Font-Bold="True" />
                        <HeaderStyle Wrap="False" />
                        </asp:GridView>
                    </ContentTemplate>
                </asp:RoleGroup>
                <asp:RoleGroup Roles="User">
                    <ContentTemplate>

                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                DataSourceID="SqlDataSource1" AllowPaging="True" Width="100%" 
                ShowHeader="False" GridLines="Horizontal" AllowSorting="True" PageSize="5" 
                BorderColor="White" BorderStyle="Dotted" BorderWidth="2px">
                <Columns>
                    <asp:TemplateField  ItemStyle-Width="20%">
                        <ItemTemplate>
                            <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl='<%# "~/IndividualBookPage.aspx?q=" + Eval("CartiId") %>'>
                                <asp:Image CssClass="imaginiCoperti" ID="Image1" runat="server" ImageUrl='<%# "~/pozeCoperti/" + Eval("Poza_Coperta") %>' />
                            </asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField SortExpression="CartiTitlu"  ItemStyle-Width="40%">
                        <ItemTemplate>
                            <asp:HyperLink ID="HyperLink2" runat="server" Font-Underline="false" NavigateUrl='<%# "~/IndividualBookPage.aspx?q=" + Eval("CartiId") %>' ForeColor="Black" CssClass="titluCarte">
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("CartiTitlu") %>' Font-Bold="True" Font-Italic="True" Font-Size="XX-Large"></asp:Label>
                            </asp:HyperLink>
                            <br />
                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("NumeAutor") %>' Font-Italic="True" Font-Size="Large"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                  
                    <asp:TemplateField ItemStyle-Height="20%">
                        <ItemTemplate>
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
              </Columns>
              <PagerStyle ForeColor="#706664" HorizontalAlign="Center" Font-Size="Larger" Font-Bold="True" />
              <HeaderStyle Wrap="False" />
              </asp:GridView>

                    </ContentTemplate>
                </asp:RoleGroup>
            </RoleGroups>
        </asp:LoginView>
</div>
</asp:Content>

