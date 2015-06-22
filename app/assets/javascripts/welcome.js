  $(function(){
    $('.new-list').hide();
    $('.get-started').on('click', function(){
      $('.welcome-container').hide('slide', {direction: 'right'}, 1000);
      setTimeout(function(){
        $('.new-list').fadeIn(500);
      }, 1000);
    });

    $('.get-started').on('mouseenter mouseleave',function( e ) {
      var el = $(this);
      if(!el.data('b'))el.effect('bounce', {direction:'up',distance:10,times:1.5} );
      el.data('b', e.type == 'mouseenter' ? true : false);
    });
  });
