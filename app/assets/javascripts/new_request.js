$(document).ready(function() {

  $('.welcome').click(function() {
    scroll('#welcome');
  });

  $('.get_started').click(function() {
    scroll('#choose_section');
  });

  $('.choose_target').click(function() {
    scroll('#target_section');
  });

  $('.finalize').click(function() {
    scroll('#done');
  });


});

var scroll = function(selector) {
  $.scrollTo(selector,500);
}
