// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

// $(function() {

$(document).on("ready", function() {
  kickOff();
  getLocation();
});

function kickOff() {
  console.log("here in kickoff");

  if($(".itineraries").length > 0 ) {
    console.log('Loading itineray maps...')
    directionsService = new google.maps.DirectionsService();
    maps = [];
    generateItinerary();
  }

  if (!($('#create_itinerary_form').length === 0)) {
    console.log("Loading itineray form stuff")
    AddNewSpotForm();
    CreateSpot();
    initialize();
  }

}

function getLocation()
  {
  if (navigator.geolocation)
    {
    navigator.geolocation.getCurrentPosition(showPosition);
    }

  }
function showPosition(position)
  {
    console.log(position)
  }
