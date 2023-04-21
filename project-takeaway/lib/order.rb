require "twilio-ruby"

class Order
  def initialize
    @order = []
  end

  def add_to_order(dish)
    fail "Dish should be an object from the Dish class" unless dish.is_a? Dish
    @order << dish
  end

  def show_receipt
    total = @order.reduce(0) { |total, dish| total += dish.get_price }
    @order.each { |dish| puts "#{dish.get_name}: £#{dish.get_price}" }
    puts "total: £#{total}"
  end

  def send_notification
    print "Thank you! Your order was placed and will be delivered before 18:52"
  end
end

