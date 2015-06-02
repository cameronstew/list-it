$(function(){
  $("#begin-shopping").on('click', function() {
    shopping.beginShopping();
  });

  var count = 0;

  $('.buttons').on('click', '.got-it, .skip-it', function (e) {
    e.preventDefault();
    $(this).parent().parent().hide();
    $(this).parent().parent().siblings().eq(count).fadeIn(500);
    count++;

    var status = $(this)[0].className;
    var url = $(this).parent().parent().data('item-url');

    if(status == "got-it"){
      shopping.updateItem(url, "purchased");
    }
    else{
      shopping.updateItem(url, "skipped");
    }
  });

  $('#submit-list').on('click', function(){
    shopping.submitList();
  });
});


var shopping = (function(){
  var path = window.location.pathname;

  return{
    beginShopping: beginShopping,
    updateItem: updateItem,
    submitList: submitList
  }

  function beginShopping(){
    fadeInFadeOut();

  }
  function fadeInFadeOut(){
    $('.item').first().fadeIn(2000);
    $('.item').first().addClass("current");
    $('#begin-shopping').hide();
  }

  function updateItem(url, status){
    $.ajax({
      type: "PATCH",
      url: url,
      data: {item: {status: status}},
    }).done(function(){
      updateReviewList();
    }).error(function(xhr, ajaxOptions, thrownError){
      console.log("error");
    });
  }

  function updateReviewList(){
    $('.list-review ul').load(path + " .list-review ul");
  }

  function submitList(){
    var slug = $('.list-review').data('list-url');
    var url = slug+'/submit';

    var skippedItems = [];

    $.get(url, function(items){
      $(items).each(function(){
        var item = $(this)[0];
        var itemStatus = item.status;
        if(itemStatus == "skipped"){
          skippedItems.push(item);
        }
      });
      sendSkippedItemsEmail(skippedItems)
    });
  }

  function sendSkippedItemsEmail(skippedItems){
    $.ajax({
      url: path,
      method: "POST",
      data: {items: skippedItems}
    }).done(function(){
    }).error(function(){
      console.log("fudge");
    });
  }

})();
