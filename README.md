# Single Sign-On Spike

This spike shows how to implement single sign-on experience between a classic asp.net mvc app, and html/js app and webApi app using oauth and jwt. 
The following 4 projects are included in the solution:

* AuthenticationServer (http://localhost:49949/): it is a web api that provides tokens.
* WebApi (http://localhost:49949/): provides a set of business features in a secured way (api calls should include a token).
* Html/js ClienApp (http://localhost:49567/): is a html app (no server-side relevant code) that consumes the WebApi.
* ClassicWebsite (http://localhost:49460/): is a tradicinal ASP.NET application that also hosts an html application. This html app consumes the WebApi.

## Scenario 1: html/js app consuming a webapi using oauth + jwt

This scenario is not relevant for this spike, it is just to show how the WebApi is not coupled with the client app and the app that generates the token.

1. The html/js app is loaded (http://localhost:49567/)
2. The user click on CallApi button
3. The html/js app performs an ajax call to the Authentication Server sending credentials to get a Token
4. Authentication server validates credentials and send the token (in this case validation is just check username==password)
5  The html/js app get the token and call the webapi sending the token in the header of the request
6. The wepApi verifies the token and awswers the request.
7. The html/js app displays the token and the api call result


## Notes:
* In a real scenario everything should run under https
* Token signing is based on symmetric key that is generated based on AudienceSecret parameter