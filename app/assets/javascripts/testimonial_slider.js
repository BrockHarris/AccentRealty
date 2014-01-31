$(function(){ 
  var rotating = true;
  var clientspeed = 4500;
  var seeclients = setInterval(rotateTestimonials, clientspeed);

  $(document).on({
    mouseenter: function(){ rotating = false ;}, // Rotation off when hovering  
    mouseleave: function(){ rotating = true ;}
  }, '#testimonials');

  function rotateTestimonials() {
    if(rotating != false) {
      var $first = $('#testimonial-list li:first');
      $first.animate({ 'margin-left': '-815px' }, 600, function() {
        $first.remove().css({ 'margin-left': '0px' });
        $('#testimonial-list li:last').after($first);
      });
    }
  }

  // variables for testimonials carousel
  var $txtcarousel = $('#testimonial-list');
  var txtcount = $txtcarousel.children().length;
  var wrapwidth = (txtcount * 815) + 815; // 400px width for each testimonial item
  $txtcarousel.css('width',wrapwidth);
  var animtime = 750; // milliseconds for clients carousel
 
  // nav buttons for testimonials
  $('#previous_testimonial').on('click', function(){
    var $last = $('#testimonial-list li:last');
    $last.remove().css({ 'margin-left': '-815px' });
    $('#testimonial-list li:first').before($last);
    $last.animate({ 'margin-left': '0px' }, animtime); 
  });
  
  $('#next_testimonial').on('click', function(){
    var $first = $('#testimonial-list li:first');
    $first.animate({ 'margin-left': '-815px' }, animtime, function() {
      $first.remove().css({ 'margin-left': '0px' });
      $('#testimonial-list li:last').after($first);
    });  
  });
});