require 'order'
require 'menu'
require 'dish'

RSpec.describe "Order & Menu integration tests" do
  context "Creating a menu" do
    describe "Adds dishes to the menu and shows the menu" do
      it "Creates 1 dish, adds it, and shows it" do
        edamame = Dish.new("edamame", 2)
        menu = Menu.new
        menu.add_to_menu(edamame)
        expect { menu.show_menu }.to output("edamame: £2\n").to_stdout
      end

      it "Fails if trying to add something that isn't a Dish object" do
        menu = Menu.new
        expect { menu.add_to_menu("edamame") }.to raise_error "Dish should be an object from the Dish class"
      end
    end

    describe "Checks if dish is in the menu_list" do
      it "Returns dish when finding an existing dish name" do
        edamame = Dish.new("edamame", 2)
        menu = Menu.new
        menu.add_to_menu(edamame)
        expect(menu.get_dish_if_in_menu("edamame")).to eq edamame
      end

      it "Returns nil when not finding and inexistent dish" do
        menu = Menu.new
        expect(menu.get_dish_if_in_menu("edamame")).to eq nil
      end

      it "Fails if trying to enter a dish_name that is not a String" do
        edamame = Dish.new("edamame", 2)
        menu = Menu.new
        expect { menu.get_dish_if_in_menu(edamame) }.to raise_error "Dish name should be entered as a string"
      end
    end
  end

  context "Creating an order" do
    describe "Adds dishes to order and shows a receipt" do
      it "Adds 1 dish to order and shows itemized and total in receipt" do
        edamame = Dish.new("edamame", 2)
        menu = Menu.new
        menu.add_to_menu(edamame)
        order = Order.new
        dish = menu.get_dish_if_in_menu("edamame")
        order.add_to_order(dish)
        expect { order.show_receipt }.to output("edamame: £2\ntotal: £2\n").to_stdout
      end

      it "Adds multiple dishes to order and shows itemized and total in receipt" do
        edamame = Dish.new("edamame", 2)
        gyoza = Dish.new("gyoza", 4)
        ramen = Dish.new("ramen", 9)
        menu = Menu.new
        menu.add_to_menu(edamame)
        menu.add_to_menu(gyoza)
        menu.add_to_menu(ramen)
        order = Order.new
        dish_1 = menu.get_dish_if_in_menu("edamame")
        dish_2 = menu.get_dish_if_in_menu("gyoza")
        dish_3 = menu.get_dish_if_in_menu("ramen")
        order.add_to_order(dish_1)
        order.add_to_order(dish_2)
        order.add_to_order(dish_3)
        expect { order.show_receipt }.to output("edamame: £2\ngyoza: £4\nramen: £9\ntotal: £15\n").to_stdout
      end
    end
  end
end