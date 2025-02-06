# frozen_string_literal: true

class Shape
  def initialize(renderer)
    @renderer = renderer
  end

  def draw
    raise NotImplementedError
  end
end
