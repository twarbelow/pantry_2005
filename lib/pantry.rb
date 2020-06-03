class Pantry
  attr_reader :stock

  def initialize
    @stock = {}
  end

  def stock_check(ingredient)
    stock[:ingredient] = 0 if stock[:ingredient].nil?
    stock[:ingredient]
  end

  def restock(ingredient, amount)
    stock_check(ingredient)
    stock[:ingredient] += amount
  end

end
