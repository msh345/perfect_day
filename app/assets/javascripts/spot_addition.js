function AddNewSpotForm() {
  $('#add_new_spot').on('click', function(e) {
    $(this).before("<fieldset>\
        <label>Spot Address<input class='address' type='text' name='itineraries_name[][address]'></label>\
        <label>Spot Description<input class='description' type='text' name='itineraries_name[][description]'></label>\
        </fieldset>")
    SerializeData();
  });
}

function CreateSpot(name, address, phone, latitude, longitude) {
  this.name = name;
  this.address = address;
  this.phone = phone;
  this.latitude = latitude;
  this.longitude = longitude;
}

CreateSpot.prototype.addDesc = function(description) {
  this.description = description
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

    var data = $(this).serializeArray();
    output["name"] = data[2].value;

    for(var i=0; i<spots.length;i++){
      var desc = 4 + (i*2);

      spots[i].addDesc(data[desc].value);
    }
    output["spots"] = spots;

    $.post('/create', output, function(response) {
      window.location.replace('/');
    //.done(function(){

    });
  });
}

function initialize() {
  SerializeData();
  SubmitResponse();
}
