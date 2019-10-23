require 'gosu'
require_relative 'models/pacman'
require_relative 'models/wall'

class Window < Gosu::Window
  def initialize
    super 640, 640
    self.caption = "Pacman"
    @pacman = Pacman.new
    @wall_left = Wall.new(x: 0, y: 0, width: 10, height: 640)
    @walls = [@wall_left.coordinate_range]
  end

  def update
    # ...
    @pacman.move(@walls)
  end

  def button_down(id)
    case id
    when Gosu::KB_LEFT then @pacman.direction = :left
    when Gosu::KB_RIGHT then @pacman.direction = :right
    when Gosu::KB_UP then @pacman.direction = :up
    when Gosu::KB_DOWN then @pacman.direction = :down
    end
  end

  def draw
    # ...
    @pacman.draw
    @wall_left.draw
  end
end

Window.new.show
