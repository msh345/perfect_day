

$(document).on("ready", function() {
  $('.typeahead').typeahead({
    name: 'categories',
    prefetch: '/data/spot_types.json'
  });


  // $("#spot_type_search_button").on('click', function(event) {
  //   event.preventDefault();

  //   var data = $("#spot_type_search_input").val();

  //   $.post('/search', data, function(response) {

  //   })


  // })
  // });




//   $('.typeahead').on("autocomplete", function(event, data){
//     console.log("Autocompleted id is " + data.id);
//     console.log("Autocompleted value is "+ data.value);
// });
});
