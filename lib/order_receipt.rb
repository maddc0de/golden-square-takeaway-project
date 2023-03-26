require 'rubygems'
require 'twilio-ruby'

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
    send_text_message
  end

  def final_order_list
    @order.view_basket.map {|dish|
      "Dish: #{dish[:dish]}, Price: £#{dish[:price]}"}
  end

  def number_of_dishes
    @order.view_basket.length
  end


  def send_text_message
    delivery_time = (@order_time + @restaurant.process_time(number_of_dishes)).strftime("%H:%M")

    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    twilio_number = ENV['TWILIO_NUMBER']
    my_number = ENV['MY_NUMBER']
    @client = Twilio::REST::Client.new(account_sid, auth_token)

    message = @client.messages.create(
                                body: "Thank you! Your order was placed and will be delivered before #{delivery_time}",
                                from: twilio_number,
                                to: my_number
                              )

    puts message.sid
    
  
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


