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

$(function() {
  $('#add_new_spot').on('click', function(e) {
    console.log(this);
    $(this).before("<fieldset>\
  <label>Spot Address<input type='text' name='itineraries_name[][address]'></label>\
  <label>Spot Description<input type='text' name='itineraries_name[][description]'></label>\
</fieldset>")
  });
});
