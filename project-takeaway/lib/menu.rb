require 'dish'

class Menu
  def initialize
    @menu_list = []
  end

  def add_to_menu(dish)
    fail "Dish should be an object from the Dish class" unless dish.is_a? Dish
    @menu_list << dish
  end

  def show_menu
    @menu_list.each { |dish| 
      puts "#{dish.dish_name}: #{dish.dish_price}"
    }
  end
end