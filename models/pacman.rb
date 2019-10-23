require_relative 'character'
require 'pry'

ANGLE_HASH = { up: 315, down: 135, left: 225, right: 45 }.freeze

class Pacman < Character
  def initialize
    super(x: 320, y: 320, image_path: 'media/pacman_open.png')
    @image2 = Gosu::Image.new('media/pacman_closed.png')
    @images = [@image, @image, @image, @image, @image2, @image2, @image2, @image2]
    @index = 0
  end

  def draw
    @images[@index].draw_rot(@x, @y, 1, ANGLE_HASH[@direction])
    @index += 1
    @index %= 8
  end

  def pacman_range
    @x_range = (@x - 21)..(@x + 21)
    @y_range = (@y - 21)..(@y + 21)
    [@x_range, @y_range]
  end

  def move(walls)
    case @direction
    when :up
      @y -= @velocity
    when :down
      @y += @velocity
    when :left
      @x -= @velocity unless hits_wall?(walls)
    when :right
      @x += @velocity
    end
  end

  def hits_wall?(walls)
    walls.each do |wall_range|
      return true if !(wall_range[0].to_a & pacman_range[0].to_a).empty? && !(wall_range[1].to_a & pacman_range[1].to_a).empty?
    end
    false
  end
end
