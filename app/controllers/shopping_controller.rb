class ShoppingController < ApplicationController

  def index
    @list = List.find(params[:id])
    @items = @list.items.sort_by(&:status)
  end


end
