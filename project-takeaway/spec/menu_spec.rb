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

  context "Get dish if it's in the menu" do
    it "Returns the dish object if the dish name exists in the menu" do
      edamame = double(:Dish, get_name: "edamame", get_price: 2, is_a?: true)
      menu = Menu.new
      menu.add_to_menu(edamame)
      expect(menu.get_dish_if_in_menu("edamame")).to eq edamame
    end

    it "Returns nil if dish does not exist in the menu" do
      edamame = double(:Dish, get_name: "edamame", get_price: 2, is_a?: true)
      menu = Menu.new
      menu.add_to_menu(edamame)
      expect(menu.get_dish_if_in_menu("ramen")).to eq nil
    end

    it "Fails if dish_name is not a String" do
      edamame = double(:Dish, get_name: "edamame", get_price: 2)
      menu = Menu.new
      expect { menu.get_dish_if_in_menu(edamame) }.to raise_error "Dish name should be entered as a string"
    end
  end
end