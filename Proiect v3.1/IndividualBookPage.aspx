﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="IndividualBookPage.aspx.cs" Inherits="IndividualBookPage" %>

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
                <asp:Label ID="Label1" runat="server" Text='<%# Bind("CartiTitlu") %>' CssClass="title"></asp:Label>
                de 
                <asp:Label ID="Label3" runat="server" Text='<%# Eval("NumeAutor") %>' CssClass="name"></asp:Label>
    
                <div class="book-gen">
                    <asp:Label ID="Label6" runat="server" Text="Gen: " CssClass="bookType gen"></asp:Label>
                    <asp:Label ID="Gen" runat="server" CssClass="bookType" Text='<%# Bind("Gen") %>'></asp:Label>
                </div>
                <div class="book-rating">
                    <div class="lead">
                        <asp:LinkButton ID="LinkButton1" CssClass="starRating" runat="server" CausesValidation="False" OnClick="bookRating">
                            <div id="stars" class="starrr" data-rating='<%# Eval("MedieNote") %>'></div>
                        </asp:LinkButton>

                        <div class="error-messages">
                            <asp:Label ID="NotLoggedInUser" runat="server" style="display: none;" Text="Trebuie sa fiti autentificat pentru a putea vota!"></asp:Label>    
                            <asp:Label ID="AlreadyVoted" runat="server" style="display: none;" Text="Deja ati votat aceasta carte!"></asp:Label>
                        </div>
	                </div>
                </div>
                <div class="book-description-wrapper">
                    <div class="book-description">
                        <asp:Label ID="Label4" CssClass="description" runat="server" Text='<%# Bind("Text_Descriere") %>'></asp:Label>
                    </div>
                </div>
            </div>
        </ItemTemplate>
    </asp:Repeater>
    </div>
    
    <div class="commentsSection-wrapper">
        <div class="commentsSection">
            <h3>Comentarii si recenzii:</h3>

            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ASPNETDB %>"></asp:SqlDataSource>
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" Width="100%" 
            ShowHeader="False" GridLines="None">

            <Columns>
                <asp:TemplateField  ItemStyle-Width="100%">
                    <ItemTemplate>
                        <div class="comment-wrapper">
                            <div class="userIcon">
                                <asp:Image ID="Image3" runat="server" ImageUrl='<%# "~/pozeUseri/" + ProcessImageUser(Eval("Poza_User")) %>' />
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
            </asp:TemplateField>
        </Columns>
        <EmptyDataTemplate>
            <asp:Label ID="Label14" runat="server" Text="0 comentarii"></asp:Label>
        </EmptyDataTemplate>
    </asp:GridView>

    </div>
</div>

<div class="userIcon">
                        <asp:Image ID="ImgUserPicture" runat="server" ImageUrl="~/pozeUseri/DefaultUserIcon.png" />
                    </div>

<div class="commentsInput-wrapper">
    <div class="commentsInput">

        <asp:LoginView ID="LoginView1" runat="server">
            <AnonymousTemplate>
                Pentru a scrie un comentariu trebuie sa fii autentificat. Click 
                <asp:Label ID="loginButton" runat="server" Text="aici" CssClass="" data-toggle="modal" data-target="#loginModal"></asp:Label>
                pentru a te autentifica.
            </AnonymousTemplate>

            <LoggedInTemplate>
         
                <div class="commentsInput-row">
                    <div class="userIcon">
                        <asp:Image ID="ImgUserPicture2" runat="server" ImageUrl="~/pozeUseri/DefaultUserIcon.png" />
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
            <div class="jcarousel">
                <ul>
                    <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource3">
                        <ItemTemplate>
                            <li class="jcarousel-item">
                                <asp:Image ID="Image1" runat="server" ImageUrl='<%# "~/pozeCoperti/" + Eval("Poza_Coperta") %>' />
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("CartiTitlu") %>' CssClass="title"></asp:Label>
                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("NumeAutor") %>' CssClass="name"></asp:Label>

                            </li>
                        </ItemTemplate>
                    </asp:Repeater>
                </ul>
            </div>
            <a href="#" class="jcarousel-control-prev" data-jcarouselcontrol="true">‹</a>
            <a href="#" class="jcarousel-control-next" data-jcarouselcontrol="true">›</a>
            <p class="jcarousel-pagination"></p>
        </div>
    </div>

    <script type="text/javascript">
        (function ($) {
            $(function () {
                var jcarousel = $('.jcarousel');

                jcarousel.on('jcarousel:reload jcarousel:create', function () {
                    var carousel = $(this),
                        width = carousel.innerWidth();

                if (width >= 600) {
                    width = width / 5;
                } else if (width >= 350) {
                    width = width / 2;
                }

                carousel.jcarousel('items').css('width', Math.ceil(width) + 'px');
            })
            .jcarousel({
                wrap: 'circular',
                items: '.jcarousel-item',
                transitions: true

            });

                $('.jcarousel-control-prev')
            .jcarouselControl({
                target: '-=1'
            });

                $('.jcarousel-control-next')
            .jcarouselControl({
                target: '+=1'
            });

                $('.jcarousel-pagination')
            .on('jcarouselpagination:active', 'a', function () {
                $(this).addClass('active');
            })
            .on('jcarouselpagination:inactive', 'a', function () {
                $(this).removeClass('active');
            })
            .on('click', function (e) {
                e.preventDefault();
            })
            .jcarouselPagination({
                perPage: 1,
                item: function (page) {
                    return '<a href="#' + page + '">' + page + '</a>';
                }
            });
            });
        })(jQuery);
    </script>
</asp:Content>