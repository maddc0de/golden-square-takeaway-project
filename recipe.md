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

![design](golden-square-takeaway-project/recipe.md "Diagram")


_interface design of each class in more detail._

```ruby
class Restaurant
  def initialize
    @dishes = []  # array of hashes with diff dishes and prices
  end

  def confirm(order) # order is an instance of order
    
  end
end
```

```ruby
class Order
  def initialize(Restaurant) # instance of restaurant
    basket = []
    checkout = false
  end

  def view_menu
    # returns a list of dishes with prices in the restaurant's menu that customer can see
  end

  def select(dish) # dish is a string
    # adds dish to basket
  end

  def unselect(dish) # dish is a string
    # removes dish to basket
  end

  def view_basket
    # returns a list of selected dishes that customer can see
  end

  def checkout
    # returns true
  end
end
```

```ruby
class OrderReceipt
  def initialize

  end

  def total_price
    # returns sum of dishes ordered
  end

  def view_receipt(order)
    # shows a list of the dishes ordered with prices and the grand total
  end

  def confirm_order
    # returns time of order
  end

end
```

## 3. Create Examples as Integration Tests

_Create examples of the classes being used together in different situations and
combinations that reflect the ways in which the system will be used._

```ruby
# EXAMPLE

# Gets all tracks
library = MusicLibrary.new
track_1 = Track.new("Carte Blanche", "Veracocha")
track_2 = Track.new("Synaesthesia", "The Thrillseekers")
library.add(track_1)
library.add(track_2)
library.all # => [track_1, track_2]
```

## 4. Create Examples as Unit Tests

_Create examples, where appropriate, of the behaviour of each relevant class at
a more granular level of detail._

```ruby
# EXAMPLE

# Constructs a track
track = Track.new("Carte Blanche", "Veracocha")
track.title # => "Carte Blanche"
```

_Encode each example as a test. You can add to the above list as you go._

## 5. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green,
refactor to implement the behaviour._
