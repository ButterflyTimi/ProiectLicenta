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
                <asp:Label ID="Label1" runat="server" Text='<%# Bind("CartiTitlu") %>' CssClass="title"></asp:Label>
                de 
                <asp:Label ID="Label3" runat="server" Text='<%# Eval("NumeAutor") %>' CssClass="name"></asp:Label>
    
                <div class="book-gen">
                    <asp:Label ID="Label6" runat="server" Text="Gen: " CssClass="bookType"></asp:Label>
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
            <h4>Comentarii si recenzii:</h4>

            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ASPNETDB %>"></asp:SqlDataSource>
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" Width="100%" 
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
                                                    <asp:HyperLink ID="HyperLink1" runat="server" 
                                                    NavigateUrl='<%# "~/DeleteComm.aspx?q=" + Eval("Id") %>'>Sterge</asp:HyperLink>
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

        </div>
    </div>
          

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