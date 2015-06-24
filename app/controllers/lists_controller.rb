class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy, :get_items]

  def index
    current_month = Time.now.strftime("%-m")
    last_month = (Time.now - 1.month ).strftime("%-m")
    month_before_last = (Time.now - 2.month ).strftime("%-m")

    @current_month_name = Time.now.strftime("%B")
    @last_month_name = (Time.now - 1.month ).strftime("%B")
    @month_before_last_name = (Time.now - 2.month ).strftime("%B")

    @current_lists = List.all.where('extract(month from updated_at) = ?', current_month).order('created_at DESC')
    @last_month_lists = List.all.where('extract(month from updated_at) = ?', last_month).order('created_at DESC')
    @month_before_last_lists = List.all.where('extract(month from updated_at) = ?', month_before_last).order('created_at DESC')
  end

  def show
    @email = Email.new
  end

  def new
    @list = List.new
  end

  def create
    if params[:ingredients]
      name = params[:recipeTitle]
      @list = List.new
      @list.name = "#{Time.now.strftime("%m/%d/%y")} #{name}"
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
        if /(^\W|^\d+\S\z|^\d+\s(\d|\S[^a-zA-Z])\S+|^\d-\d|^\d\/\d|^\d+)/.match(ingredient)
          if /^\W/.match(ingredient)
            quantity = /^\W/.match(ingredient)[0]
          elsif /^\d+\S\z/.match(ingredient)
            quantity = /^\d+\S\z/.match(ingredient)[0]
          elsif /^\d+\s(\d|\S[^a-zA-Z])\S+/.match(ingredient)
            quantity = /^\d+\s(\d|\S[^a-zA-Z])\S+/.match(ingredient)[0]
          elsif /^\d-\d/.match(ingredient)
            quantity = /^\d-\d/.match(ingredient)[0]
          elsif /^\d\/\d/.match(ingredient)
            quantity = /^\d\/\d/.match(ingredient)[0]
          elsif /^\d+/.match(ingredient)
            quantity = /^\d+/.match(ingredient)[0]
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
    respond_to do |format|
        if @list.update(list_params)
          format.html { redirect_to @list}
          format.json { render :show, status: :ok, location: @list }
        else
          format.html { render :edit }
          format.json { render json: @list.errors, status: :unprocessable_entity }
        end
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

  def create_list
  end


  private
  def list_params
    params.require(:list).permit(:name, :user_id, :shopped, items_attributes:[:description, :quantity, :_destroy, :id])
  end

  def set_list
    @list = List.find(params[:id])
  end

end
