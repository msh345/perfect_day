
function generateMap(itinerary, element) {
  var map;
  var directionsDisplay = new google.maps.DirectionsRenderer();
  var mapOptions = {
    zoom: 6,
    mapTypeId: google.maps.MapTypeId.ROADMAP,
  }

  map = new google.maps.Map(element, mapOptions);
  directionsDisplay.setMap(map);

  calcRoute(itinerary.waypoints, directionsDisplay);

  return map;
}

function calcRoute(waypoints, display) {
  var waypts = [];
  for (var i=1; i<waypoints.length-1; i++) {
    var testLatLng = {
      location: waypoints[i],
      stopover: true
    }
    waypts.push(testLatLng);
  }

  var start = waypoints[0];
  var end = waypoints[waypoints.length-1];

  var request = {
      origin: start,
      destination: end,
      waypoints: waypts,
      optimizeWaypoints: true,
      travelMode: google.maps.TravelMode.WALKING
  };

  directionsService.route(request, function(response, status) {
    if (status == google.maps.DirectionsStatus.OK) {
      display.setDirections(response);
      var route = response.routes[0];
    }
  });
}

function latLong(coords) {
  var waypoints = []
  coords.filter(function(i){
    waypoints.push(new google.maps.LatLng(i[0], i[1]))
  })
  return waypoints
}

function generateItinerary() {
  $('.map-canvas').each(function() {
    var lat_long_array = $(this).data('latlong');

    var itin = {waypoints: latLong(lat_long_array)}

    maps.push(generateMap(itin, $(this).get(0)));
  })
}
