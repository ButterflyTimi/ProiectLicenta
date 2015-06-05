<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div class="tagCloud-wrapper">
    <div id="tagCloud">



    </div>
</div>
<asp:TextBox ID="TBObject" runat="server" CssClass="object"></asp:TextBox>
<script type="text/javascript">
    $(document).ready(function () {

        tagCloudResizeWindow();
        $(window).resize(tagCloudResizeWindow);

    });
    function tagCloudResizeWindow() {
        //$("#tagCloud").empty();

        $('#tagCloud').jQCloud('destroy');
        var words = $(".object").val();

        var array = JSON.parse(words);

        $('#tagCloud').jQCloud(array, {
            colors: ["#413E4A", "#81B3B1"],
        });
        
    }
</script>


</asp:Content>

