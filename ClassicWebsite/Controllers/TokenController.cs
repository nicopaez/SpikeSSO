using Microsoft.Owin.Security.DataHandler.Encoder;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Threading;
using System.Web.Http;

namespace ClassicWebsite.Controllers
{
    [Authorize]
    public class TokenController : ApiController
    {
        public Token Get()
        {
            string audienceId = ConfigurationManager.AppSettings["as:AudienceId"];

            string symmetricKeyAsBase64 = ConfigurationManager.AppSettings["as:AudienceSecret"];

            var keyByteArray = TextEncodings.Base64Url.Decode(symmetricKeyAsBase64);
            
            var securityKey = new Microsoft.IdentityModel.Tokens.SymmetricSecurityKey(keyByteArray);

            var signingCredentials = new  Microsoft.IdentityModel.Tokens.SigningCredentials(securityKey, SecurityAlgorithms.HmacSha256Signature);

            var issued = DateTimeOffset.Now.ToUniversalTime();// data.Properties.IssuedUtc;

            var expires = DateTimeOffset.Now.AddHours(1).ToUniversalTime();

            var _issuer = ConfigurationManager.AppSettings["as:Issuer"];

            var claims = new List<Claim>();
            claims.Add(new Claim(ClaimTypes.Name, Thread.CurrentPrincipal.Identity.Name));
            // TODO: add here any other claim you need

            var token = new JwtSecurityToken(_issuer, audienceId, claims, issued.UtcDateTime, expires.UtcDateTime, signingCredentials);

            var handler = new JwtSecurityTokenHandler();

            var jwt = handler.WriteToken(token);

            var tokenObject = new Token
            {
                AccessToken = jwt,
                TokenType = "Bearer",
                ExpiresIn = expires.Millisecond
            };

            return tokenObject;
        }
    }

    public class Token
    {
        [JsonProperty(PropertyName = "access_token")]
        public string AccessToken
        {
            get;set;
        }

        [JsonProperty(PropertyName = "token_type")]
        public string TokenType
        {
            get; set;
        }

        [JsonProperty(PropertyName = "expires_in")]
        public int ExpiresIn
        {
            get;
            set;
        }
    }
}