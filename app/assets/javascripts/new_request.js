$(document).ready(function() {
  slides = ["#welcome", "#otherdiv", "#thirddiv"];

  $('#next').data('index',0);

  $('#next').click(function() {
    var target = parseInt($(this).data('index')) + 1;
    scroll(slides[target]);
    $(this).data('index', target);
  });

  $('#top').click(function() {
    var target = parseInt($('#next').data('index') - 1);
    if (target < 0) {
      target = 0;
    }
    scroll(slides[target]);
    $('#next').data('index',target);
  });



});

var scroll = function(selector) {
  $.scrollTo(selector,800);
}
