class ItemsController < ApplicationController
  def index
  end

  def item_status(item_id, status)
    @status = params[:status]
    @item = Item.find(item_id)
    if status == "purchased"
      @item.status = 1
    elsif status == "skipped"
      @item.status = 2
    end
  end

  def update
    @item = Item.find(params[:id])
    @item.update!(params.require(:item).permit(:status))
    render nothing: true
  end

end
