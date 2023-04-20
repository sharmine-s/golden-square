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
      puts "#{dish.get_name}: #{dish.get_price}"
    }
  end

  def dish_in_menu?(dish_name)
    fail "Dish name should be entered as a string" unless dish_name.is_a? String
    @menu_list.each { |dish| return true if dish.get_name == dish_name }
    return false
  end
end