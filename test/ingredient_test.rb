require 'minitest/autorun'
require 'minitest/pride'
require 'filehere'
require './lib/ingredient'
require './lib/pantry'

class IngredientTest < Minitest::Test
  def setup
    @ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})
  end

  def test_it_has_a_name
    assert_equal "Cheese", @ingredient1.name
  end
end
