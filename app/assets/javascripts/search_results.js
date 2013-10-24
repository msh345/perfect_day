function mapSearchResults() {
  $.each($(".map-canvas"), function(index, element) {
    var lat = $(element).data('lat');
    var lng = $(element).data('long');
    var name = $(element).data('name');

    var myLatlng = new google.maps.LatLng(lat ,lng);

    var mapOptions = {
      zoom: 15,
      center: myLatlng,
      mapTypeId: google.maps.MapTypeId.ROADMAP,
      draggable: false,
      zoomControl: false,
      scaleControl: false,
      scrollwheel: false,
      disableDoubleClickZoom: true
    }

    map = new google.maps.Map(element, mapOptions);

    var marker = new google.maps.Marker({
      position: myLatlng,
      title : name
    });

    marker.setMap(map);

  })

}