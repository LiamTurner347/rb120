# GOAL:
# Create an application that allows you to add "products" to a shopping basket.
# So define the CLASSES for each product (make 3).
# Products should have a name and a price (an integer).
# Add products to the shopping basket
# At checkout calculate total_price of ALL products.

class ShoppingBasket
  attr_reader :cart

  def initialize
    @cart = []
  end

  def <<(item)
    cart.push(item)
  end
end

class Product
  attr_reader :name, :price

  def initialize(name, price)
    @name = name
    @price = price.to_f
  end
end

class Mushrooms < Product; end

class Milk < Product; end

class Potatoes < Product; end

class CheckoutDesk
  def total_price(basket)
    prices = basket.cart.map do |item|
      item.price
    end

    prices.inject(:+)
  end
end

basket = ShoppingBasket.new
mushrooms = Mushrooms.new("mushrooms", 1)
milk = Milk.new("milk", 1.15)
taties = Potatoes.new("potatoes", 0.65)

basket << mushrooms
basket << milk
basket << taties

checkout = CheckoutDesk.new
p checkout.total_price(basket)
