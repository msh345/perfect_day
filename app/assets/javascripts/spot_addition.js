function AddNewSpotForm() {
  $('#add_new_spot').on('click', function(e) {
    $(this).before("<fieldset>\
        <label>Spot Address<input class='address' type='text' name='itineraries_name[][address]'></label>\
        <label>Spot Description<input class='description' type='text' name='itineraries_name[][description]'></label>\
        </fieldset>")
    SerializeData();
    console.log(spots);
  });
}

function CreateSpot(name, address, phone, latitude, longitude) {
  this.name = name;
  this.address = address;
  this.phone = phone;
  this.latitude = latitude;
  this.longitude = longitude;
}
var output = {}
var inputs = []
var spots = []
var counter = 0

function SerializeData() {
  var input = $('.address')[counter];
  inputs.push(input);
  
  var searchBox = new google.maps.places.Autocomplete(inputs[counter]);

  google.maps.event.addListener(searchBox, 'place_changed', function() {
    var place = searchBox.getPlace();
    
    spot = new CreateSpot(place['name'], place['formatted_address'], place['formatted_phone_number'], place['geometry']['location']['lb'],
                  place['geometry']['location']['mb']   )

    spots.push(spot);
    counter++;
  });
}

function SubmitResponse() {
  $('#create_itinerary_form').on('submit', function(event) {
    event.preventDefault();
    for(var i=0; i<spots.length;i++){
      var name = "spot"+i
      output[name] = spots[i]
    }
    $.post('/create', output, function(response) {
      console.log(response);
    })
  });
}

function initialize() {
  SerializeData();
  SubmitResponse();
}


