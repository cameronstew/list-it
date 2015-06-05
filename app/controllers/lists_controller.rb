class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy, :get_items]

  def index
    @lists = List.all
  end

  def show
    @email = Email.new
  end

  def new
    @list = List.new
  end

  def create
    if params[:ingredients]
      @list = List.new
      if current_user
        @list.user_id = current_user.id
        @list.author = current_user.full_name
        @list.author_email = current_user.email
      end

      item_hash = Hash.new
        ingredients = params[:ingredients]
        count = 0

        ingredients.each do |ingredient|
          items_array = []
          if /(^\d\s\S+\s\d+|^\d-\d|^\d\/\d|^\d)/.match(ingredient)
            if /^\d\s\S+\s\d+/.match(ingredient)
              quantity = /^\d\s\S+\s\d+/.match(ingredient)[0]
            elsif /^\d-\d/.match(ingredient)
              quantity = /^\d-\d/.match(ingredient)[0]
            elsif /^\d\/\d/.match(ingredient)
              quantity = /^\d\/\d/.match(ingredient)[0]
            elsif /^\d/.match(ingredient)
              quantity = /^\d/.match(ingredient)[0]
            end

            items_array << quantity

            ingredient.slice! quantity
            description = ingredient[1..-1]

            items_array << description

            item_hash[count] = items_array

          else
            description = ingredient
            quantity = ''

            items_array << quantity
            items_array << description
            item_hash[count] = items_array

          end

          count +=1
        end

        item_hash.each do |item|
          @item = @list.items.new
          @item.quantity = item[1][0]
          @item.description = item[1][1]
          @item.save
        end
        @list.save

        render json: @list


    else

    @list = List.create(list_params)
    if current_user
      @list.user_id = current_user.id
      @list.author = current_user.full_name
      @list.author_email = current_user.email
    end

    if @list.save
      redirect_to list_path(@list), notice: "List created!"
    else
      render :new
    end
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

  def get_items
    @list.shopped = true
    @list.save

    @items = @list.items

    render json: @items
  end


  private
  def list_params
    params.require(:list).permit(:name, :user_id, :shopped, items_attributes:[:description, :quantity, :_destroy])
  end

  def set_list
    @list = List.find(params[:id])
  end

end
