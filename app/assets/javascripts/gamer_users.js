$(document).ready(function () {               // on document ready
  var $this = $('#myCarousel');
  if ($('.carousel-inner.item:first').hasClass('active')) {
      $('.left.carousel-control').hide();
  } else if ($('.carousel-inner.item:last').hasClass('active')) {
      $('.right.carousel-control').hide();
  } else {
      $('.carousel-control').show();
  }
})
