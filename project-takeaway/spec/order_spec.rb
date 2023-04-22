require 'order'

RSpec.describe Order do
  context "Adding to order" do
    it "Fails if the dish entered is not a Dish object" do
      order = Order.new
      expect { order.add_to_order("ramen") }.to raise_error "Dish should be an object from the Dish class"
    end
  end

  context "Show receipt" do
    it "Shows the itemized receipt with total amount" do
      ramen = double(:dish, get_name: "ramen", get_price: 9, is_a?: true)
      gyoza = double(:dish, get_name: "gyoza", get_price: 4, is_a?: true)
      order = Order.new
      order.add_to_order(ramen)
      order.add_to_order(gyoza)
      expect { order.show_receipt }.to output("ramen: £9\ngyoza: £4\ntotal: £13\n").to_stdout
    end
  end

  context "Sending a text notification" do
    it "Uses the Twilio API to send a text" do
      ramen = double(:dish, get_name: "ramen", get_price: 9, is_a?: true)
      menu = double(:menu, get_dish_if_in_menu: ramen)
      order = Order.new
      dish = menu.get_dish_if_in_menu("ramen")
      order.add_to_order(dish)
      expect { order.send_notification }.to output("Thank you! Your order was placed and will be delivered before 18:52\n").to_stdout
    end
  end
end