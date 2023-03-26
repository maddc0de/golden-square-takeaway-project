# Golden Square Solo Project Design Recipe

## 1. Describe the Problem

>As a customer
>So that I can check if I want to order something
>I would like to see a list of dishes with prices.

>As a customer
>So that I can order the meal I want
>I would like to be able to select some number of several available dishes.

>As a customer
>So that I can verify that my order is correct
>I would like to see an itemised receipt with a grand total.

Use the twilio-ruby gem to implement this next one. You will need to use doubles too.

>As a customer
>So that I am reassured that my order will be delivered on time
>I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered.

## 2. Design the Class System

![design](golden-square-takeaway-project/takeaway-project-diagram.png "Diagram")


_interface design of each class in more detail._

```ruby
class Restaurant
  def dishes
     # array of hashes with diff dishes and prices
  end

  def process_time(num) # num takes an integer representing number of dishes
    # returns an integer representing total number of minutes it takes to prepare num of dishes and to make the delivery
  end
end
```

```ruby
class Order
  def initialize(Restaurant, io = Kernel) # instance of restaurant
    restaurant
    io
    basket = []
    checkout = false
  end

  def show_menu
    # returns a list of dishes with prices in the restaurant's menu that customer can see
  end

  def view_basket
    # returns a list of selected dishes that customer can see
  end

  def add_dish
    # adds dish to basket
  end

  def remove_dish
    # removes dish to basket
  end

  def checkout(receipt) # instance of OrderReceipt
  end

  def cancel_order # instance of OrderReceipt
  end

end
```

```ruby
class OrderReceipt
  def initialize(order, io)

  end

  def checkout_basket
    # returns basket
  end

  def total_price
    # returns sum of dishes ordered
  end

  def view_receipt
    # shows a list of the dishes ordered with prices and the grand total
  end

  def confirm_order(restaurant)
    # returns time of order
  end

end
```

## 3. Create Examples as Integration Tests

```ruby
# list dishes with prices in the menu
restaurant = Restaurant.new
order = Order.new(restaurant, Kernel)
order.view_menu # => puts list of dishes with prices
```

```ruby
# receives message when initially checking out with an empty basket
restaurant = Restaurant.new
order = Order.new(restaurant, Kernel)
order.checkout # => puts "there is nothing to checkout, basket is empty."
```

```ruby
# customer views basket with added dishes in the basket and checkout order
restaurant = Restaurant.new
order = Order.new(restaurant, Kernel)
.add_dish # => Pizza
.add_dish # => Noodkes
.view_basket # => basket list
order.checkout   # => show receipt and ask user to confirm order
```

## 4. Create Examples as Unit Tests

_Create examples, where appropriate, of the behaviour of each relevant class at
a more granular level of detail._

```ruby
# initally returns zero when zero dish given to process_time method
restaurant = Restaurant.new
restaurant.process_time(0) # => 0
```

```ruby
# constructs
restaurant = double :Restaurant
io = double :io
order = Order.new(restaurant, io)
```

```ruby
# prints selection
```

_Encode each example as a test. You can add to the above list as you go._

## 5. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green,
refactor to implement the behaviour._
