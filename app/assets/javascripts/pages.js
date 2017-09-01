//---- Redimension image size responsive ----
function set_body_height() { // set body height = window height
  $('body').height($(window).height());
}
$(document).ready(function() {
  $(window).bind('resize', set_body_height);
  set_body_height();
});


//---- Modal ----
$(document).ready(function() {
  $('#trigger').on('click', function() {
    $('#registration').removeClass("hidden");
    $('#session').addClass("hidden");
  });
  $('#trigger_back').on('click', function() {
    $('#session').removeClass("hidden");
    $('#registration').addClass("hidden");
  });
});


//---- Scroll smooth ----
$(function() {
  $('a[href*="#"]:not([href="#"])').click(function() {
    if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {
      var target = $(this.hash);
      target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
      if (target.length) {
        $('html, body').animate({
          scrollTop: target.offset().top
        }, 1000);
        return false;
      }
    }
  });
});
