class OrderReceipt
  def initialize(restaurant, order, io = Kernel)
    @restaurant = restaurant
    @order = order
    @io = io
    @order_time = Time.now
  end

  def print
    @io.puts "Thank you for you order. Here is your receipt:"
    @io.puts final_order_list
    @io.puts total
  end

  def final_order_list
    @order.view_basket.map {|dish|
      "Dish: #{dish[:dish]}, Price: £#{dish[:price]}"}
  end

  private

  def total
    total = 0
    @order.view_basket.each{ |list|
      total += list.values_at(:price).join.to_f
    }
    "Total Price: £#{total}"
  end
  
end


