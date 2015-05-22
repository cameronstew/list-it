class ShoppingController < ApplicationController

  def index
    @list = List.find(params[:id])
  end


end
