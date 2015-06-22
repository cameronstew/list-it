$(function(){
  $('.recipe-images').on('click', function(){

    var recipeId = $(this).data('recipe-id');
    var url = '/recipes/'+recipeId;
    getRecipe(url);
  });

  $('#home_search').on('click', function(e){
    e.preventDefault();
    var search_params = $('#search_field').val();
    var url = '/recipes/search/'+search_params;
    window.location.href = url;
  });
});

  function getRecipe(recipeURL){

      $.getJSON(recipeURL, function(recipe_data){

      $('.modal-body').empty();
      $('.modal-body img').hide();

      var template = HandlebarsTemplates['recipe_fetcher/index'](recipe_data);

      $('.modal-body').append(template);
      $('#recipe_temp').show();

      var ingredients = recipe_data.json.ingredientLines;
      var name = recipe_data.json.name;
      var source = recipe_data.json.source.sourceSiteUrl;
      var recipeTitle = name+" from "+source;

      var recipeImage = recipe_data.json.images[0].hostedLargeUrl;

      $('#use-recipe').on('click', function(){
        $.ajax({
          url: '/lists',
          type: 'POST',
          data: { ingredients: ingredients, recipeTitle: recipeTitle }
        }).done(function(newList) {
          var listID = newList.id;
          window.location.href = '/lists/'+listID;
        }).error(function(){
          console.log("error");
        });
      });
    });
  }
