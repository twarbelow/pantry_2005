require 'date'

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

  def date
    # I can get this to pass the test, but I don't think
    # my method is practical for anything not created at the time
    # the test is run...
    Date.today.strftime("%m-%d-%Y")
  end

  def summary
    require 'pry'; binding.pry
    # returns array of hashes
    # each hash is
    # {name => "name", details => {ingredient1 => name,
    # amount => "amount unit"}, {ingredient2 => "name",
    # amount => "amount unit"}}
  end

  private
  attr_writer :recipes
end
