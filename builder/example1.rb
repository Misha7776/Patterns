
class Meal
  attr_accessor :main_course, :side, :drink

  def initialize(main_course = nil, side = nil, drink = nil)
    @main_course = main_course
    @side = side
    @drink = drink
  end

  def details
    "Main Course: #{@main_course}, Side: #{@side}, Drink: #{@drink}"
  end
end

class MealBuilder
  def set_main_course; end
  def set_side; end
  def set_drink; end
  def build; end
end

class BurgerMealBuilder < MealBuilder
  def initialize
    @meal = Meal.new
  end

  def set_main_course
    @meal.main_course = "Burger"
  end

  def set_side
    @meal.side = "Fries"
  end

  def set_drink
    @meal.drink = "Soda"
  end

  def build
    @meal
  end
end

class PizzaMealBuilder < MealBuilder
  def initialize
    @meal = Meal.new
  end

  def set_main_course
    @meal.main_course = "Pizza"
  end

  def set_side
    @meal.side = "Garlic Bread"
  end

  def set_drink
    @meal.drink = "Juice"
  end

  def build
    @meal
  end
end

class MealDirector
  def initialize(builder)
    @builder = builder
  end

  def construct_meal
    @builder.set_main_course
    @builder.set_side
    @builder.set_drink
    @builder.build
  end
end

# Client Code

# Create a Burger Meal
burger_builder = BurgerMealBuilder.new
director = MealDirector.new(burger_builder)
burger_meal = director.construct_meal
puts "Burger Meal: #{burger_meal.details}"

# Create a Pizza Meal
pizza_builder = PizzaMealBuilder.new
director = MealDirector.new(pizza_builder)
pizza_meal = director.construct_meal
puts "Pizza Meal: #{pizza_meal.details}"
