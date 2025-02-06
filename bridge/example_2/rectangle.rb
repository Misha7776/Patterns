# frozen_string_literal: true

class Rectangle < Shape
  def draw
    @renderer.render_rectangle
  end
end
