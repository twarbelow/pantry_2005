class CookBook
  attr_reader :recipes

  def initialize
    @recipes = []
  end

  def add_recipe(recipe)
    recipes << recipe
  end

  def ingredients
    recipes.flat_map do |recipe|
      recipe.ingredients.map {|ingredient| ingredient.name}
    end.uniq
  end

  def highest_calorie_meal
    recipes.max_by {|recipe| recipe.total_calories}
  end

  def summary
    # returns array of hashes
    # each hash is {name => "name", details => {ingredient1 => name, amount => "amount unit"}, {ingredient2 => "name", amount => "amount unit"}}
  end

  private
  attr_writer :recipes
end
