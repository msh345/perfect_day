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
//= require foundation
//= require typeahead.min
//= require_tree .

var your_location;

$(document).on("ready", function() {
  kickOff();
  getLocation();
  typeahead();
});

function kickOff() {

  if($(".search-results").length > 0 ) {
    directionsService = new google.maps.DirectionsService();
    maps = [];
    mapSearchResults();
  }

  if($(".itineraries").length > 0 ) {
    directionsService = new google.maps.DirectionsService();
    maps = [];
    generateItinerary();
  }

  if($('#create_itinerary_form').length > 0) {
    AddNewSpotForm();
    CreateSpot();
    initialize();
  }
}

function getLocation() {
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(showPosition);
  }
}

function showPosition(position) {
  your_location = [parseFloat(position.coords.latitude), parseFloat(position.coords.longitude)];
  var data = {position: your_location}
  $.post('/find_location', data)
}
