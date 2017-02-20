# Single Sign-On Spike

* Authentication Server: it is a web api that provides tokens.
* WebApi provides a set of business features in a secured way (api calls should include a token).
* ClienApp: is a html app (no server-side relevant code) that consumes the WebApi.
* ClassicWebsite: is a tradicinal ASP.NET application that also hosts an html application. This html app consumes the WebApi.


Notes:
* In a real scenario everything should run under https