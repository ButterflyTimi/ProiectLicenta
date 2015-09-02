<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="tagCloud-wrapper">
    <div class="col-xs-12">
        <h2>Nu stii ce sa mai cauti? Te ajutam noi!</h2>
    </div>
    <div id="tagCloud">



    </div>
</div>

<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ASPNETDB %>">
    </asp:SqlDataSource>

<div class="home-recommendation-wrapper">
    <div class="col-xs-12">
        <h3 ID="recom" runat="server">Recomandate pentru tine</h3>
        <h3 ID="popular" runat="server">Topul celor mai bine cotate carti</h3>
    

     <div id="liquid" class="liquid">
	    <span class="previous"></span>
	        <div class="wrapper">
		        <ul>
                    <asp:Repeater ID="Repeater3" runat="server"  DataSourceID="SqlDataSource1">
                        <ItemTemplate>
			                <li>
                                <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# "~/IndividualBookPage.aspx?q=" + Eval("CartiId") %>'>
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


<asp:TextBox ID="TBObject" runat="server" CssClass="object"></asp:TextBox>
<script type="text/javascript">
    $(document).ready(function () {

        var inputString = $(".object").val();

        var object = JSON.parse(inputString);
        $('#tagCloud').jQCloud(object, {
            autoResize: true
        });

        $('#liquid').liquidcarousel({
            height: 350, 	//the height of the list
            duration: 600,
            hidearrows: true	//hide arrows if all of the list items are visible
        });

    });
</script>

</asp:Content>

