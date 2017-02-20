# Single Sign-On Spike

* AuthenticationServer (http://localhost:49949/): it is a web api that provides tokens.
* WebApi (http://localhost:49949/): provides a set of business features in a secured way (api calls should include a token).
* ClienApp (http://localhost:49567/): is a html app (no server-side relevant code) that consumes the WebApi.
* ClassicWebsite (http://localhost:49460/): is a tradicinal ASP.NET application that also hosts an html application. This html app consumes the WebApi.


Notes:
* In a real scenario everything should run under https
* Token signing is based on symmetric key that is generated based on AudienceSecret parameter