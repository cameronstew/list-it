class RecipeFetcherController < ApplicationController

  def index
    #@result = Yummly.search('Onion Soup')
     @result = Yummly.search(params[:id])
     @recipes = @result.recipes.map {|recipe| recipe.json}

    # render json: @recipes
  end

  def show
    @recipe = Yummly.find(params[:id])
    render json: @recipe
  end

  def new
  end

end
