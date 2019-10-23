class Wall
  attr_reader :x, :y, :width, :height
  def initialize(attr = {})
    @x = attr[:x]
    @y = attr[:y]
    @width = attr[:width]
    @height = attr[:height]
  end

  def coordinate_range
    x_range = @x..(@x + @width)
    y_range = @y..(@y + @height)
    [x_range, y_range]
  end

  def draw
    Gosu.draw_rect(@x, @y, @width, @height, Gosu::Color::WHITE, z = 1, mode = :default)
  end
end
