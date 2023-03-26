class Order
  def initialize(restaurant, io = Kernel)
    @restaurant = restaurant
    @io = io
    @basket = []
  end

  def show_menu
    menu = @restaurant.dishes.map { |dish|
      "#{dish[:dish]}, £#{dish[:price]}"
    }.join("\n")
    @io.puts menu
  end

  def view_basket
    if @basket == []
      @io.puts "Your basket is currently empty." 
    else
      @basket
    end
  end

  def add_dish
    @io.puts "Please type the dish you want to add to the basket:"
    dish_input = @io.gets.chomp.capitalize
    selected_dish = @restaurant.dishes.select{|dish| dish[:dish] == dish_input}
    dish, price = selected_dish[0][:dish], selected_dish[0][:price]
    dish_to_be_added = { dish: dish, price: price}
    @basket << dish_to_be_added
  end

  def remove_dish
    @io.puts "Please type the dish you want to remove from the basket:"
    dish_input = @io.gets.chomp.capitalize
    @basket.delete_if { |list|
      list[:dish] == dish_input
    }
  end

  def checkout(receipt)
    fail "There is nothing to checkout, basket is empty." if @basket == []

  end
  

end



# resto = Restaurant.new
# order = Order.new(resto, Kernel)
# order.add_dish
# order.view_basket