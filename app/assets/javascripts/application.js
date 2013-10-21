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
//= require turbolinks
//= require_tree .

// $(function() {
$(document).on("page:load", function() {
  kickOff();
});

$(document).on("ready", function() {
  kickOff();
});

function kickOff() {
  AddNewSpotForm();
  CreateSpot();
  directionsService = new google.maps.DirectionsService();
  maps = [];
  // initialize();

  generateItinerary();
}

  // var i1 = {waypoints: [new google.maps.LatLng(41.889911, -87.637657),
  //                       new google.maps.LatLng(41.890759, -87.628229),
  //                       new google.maps.LatLng(41.900759, -87.658229),
  //                       new google.maps.LatLng(41.880759, -87.658229),
  //                       new google.maps.LatLng(41.899911, -87.636953)]};

  // var i2 = {waypoints: [new google.maps.LatLng(41.889911, -87.637657),
  //                       new google.maps.LatLng(41.890759, -87.628229),
  //                       new google.maps.LatLng(41.860759, -87.658229),
  //                       new google.maps.LatLng(41.899911, -87.636953)]};
  // var itineraries = [i1, i2];

  // for(var i=0; i < itineraries.length; i++) {
  //   var el = $('<div class="map-canvas" style="width:300px;height:250px;margin:0 auto;display:block;"></div>');
  //   $("body").append(el);

  //   maps.push(generateMap(itineraries[i], el.get(0)));
  // }
  // console.log($('.map-canvas').attr('data-latlong'));

  //   google.maps.event.addDomListener(window, 'load', initialize);
// });
