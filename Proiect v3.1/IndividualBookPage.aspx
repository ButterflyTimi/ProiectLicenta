﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="IndividualBookPage.aspx.cs" Inherits="IndividualBookPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ASPNETDB %>">
    </asp:SqlDataSource>

    <asp:LoginView id="LoginView2" runat="server">
        <RoleGroups>
            <asp:RoleGroup Roles="Admin">
                <ContentTemplate>
                    <div class="adminBookPanel">
                        <div id="editBook">
                            <asp:LinkButton ID="EditBook" runat="server" CssClass="editBook" Text="" onclick="Edit_Book" ValidationGroup="separat"/>
                        </div>
                        
                        <div id="deleteBook">
                            <asp:LinkButton ID="Button2" runat="server" CssClass="deleteBook" Text="" onclick="Delete_Book" ValidationGroup="separat"/>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:RoleGroup>
        </RoleGroups>
    </asp:LoginView>

     <div class="detail-book-wrapper">
        <asp:TextBox ID="TBcount" CssClass="count" runat="server">0</asp:TextBox>

        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
        <ItemTemplate>
            <div class="book-picture">
                <asp:Image CssClass="imaginiCoperti" ID="Image1" runat="server" ImageUrl='<%# "~/pozeCoperti/" + Eval("Poza_Coperta") %>' />
            
                <div class="user-buttons">
                    <div class="favorite">         
                        <asp:LinkButton ID="FavouriteLink" CssClass="star" runat="server" CausesValidation="False" OnClick="userFavourite">
                        </asp:LinkButton>
                    </div>
                    <div class="citite-decitit">
                        <asp:DropDownList ID="SelectList" runat="server" AutoPostBack="true" OnSelectedIndexChanged="selectChanged">
                            <Items>
                               <asp:ListItem Text="Adauga la:" Value="" />
                               <asp:ListItem Text="Citite" Value="citite" />
                               <asp:ListItem Text="De citit" Value="decitit" />
                           </Items>
                        </asp:DropDownList>
                    </div>
                </div>
            
            </div>

            <div class="book-details">
                <asp:Label ID="Label1" runat="server" Text='<%# Eval("CartiTitlu") %>' CssClass="title"></asp:Label>
                de 
                <asp:HyperLink ID="HyperLink2" runat="server" CssClass="link" NavigateUrl='<%# "~/Search.aspx?q=" + Eval("NumeAutor") %>'>
                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("NumeAutor") %>' CssClass="name"></asp:Label>
                </asp:HyperLink>
    
                <div class="book-gen">
                    <asp:Label ID="Label6" runat="server" Text="Gen: " CssClass="bookType gen"></asp:Label>
                    <asp:HyperLink ID="HyperLink1" runat="server" CssClass="link" NavigateUrl='<%# "~/Search.aspx?q=" + Eval("Gen") %>'>
                        <asp:Label ID="Gen" runat="server" CssClass="bookType" Text='<%# Eval("Gen") %>'></asp:Label>
                    </asp:HyperLink>
                </div>
                <div class="book-rating">
                    <div class="lead">
                        <asp:LinkButton ID="LinkButton1" CssClass="starRating" runat="server" CausesValidation="False" OnClick="bookRating">
                            <div id="stars" class="starrr" data-rating='<%# Eval("MedieNote") %>'></div>
                        </asp:LinkButton>
	                </div>
                </div>
                <div class="book-description-wrapper">
                    <div class="book-description">
                        <asp:Label ID="Label4" CssClass="description" runat="server" Text='<%# Eval("Text_Descriere") %>'></asp:Label>
                    </div>
                </div>
            </div>
        </ItemTemplate>
    </asp:Repeater>
    </div>
    
    <div class="publishings-wrapper">
        <div class="publishings">
            <h3>Edituri unde se poate gasi cartea:</h3>

            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ASPNETDB %>"></asp:SqlDataSource>

            <ul>
            <asp:Repeater ID="Repeater3" runat="server" DataSourceID="SqlDataSource4">
                <ItemTemplate>
                <li>
                    <asp:HyperLink ID="HyperLink1" runat="server" Target="_blank" CssClass="link" NavigateUrl='<%# Eval("Site_Editura") %>'>
                        <asp:Label ID="Gen" runat="server" CssClass="bookType" Text='<%# Eval("Editura") %>'></asp:Label>
                    </asp:HyperLink>
                </li>
                </ItemTemplate>
            </asp:Repeater>
            </ul>
        </div>
    </div>

    <div class="commentsSection-wrapper">
        <div class="commentsSection">
            <h3>Comentarii si recenzii:</h3>

            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ASPNETDB %>"></asp:SqlDataSource>
            
            <asp:Repeater ID="Repeater4" runat="server" DataSourceID="SqlDataSource2">
                <ItemTemplate>
            
                    <div class="comment-wrapper">
                            <div class="userIcon">
                                <div class="userIcon-row">
                                    <div class="userIcon-col">
                                        <asp:Image ID="Image3" runat="server" ImageUrl='<%# "~/pozeUseri/" + ProcessImageUser(Eval("Poza_User")) %>' />
                                    </div>
                                </div>
                            </div>


                            <div class="text-wrapper">
                                <div class="text">
                                    <div class="info">
                                        Postat de <strong><%#Eval("UserName")%></strong> la <strong><%#Eval("Data")%></strong>:
                                    </div>

                                    <div class="comentariu">
                                        <%#Eval("Comentariu_Text")%>
                                    </div>

                                    <asp:LoginView ID="LoginView2" runat="server">
                                        <RoleGroups>
                                            <asp:RoleGroup Roles="Admin">
                                                <ContentTemplate>
                                                    <div class="moderator">
                                                    <asp:HyperLink ID="HyperLink1" runat="server" 
                                                    NavigateUrl='<%# "~/DeleteComm.aspx?q=" + Eval("Id") %>'>Sterge Comentariu</asp:HyperLink>
                                                    </div>
                                                </ContentTemplate>
                                            </asp:RoleGroup>
                                        </RoleGroups>
                                    </asp:LoginView>
                                </div>
                            </div>
                    </div>

                </ItemTemplate>
                <FooterTemplate>
                         <asp:Label ID="Label3"  CssClass="noResultsMessage" Visible='<%# Repeater4.Items.Count == 0 %>' runat="server" Text="0 comentarii"></asp:Label>
                </FooterTemplate>
            </asp:Repeater>

    </div>
</div>

<div class="commentsInput-wrapper">
    <div class="commentsInput">

        <asp:LoginView ID="LoginView1" runat="server">
            <AnonymousTemplate>
                <div class="notLoggedInText">
                Pentru a scrie un comentariu trebuie sa fii autentificat. Click 
                <asp:Label ID="loginButton" runat="server" class="link" Text="aici" CssClass="" data-toggle="modal" data-target="#loginModal"></asp:Label>
                pentru a te autentifica.
                </div>
            </AnonymousTemplate>

            <LoggedInTemplate>
         
                <div class="commentsInput-row">
                    <div class="userIcon">
                        <div class="userIcon-row">
                            <div class="userIcon-col">
                                <asp:Image ID="ImgUserPicture2" runat="server" ImageUrl="~/pozeUseri/DefaultUserIcon.png" />
                            </div>
                        </div>
                    </div>

                    <div class="userInputText">
                        <asp:TextBox id="TBComentariu" TextMode="MultiLine" Rows="4" Columns="200" runat="server" placeHolder="Adauga un comentariu" CssClass="form-control" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="" ControlToValidate="TBComentariu"></asp:RequiredFieldValidator>                
                        <asp:Button ID="Button1" runat="server" Text="Posteaza" OnClientClick="adaugareComm()" OnClick="post_comment" CssClass="btn primary-button" />
                    </div>
                </div>
            </LoggedInTemplate>
        </asp:LoginView>
    </div>
</div>


    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ASPNETDB %>">
    </asp:SqlDataSource>
    <div class="recommendation-wrapper">
        <div class="recommendation">

            <h3>Din aceeasi categorie:</h3>

            <div id="liquid" class="liquid">
	            <span class="previous"></span>
	            <div class="wrapper">
		            <ul>
                        <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource3">
                            <ItemTemplate>
			                    <li>
                                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "~/IndividualBookPage.aspx?q=" + Eval("CartiId") %>'>
                                        <div class="image">
                                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# "~/pozeCoperti/" + Eval("Poza_Coperta") %>' />
                                        </div>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("CartiTitlu") %>' CssClass="title"></asp:Label>
                                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("NumeAutor") %>' CssClass="name"></asp:Label>
                                    </asp:HyperLink>
                                </li>
                            </ItemTemplate>
                        </asp:Repeater>
		            </ul>
	            </div>
	            <span class="next"></span>
            </div>

        </div>
    </div>

    <script type="text/javascript">
        $(document).ready(function () {
            $('#liquid').liquidcarousel({
                height: 350, 	//the height of the list
                duration: 600,	
                hidearrows: true	//hide arrows if all of the list items are visible
            });
        });
    </script>
</asp:Content>