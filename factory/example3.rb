# Step 1: Define the Abstract Shape class (interface)
class Shape
  def draw
    raise NotImplementedError, 'Subclasses must implement draw'
  end
end

# Step 2: Concrete Shape classes implementing the draw method

class Circle < Shape
  def draw
    puts 'Drawing a Circle'
  end
end

class Square < Shape
  def draw
    puts 'Drawing a Square'
  end
end

class Rectangle < Shape
  def draw
    puts 'Drawing a Rectangle'
  end
end

# Step 3: ShapeFactory class with getShape method

class ShapeFactory
  def get_shape(shape_type)
    case shape_type.downcase
    when 'circle'
      Circle.new
    when 'square'
      Square.new
    when 'rectangle'
      Rectangle.new
    else
      raise 'Unknown shape type'
    end
  end
end

# Main Application

# Create a ShapeFactory instance
factory = ShapeFactory.new

# Get user input (you can simulate this for now)
puts "Enter shape type (circle, square, rectangle):"
shape_type = gets.chomp

# Use ShapeFactory to create the shape
shape = factory.get_shape(shape_type)

# Draw the shape
shape.draw
