$(document).bind("fb.loaded", function() {
  FB.getLoginStatus(function(response) {

    console.log('FB STATUS: ' + response.status);
    if(response.status == "connected") {

      console.log("FB AUTHED");

      location.href =
        '/auth/facebook/callback?' +
        $.param({ signed_request: response.authResponse.signedRequest })
    

    }
  });
});