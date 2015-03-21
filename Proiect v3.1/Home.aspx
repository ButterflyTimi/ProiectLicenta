﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="col-md-12">

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ASPNETDB %>" 
        
            SelectCommand="SELECT Carti.Id AS CartiId, Carti.Titlu AS CartiTitlu, Carti.Poza_Coperta, Genuri.Gen, Autori.Prenume + ' ' + Autori.Nume AS NumeAutor, Carti.Text_Descriere FROM Autori INNER JOIN Genuri INNER JOIN Carti ON Genuri.Id = Carti.Id_Gen ON Autori.Id = Carti.Id_Autor ORDER BY CartiId DESC">
        </asp:SqlDataSource>

        <asp:LoginView ID="LoginView1" runat="server">
            <AnonymousTemplate>

                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                DataSourceID="SqlDataSource1" AllowPaging="True" Width="100%" 
                ShowHeader="False" GridLines="None" AllowSorting="True" PageSize="5" 
                BorderStyle="None">
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

                            <asp:TemplateField SortExpression="CartiTitlu" ItemStyle-Width="37%">
                                <ItemTemplate>
                                    <asp:HyperLink ID="HyperLink2" runat="server" Font-Underline="false" NavigateUrl='<%# "~/IndividualBookPage.aspx?q=" + Eval("CartiId") %>' ForeColor="Black" CssClass="titluCarte">
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("CartiTitlu") %>' Font-Bold="True" Font-Italic="True" Font-Size="XX-Large"></asp:Label>
                                    </asp:HyperLink>
                                    <br />
                                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("NumeAutor") %>' Font-Italic="True" Font-Size="Large"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                  
                            <asp:TemplateField ItemStyle-Height="23%">
                                <ItemTemplate>
                                    <asp:Label ID="Label6" runat="server" Text="Gen: " CssClass="labeluriCarti"></asp:Label>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Gen") %>'></asp:Label>
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
                </RoleGroups>
                   <LoggedInTemplate>
              <!--      <ContentTemplate>-->

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
                        </ItemTemplate>
                    </asp:TemplateField>
              </Columns>
              <PagerStyle ForeColor="#706664" HorizontalAlign="Center" Font-Size="Larger" Font-Bold="True" />
              <HeaderStyle Wrap="False" />
              </asp:GridView>

               <!--     </ContentTemplate>
                </asp:RoleGroup>
            </RoleGroups>-->
            </LoggedInTemplate>
        </asp:LoginView>
</div>
</asp:Content>

