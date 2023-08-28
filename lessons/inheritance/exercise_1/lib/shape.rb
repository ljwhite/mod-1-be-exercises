class Shape

  attr_reader :color, :length, :width

  def initialize(color,length,width)
    @color = color
    @length = length
    @width = width 
  end

  def area
    width * length
  end

  def perimeter
    2 * (width + length)
  end
  # This class should be a parent that creates the following properties:
  # - color
  # - width
  # - length
  # It should also have the following behaviors:
  # - area (width * length)
  # - perimeter (2 * (length + width))

end