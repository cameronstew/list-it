class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy]

  def index
    @lists = List.all
  end

  def show
  end

  def new
    @list = List.new
  end

  def create
    @list = List.create(list_params)
    if @list.save
      redirect_to list_path(@list), notice: "List created!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    @list.update(list_params)
    if @list.save
      redirect_to list_path(@list), notice: "List updated!"
      render :edit
    end
  end

  def destroy
  end


  private
  def list_params
    params.require(:list).permit(:date, :user_id, :complete, items_attributes:[:description, :quantity, :_destroy])
    # params.require(:list).permit(:date, :user_id, :complete, :items, :item, :quantity)
  end

  def set_list
    @list = List.find(params[:id])
  end

end
