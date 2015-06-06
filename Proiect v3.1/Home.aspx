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

        var inputString = $(".object").val();

        var object = JSON.parse(inputString);
        $('#tagCloud').jQCloud(object, {
            colors: ["#413E4A", "#81B3B1"],
            autoResize: true
        });


    });
</script>


</asp:Content>

