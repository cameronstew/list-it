class RecipeFetcherController < ApplicationController

  def index
    @result = Yummly.search('Onion soup')
    # @result.total # returns 43350
    # @result.size # returns 10
    # @test = @result.collect { |recipe| recipe.name }
  end


end
