require 'minitest/autorun'
require 'minitest/pride'
require './lib/ingredient'
require './lib/recipe'
require './lib/cook_book'

class CookBookTest < MiniTest::Test
  def setup
    @ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
    @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
    @recipe1 = Recipe.new("Mac and Cheese")
    @ingredient3 = Ingredient.new({name: "Ground Beef", unit: "oz", calories: 100})
    @ingredient4 = Ingredient.new({name: "Bun", unit: "g", calories: 75})
    @recipe2 = Recipe.new("Cheese Burger")
    @cookbook = CookBook.new
  end

  def test_it_can_add_recipe
    @cookbook.add_recipe(@recipe1)
    @cookbook.add_recipe(@recipe2)
    assert_equal ([@recipe1, @recipe2]), @cookbook.recipes
  end

  def test_it_knows_ingredients
    @cookbook.add_recipe(@recipe1)
    @cookbook.add_recipe(@recipe2)
    @recipe1.add_ingredient(@ingredient1, 2)
    @recipe1.add_ingredient(@ingredient2, 8)
    @recipe2.add_ingredient(@ingredient1, 2)
    @recipe2.add_ingredient(@ingredient3, 4)
    @recipe2.add_ingredient(@ingredient4, 1)

    assert_equal (["Cheese", "Macaroni", "Ground Beef", "Bun"]), @cookbook.ingredients
  end

  def test_it_knows_highest_calorie_meal
    @cookbook.add_recipe(@recipe1)
    @cookbook.add_recipe(@recipe2)
    @recipe1.add_ingredient(@ingredient1, 2)
    @recipe1.add_ingredient(@ingredient2, 8)
    @recipe2.add_ingredient(@ingredient1, 2)
    @recipe2.add_ingredient(@ingredient3, 4)
    @recipe2.add_ingredient(@ingredient4, 1)

    assert_equal @recipe2, @cookbook.highest_calorie_meal
  end

  def test_it_has_date
    assert_equal Date.today.strftime("%m-%d-%Y"), @cookbook.date
  end

  def test_it_has_summary
    @recipe1.add_ingredient(@ingredient1, 2)
    @recipe1.add_ingredient(@ingredient2, 8)
    ingredient4 = Ingredient.new({name: "Bun", unit: "g", calories: 75})
    recipe2 = Recipe.new("Burger")
    recipe2.add_ingredient(@ingredient3, 4)
    recipe2.add_ingredient(ingredient4, 100)
    @cookbook.add_recipe(@recipe1)
    @cookbook.add_recipe(@recipe2)

    assert_equal ([{:name=>"Mac and Cheese",
      :details=>{:ingredients=>[{:ingredient=>"Macaroni",
      :amount=>"8 oz"},
      {:ingredient=>"Cheese", :amount=>"2 C"}],
      :total_calories=>440}}, {:name=>"Burger",
      :details=>{:ingredients=>[{:ingredient=>"Ground Beef",
      :amount=>"4 oz"},
      {:ingredient=>"Bun", :amount=>"100 g"}],
      :total_calories=>500}}]),
      @cookbook.summary
  end

end
