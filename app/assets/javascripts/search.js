

$(document).on("ready", function() {
  $('.typeahead').typeahead({
    name: 'categories',
    prefetch: '../data/spot_types.json',
    limit: 5
  });
});
