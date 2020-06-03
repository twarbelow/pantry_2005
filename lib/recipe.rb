class Recipe
  attr_reader :name, :ingredients_required, :ingredients

  def initialize(name)
    @name = name
    @ingredients_required = {}
    @ingredients = []
  end

  def add_ingredient(ingredient, amount)
    if ingredients_required[ingredient].nil?
      ingredients_required[ingredient] = amount
      ingredients << ingredient
    else
      ingredients_required[ingredient] += amount
    end
  end

  private
  attr_writer :ingredients_required, :ingredients
end
