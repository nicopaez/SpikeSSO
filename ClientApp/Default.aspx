<%@ Page Title="ClientApp" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ClientApp._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>Client App</h1>
        <p class="lead">This is a classic AspNet Webforms application that acts as a container for html&js code.</p>
        <p>The only relevant code in this project in the default page. When the users clicks "Call API", 2 actions are triggered:</p>
        <ol>
            <li>The authentication server is called to get the Token. Credentials to get the token are hardcoded</li>
            <li>The WebApi is called with the token previously get</li>
        </ol>

        <table class="table">
            <tr>
                <td><a href="javascript:callApi()" id="btn-gettoken">Call API</a></td>
                <td>Token:<input type="text" id="txt-token" class="form-control" readonly /></td>
                <td>Api Result<input type="text" id="txt-apiresult" class="form-control" readonly /></td>
            </tr>
        </table>

    </div>

  

    <script>

        function callApi() {
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
                    $('#txt-apiresult').val(result);
                }
            }
            xmlHttp2.send(null);
        }
    </script>
</asp:Content>
