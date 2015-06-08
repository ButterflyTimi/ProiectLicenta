<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="UserProfile.aspx.cs" Inherits="UserProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div class="userProfile-wrapper">
        <div class="userProfile-personalDatas">
            <div class="userProfile-picture-wrapper">
                <div class="userProfile-picture">

                    <asp:Image CssClass="imgUser" ID="UserImage" runat="server" />
                    <button class="btn primary-button changePicture">Schimba poza</button>
                    <asp:FileUpload ID="UserProfilePicture" runat="server" ClientIDMode="Static" onchange="this.form.submit()"  CssClass="actualChangePictureButton" />
                </div>
            </div>

            <div class="userProfile-datas-wrapper">
                <div class="userProfile-datas">
                    <div class="form-group">
                        <label>Nume utilizator:</label>
                        <asp:TextBox ID="Username" runat="server" CssClass="form-control"></asp:TextBox>  
                    </div>
                    <div class="form-group">
                        <label>Email:</label>
                        <asp:TextBox ID="Email" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <asp:Button ID="Button1" runat="server" Text="Actualizeaza datele" CssClass="btn primary-button" OnClick="submit_userInformation"/>
                    <asp:Label ID="changePassword" runat="server" Text="Schimba parola" CssClass="link" data-toggle="modal" data-target="#changePass"></asp:Label>
                </div>
            </div>
        </div>
        <div class="userProfile-books">

        <div class="categories-wrapper">

            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ASPNETDB %>">
            </asp:SqlDataSource>
            <div class="favourites">
                <h3>Carti favorite</h3>
                <div class="jcarousel">
                    <ul>
                        <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource3">
                            <ItemTemplate>
                                <li class="jcarousel-item">
                                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "~/IndividualBookPage.aspx?q=" + Eval("CartiId") %>'>
                                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# "~/pozeCoperti/" + Eval("Poza_Coperta") %>' />
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("CartiTitlu") %>' CssClass="title"></asp:Label>
                                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("NumeAutor") %>' CssClass="name"></asp:Label>
                                    </asp:HyperLink>
                                </li>
                            </ItemTemplate>
                            <FooterTemplate>
                                 <asp:Label ID="Label3"  CssClass="noResultsMessage" Visible='<%# Repeater2.Items.Count == 0 %>' runat="server" Text="Nu aveti carti in aceasta categorie"></asp:Label>
                            </FooterTemplate>
                        </asp:Repeater>
                    </ul>
                </div>
                <a href="#" class="jcarousel-control-prev" data-jcarouselcontrol="true"><i class="fa fa-chevron-left"></i></a>
                <a href="#" class="jcarousel-control-next" data-jcarouselcontrol="true"><i class="fa fa-chevron-right"></i></a>
        
            </div>

            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ASPNETDB %>">
            </asp:SqlDataSource>
            <div class="deCitit">
                <h3>Carti de citit</h3>
                <div class="jcarousel">
                    <ul>
                        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource4">
                            <ItemTemplate>
                                <li class="jcarousel-item">
                                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "~/IndividualBookPage.aspx?q=" + Eval("CartiId") %>'>
                                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# "~/pozeCoperti/" + Eval("Poza_Coperta") %>' />
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("CartiTitlu") %>' CssClass="title"></asp:Label>
                                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("NumeAutor") %>' CssClass="name"></asp:Label>
                                    </asp:HyperLink>
                                </li>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:Label ID="Label3"  CssClass="noResultsMessage" Visible='<%# Repeater1.Items.Count == 0 %>' runat="server" Text="Nu aveti carti in aceasta categorie"></asp:Label>
                            </FooterTemplate>
                        </asp:Repeater>
                    </ul>
                </div>
                <a href="#" class="jcarousel-control-prev" data-jcarouselcontrol="true"><i class="fa fa-chevron-left"></i></a>
                <a href="#" class="jcarousel-control-next" data-jcarouselcontrol="true"><i class="fa fa-chevron-right"></i></a>
        
            </div>

            <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ASPNETDB %>">
            </asp:SqlDataSource>
            <div class="citite">
                <h3>Carti citite</h3>
                <div class="jcarousel">
                    <ul>
                        <asp:Repeater ID="Repeater3" runat="server" DataSourceID="SqlDataSource5">
                            <ItemTemplate>
                                <li class="jcarousel-item">
                                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "~/IndividualBookPage.aspx?q=" + Eval("CartiId") %>'>
                                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# "~/pozeCoperti/" + Eval("Poza_Coperta") %>' />
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("CartiTitlu") %>' CssClass="title"></asp:Label>
                                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("NumeAutor") %>' CssClass="name"></asp:Label>
                                    </asp:HyperLink>
                                </li>
                            </ItemTemplate>
                            <FooterTemplate>
                                 <asp:Label ID="Label3"  CssClass="noResultsMessage" Visible='<%# Repeater3.Items.Count == 0 %>' runat="server" Text="Nu aveti carti in aceasta categorie"></asp:Label>
                            </FooterTemplate>
                        </asp:Repeater>
                    </ul>
                </div>
                <a href="#" class="jcarousel-control-prev" data-jcarouselcontrol="true"><i class="fa fa-chevron-left"></i></a>
                <a href="#" class="jcarousel-control-next" data-jcarouselcontrol="true"><i class="fa fa-chevron-right"></i></a>
        
            </div>
        </div>
    </div>

</div>
            <div class="modal fade" id="changePass">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h3 class="modal-title">
                                <i class="fa fa-key"></i>
                                Schimba parola
                            </h3>
                        </div>
                        <div class="modal-body">
                              
                            <asp:ScriptManager ID="ScriptManager2" runat="server"></asp:ScriptManager>
                                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                    <ContentTemplate>
                                        <asp:ChangePassword ID="ChangePassword1" runat="server">
                                        </asp:ChangePassword>
                                 
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                    </div>
                 </div>
            </div>
 

 <script type="text/javascript">
     (function ($) {

         if ($('.favourites ul li').length == 0) {
             $('.favourites .fa-chevron-left').hide();
             $('.favourites .fa-chevron-right').hide();
         }

         if ($('.deCitit ul li').length == 0) {
             $('.deCitit .fa-chevron-left').hide();
             $('.deCitit .fa-chevron-right').hide();
         }

         if ($('.citite ul li').length == 0) {
             $('.citite .fa-chevron-left').hide();
             $('.citite .fa-chevron-right').hide();
         }

         $(function () {
             var jcarousel = $('.jcarousel');

             jcarousel.on('jcarousel:reload jcarousel:create', function () {
                 var carousel = $(this),
                        width = carousel.innerWidth();

                 if (width >= 600) {
                     width = width / 4;
                 } else if (width >= 350) {
                     width = width / 2;
                 }

                 carousel.jcarousel('items').css('width', Math.ceil(width) + 'px');
             })
            .jcarousel({
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

