<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ClientApp._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>Client App</h1>
        <p class="lead">ASP.NET is a free web framework for building great Web sites and Web applications using HTML, CSS, and JavaScript.</p>
        <p><a href="http://www.asp.net" class="btn btn-primary btn-lg">Learn more &raquo;</a></p>
        <a href="javascript:getToken()" id="btn-gettoken">Get Token</a>
        <input type="text" id="txt-token" />
    </div>

    <div class="row">
        <div class="col-md-4">
            <h2>Getting started</h2>
            <p>
                ASP.NET Web Forms lets you build dynamic websites using a familiar drag-and-drop, event-driven model.
            A design surface and hundreds of controls and components let you rapidly build sophisticated, powerful UI-driven sites with data access.
            </p>
            <p>
                <a class="btn btn-default" href="http://go.microsoft.com/fwlink/?LinkId=301948">Learn more &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Get more libraries</h2>
            <p>
                NuGet is a free Visual Studio extension that makes it easy to add, remove, and update libraries and tools in Visual Studio projects.
            </p>
            <p>
                <a class="btn btn-default" href="http://go.microsoft.com/fwlink/?LinkId=301949">Learn more &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Web Hosting</h2>
            <p>
                You can easily find a web hosting company that offers the right mix of features and price for your applications.
            </p>
            <p>
                <a class="btn btn-default" href="http://go.microsoft.com/fwlink/?LinkId=301950">Learn more &raquo;</a>
            </p>
        </div>
    </div>

    <script>

        function getToken() {
            // alert('getting token');
            var xmlHttp = new XMLHttpRequest();
            xmlHttp.open("POST", "http://localhost:49790/oauth/token", false); // false for synchronous request
            xmlHttp.send("grant_type=password&username=juan&password=juan");
            var stringToken = xmlHttp.responseText;
            var token = JSON.parse(stringToken);
            var tokenValue = token.access_token;
            $('#txt-token').val(tokenValue);

            var xmlHttp2 = new XMLHttpRequest();
            xmlHttp2.open("GET", "http://localhost:49949/api/values", true);
            xmlHttp2.setRequestHeader("Authorization", "Bearer " + tokenValue);
            xmlHttp2.onreadystatechange = function () {
                if (xmlHttp2.readyState == 4) {
                    var result = JSON.parse(xmlHttp2.responseText);
                    alert(result);
                }
            }
            xmlHttp2.send(null);

        }
    </script>
</asp:Content>
