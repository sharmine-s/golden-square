class Order
  def initialize
    @order = []
  end

  def add_to_order(dish)
    @order << dish
  end

  def show_receipt
    total = 0
    @order.each { |dish| 
      puts "#{dish.get_name}: £#{dish.get_price}"
      total += dish.get_price
    }
    puts "total: £#{total}"
  end
end