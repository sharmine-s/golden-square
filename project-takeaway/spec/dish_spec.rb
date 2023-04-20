require 'dish'

RSpec.describe Dish do
  context "Creates a dish" do
    it "Returns the dish's name and price" do
      edamame = Dish.new("edamame", 2)
      expect(edamame.get_name).to eq "edamame"
      expect(edamame.get_price).to eq 2
    end

    it "Fails if dish is initialized with a non-String name or non-Integer price" do
      expect { edamame = Dish.new(:edamame, 2) }.to raise_error "Dish name should be a String"
      expect { edamame = Dish.new("edamame", "2") }.to raise_error "Dish price should be an Integer"
    end
  end
end