# Component
class Product
  def get_price
    raise NotImplementedError, "This method must be implemented by subclasses"
  end

  def show_details
    raise NotImplementedError, "This method must be implemented by subclasses"
  end
end

# Leaf (Simple Product)
class SimpleProduct < Product
  attr_reader :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end

  def get_price
    price
  end

  def show_details
    "#{name}: $#{price}"
  end
end

# Composite (Product Bundle)
class ProductBundle < Product
  attr_reader :name

  def initialize(name)
    @name = name
    @products = []
  end

  def add_product(product)
    @products << product
  end

  def remove_product(product)
    @products.delete(product)
  end

  def get_price
    @products.reduce(0) { |sum, product| sum + product.get_price }
  end

  def show_details
    details = "#{name} Bundle:\n"
    @products.each { |product| details += "  - #{product.show_details}\n" }
    details
  end
end

# Usage Example

# Individual products
laptop = SimpleProduct.new("Laptop", 1000)
phone = SimpleProduct.new("Phone", 700)
headphones = SimpleProduct.new("Headphones", 200)

# Create a bundle
electronics_bundle = ProductBundle.new("Electronics")
electronics_bundle.add_product(laptop)
electronics_bundle.add_product(phone)
electronics_bundle.add_product(headphones)

# Sub-bundle
accessory_bundle = ProductBundle.new("Accessories")
mouse = SimpleProduct.new("Mouse", 50)
keyboard = SimpleProduct.new("Keyboard", 100)
accessory_bundle.add_product(mouse)
accessory_bundle.add_product(keyboard)

# Add sub-bundle to main bundle
electronics_bundle.add_product(accessory_bundle)

# Display details and calculate total price
puts electronics_bundle.show_details
puts "Total Price: $#{electronics_bundle.get_price}"
