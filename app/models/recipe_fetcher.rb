class RecipeFetcher


  def get_all_recipes(search_params)
    result = Yummly.search(search_params)
    result.total # returns 43350
    result.size # returns 10
    result.collect { |recipe| recipe.name }
  end

  def get_recipe(recipe)
    recipe = Yummly.find('French-Onion-Soup-The-Pioneer-Woman-Cooks-_-Ree-Drummond-41364')
  end


end
