require 'twilio-ruby'
require 'dotenv'
Dotenv.load('environment.env')

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
    # Your Account SID and Auth Token from console.twilio.com
    
    @client = Twilio::REST::Client.new ENV['ACCOUNT_SID'], ENV['AUTH_TOKEN']
    message = @client.messages.create(
    body: "Thank you! Your order was placed and will be delivered before 18:52",
    to: ENV['TO_PHONE_NUMBER'],  # Text this number
    from: ENV['FROM_PHONE_NUMBER'], # From a valid Twilio number
    )
    
    puts "Thank you! Your order was placed and will be delivered before 18:52\n"
  end
end

