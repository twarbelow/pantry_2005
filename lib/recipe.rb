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

  def total_calories
    total_calories = 0
    ingredients_required.each do |ingredient, amount|
      total_calories += (ingredient.calories * amount)
    end
    total_calories
  end

  private
  attr_writer :ingredients_required, :ingredients
end
