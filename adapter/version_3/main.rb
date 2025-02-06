# Class with a compatible interface: RoundHole
class RoundHole
  def initialize(radius)
    @radius = radius
  end

  def get_radius
    @radius
  end

  def fits?(peg)
    get_radius >= peg.get_radius
  end
end

# Class with a compatible interface: RoundPeg
class RoundPeg
  def initialize(radius)
    @radius = radius
  end

  def get_radius
    @radius
  end
end

# Legacy incompatible class: SquarePeg
class SquarePeg
  def initialize(width)
    @width = width
  end

  def get_width
    @width
  end
end

# Adapter allows using SquarePeg with RoundHole
class SquarePegAdapter < RoundPeg
  def initialize(peg)
    @peg = peg
  end

  def get_radius
    # Calculate half the diagonal of the square peg using Pythagoras' theorem
    @peg.get_width * Math.sqrt(2) / 2
  end
end

# Client code
hole = RoundHole.new(5)
rpeg = RoundPeg.new(5)
puts hole.fits?(rpeg) # TRUE

small_sqpeg = SquarePeg.new(5)
large_sqpeg = SquarePeg.new(10)

# The following would raise an error because SquarePeg is not compatible
# hole.fits?(small_sqpeg) # Error: incompatible types

small_sqpeg_adapter = SquarePegAdapter.new(small_sqpeg)
large_sqpeg_adapter = SquarePegAdapter.new(large_sqpeg)

puts hole.fits?(small_sqpeg_adapter) # TRUE
puts hole.fits?(large_sqpeg_adapter) # FALSE
