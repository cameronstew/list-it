$(function(){
  $('.got-it').on('click', function(){
    var url = $(this).parent().data('item-url');
    //updateItem(url, "purchased");
  });
  $('.skip-it').on('click', function(){
    var url = $(this).parent().data('item-url');
    //updateItem(url, "skipped");
  });
});


function updateItem(url, status){
  $.ajax({
    type: "PATCH",
    url: url,
    data: {item: {status: status}},
  }).error(function(xhr, ajaxOptions, thrownError){
    console.log("error");
  });
}
