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

$(document).ready(function() {
$('#country_select').change(function() {
  $.ajax({
    url: "/users/update_states",
    data: {
      country_id : $('#country_select').val()
    },
    dataType: "script"
  });
});

$('#state_select').change(function() {
  $.ajax({
    url: "/users/update_cities",
    data: {
      state_id : $('#state_select').val()
    },
    dataType: "script"
  });
});

});
