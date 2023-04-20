require 'menu'

RSpec.describe Menu do
  context "Adds dishes to the menu and shows the menu" do
    it "Creates 1 dish, adds it, and shows it" do
      edamame = double(:Dish, get_name: "edamame", get_price: 2, is_a?: true)
      menu = Menu.new
      menu.add_to_menu(edamame)
      expect { menu.show_menu }.to output("edamame: £2\n").to_stdout
    end

    it "Fails if trying to add something that isn't a Dish object" do
      menu = Menu.new
      expect { menu.add_to_menu("edamame") }.to raise_error "Dish should be an object from the Dish class"
    end
  end
end