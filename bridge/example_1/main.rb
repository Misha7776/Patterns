# Abstraction
class Shape
  def initialize(renderer)
    @renderer = renderer
  end
end

class Circle < Shape
  def draw
    @renderer.render_circle
  end
end

class Square < Shape
  def draw
    @renderer.render_square
  end
end

# Implementation
class Renderer
  def render_circle; end
  def render_square; end
end

class OpenGLRenderer < Renderer
  def render_circle
    puts "Rendering Circle with OpenGL"
  end
  def render_square
    puts "Rendering Square with OpenGL"
  end
end

class DirectXRenderer < Renderer
  def render_circle
    puts "Rendering Circle with DirectX"
  end
  def render_square
    puts "Rendering Square with DirectX"
  end
end

# Usage: Composition rather than inheritance
circle = Circle.new(OpenGLRenderer.new)
circle.draw # Output: Rendering Circle with OpenGL

square = Square.new(DirectXRenderer.new)
square.draw # Output: Rendering Square with DirectX
