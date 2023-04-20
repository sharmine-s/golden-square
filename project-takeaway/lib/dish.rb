class Dish
  def initialize(name, price)
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