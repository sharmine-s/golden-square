require 'order'

RSpec.describe Order do
  context "Adding to order" do
    it "Fails if the dish entered is not a Dish object" do
      order = Order.new
      expect { order.add_to_order("ramen") }.to raise_error "Dish should be an object from the Dish class"
    end
  end

  context "Show receipt"
  it "Shows the itemized receipt with total amount" do
    ramen = double(:dish, get_name: "ramen", get_price: 9, is_a?: true)
    gyoza = double(:dish, get_name: "gyoza", get_price: 4, is_a?: true)
    order = Order.new
    order.add_to_order(ramen)
    order.add_to_order(gyoza)
    expect { order.show_receipt }.to output("ramen: £9\ngyoza: £4\ntotal: £13\n").to_stdout
  end
end