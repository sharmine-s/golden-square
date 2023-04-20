require 'order'

RSpec.describe Order do
  context "Adding to order" do
    it "Fails if the dish entered is not a Dish object" do
      order = Order.new
      expect { order.add_to_order("ramen") }.to raise_error "Dish should be an object from the Dish class"
    end
  end
end