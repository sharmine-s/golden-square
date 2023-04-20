require 'order'
require 'menu'
require 'dish'

RSpec.describe "Order & Menu integration tests" do
  context "Creating a menu" do
    describe "Adds dishes to the menu and shows the menu" do
      it "Creates 1 dish, adds it, and shows it" do
        edamame = Dish.new("edamame", "£2")
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
      it "Returns true when finding an existing dish" do
        edamame = Dish.new("edamame", "£2")
        menu = Menu.new
        menu.add_to_menu(edamame)
        expect(menu.dish_in_menu?("edamame")).to eq true
      end

      it "Returns false when not finding and inexistent dish" do
        menu = Menu.new
        expect(menu.dish_in_menu?("edamame")).to eq false
      end

      it "Fails if trying to enter a dish_name that is not a String" do
        edamame = Dish.new("edamame", "£2")
        menu = Menu.new
        expect { menu.dish_in_menu?(edamame) }.to raise_error "Dish name should be entered as a string"
      end
    end
  end

  context "Creating an order" do
    describe "Adds dishes to order and shows a receipt" do
      it "Adds dish to order if it exists on the menu" do
        edamame = Dish.new("edamame", "£2")
        menu = Menu.new
        order = Order.new
        order.add_to_order(edamame)
        expect { order.show_receipt }.to output("edamame: £2\n total: £2\n").to_stdout
      end
    end
  end
end