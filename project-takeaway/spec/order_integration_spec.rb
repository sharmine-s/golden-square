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

    describe "Checks if dish is in the menu" do
      xit "" do
        
      end
    end
  end
end