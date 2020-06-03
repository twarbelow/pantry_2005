class Recipe
  attr_reader :name, :ingredients_required

  def initialize(name)
    @name = name
    @ingredients_required = {}
  end

  def add_ingredient(ingredient, amount)
    if ingredients_required[ingredient].nil?
      ingredients_required[ingredient] = amount
    else
      ingredients_required[ingredient] += amount
    end
  end

  private
  attr_writer :ingredients_required
end
