
function typeahead() {
  $('.typeahead').typeahead({
    name: 'categories',
    prefetch: '/data/spot_types.json'
  });
};
