//---- Search bar -----
$(document).ready(function(){
  var submitIcon = $('.searchbox-icon');
  var inputBox = $('.searchbox-input');
  var searchBox = $('.searchbox');
  var isOpen = false;
  inputBox.hide();
  submitIcon.click(function(){
      if(isOpen == false){
          searchBox.addClass('searchbox-open');
          inputBox.show().focus();
          isOpen = true;
      } else {
          searchBox.removeClass('searchbox-open');
          inputBox.hide().focusout();
          isOpen = false;
          $('#search_wine_form').submit();
      }
  });
  submitIcon.mouseup(function(){
          return false;
      });
  searchBox.mouseup(function(){
          return false;
      });
  $(document).mouseup(function(){
          if(isOpen == true){
              $('.searchbox-icon').css('display','block');
              submitIcon.click();
          }
      });
  //---- Show password area ----
  $('.password-show').click(function(event) {
    if (!$(event.target).closest('.wine-show-form').length) {
      if ($("i" , this).hasClass('fa-arrow-circle-down')) {
        $("i", this).removeClass('fa-arrow-circle-down');
        $("i", this).addClass('fa-arrow-circle-up');
        $(".wine-show-form", this).hide().removeClass("hidden");
        $(".wine-show-form", this).slideDown("easeInOutQuad", function() {
          $(this).show();
        });
      } else {
        $("i", this).removeClass('fa-arrow-circle-up');
        $("i", this).addClass('fa-arrow-circle-down');
        $(".wine-show-form", this).slideUp("easeInOutQuad", function() {
          $(this).addClass("hidden");
        });
      };
    };
  });
});

//---- Resize picto wine ----
$('.wine-show-color-img').each(function(){
      var parentHeight = $('.ul-size').height();
      $(this).height(parentHeight);
});
