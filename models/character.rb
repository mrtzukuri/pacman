require 'gosu'
require 'pry'

VELOCITY = 1
DIRECTIONS = %i[up down left right].freeze

class Character
  attr_accessor :direction
  def initialize(attributes = {})
    @image = Gosu::Image.new(attributes[:image_path])
    @x = attributes[:x]
    @y = attributes[:y]
    @velocity = VELOCITY
    @direction = attributes[:direction] || DIRECTIONS.sample
  end

  def warp(x, y)
    @x, @y = x, y
  end

  def move
    case @direction
    when :up then @y -= @velocity
    when :down then @y += @velocity
    when :left then @x -= @velocity
    when :right then @x += @velocity
    end
  end

  def draw
    @image.draw(@x, @y, 1, 0.05, 0.05)
  end
end
