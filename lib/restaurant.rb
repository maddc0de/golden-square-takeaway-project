class Restaurant
  def initialize

  end

  def dishes
    [{:dish => "Pizza", :price => 12.99},
    {:dish => "Oatcakes", :price => 8.49},
    {:dish => "French Toast", :price => 8.99},
    {:dish => "Noodles", :price => 10.55}]
  end

  def process_time(num) #number of dishes
    max_time_to_prepare_dish = 5
    max_time_to_deliver_order = 10
    # returns total time in seconds
    ((num * 5) + 10) * 60
  end
end