class Ingredient
  attr_reader :name, :unit

  def initialize(info)
    @name = info[:name]
    @unit = info[:unit]

  end

end
