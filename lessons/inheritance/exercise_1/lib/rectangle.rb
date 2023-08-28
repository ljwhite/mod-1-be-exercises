require '../lib/shape'

class Rectangle < Shape

  def initialize(color,length,width)
    @color = color
    @length = length
    @width = width
  end

  # this class should have the following properties:
  # - color
  # - length
  # - width

  #It should have the following methods:
  # - area (width * length)
  # - perimeter (2 * (length + width))

end