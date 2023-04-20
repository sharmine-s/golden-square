class Dish
  def initialize(name, price)
    fail "Dish name should be a String" unless name.is_a? String
    fail "Dish price should be an Integer" unless price.is_a? Integer
    @dish_name = name
    @dish_price = price
  end

  def get_name
    return @dish_name
  end

  def get_price
    return @dish_price
  end
end