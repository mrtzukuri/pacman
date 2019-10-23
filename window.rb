require 'gosu'

class Window < Gosu::Window
  def initialize
    super 800, 800
    self.caption = "Pac Man"
  end

  def update
    # ...
  end

  def draw
    # ...
  end
end

Window.new.show
