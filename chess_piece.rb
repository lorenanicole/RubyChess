require 'debugger'
require_relative 'move_vertical'
require_relative 'move_horizontal'
require_relative 'move_diagonal'
require_relative 'move_jump'

class Piece

  attr_reader :color, :position, :player

  def initialize(color, position, player)
    @color = color
    @position = position
    @player = player
  end

  def move(direction, number=1)
    num = number.to_i
    direction.downcase!
  end

end

class Rook < Piece

  include MoveVertical
  include MoveHorizontal

  def move(direction, number=1)
    super

    num = number.to_i

    if direction == "forward" || direction == "backward"
      move_vertical(direction, num)
    elsif direction == "left" || direction == "right"
      move_horizontal(direction, num)
    end
  end

end

class Queen < Piece

  include MoveVertical
  include MoveHorizontal
  include MoveDiagonal

  def move(direction, number=1)
    super

    num = number.to_i

    if direction == "forward" || direction == "backward"
      move_vertical(direction, num)
    elsif direction == "left" || direction == "right"
      move_horizontal(direction, num)
    elsif direction == "diagonal right" || direction == "diagonal left"
      move_diagonal(direction, num)
    end

  end

end

class King < Piece

  include MoveVertical
  include MoveHorizontal
  include MoveDiagonal

  def move(direction, number=1)
    super

    num = number.to_i

    if direction == "forward" || direction == "backward"
      move_vertical(direction, num)
    elsif direction == "left" || direction == "right"
      move_horizontal(direction, num)
    elsif direction == "diagonal right" || direction == "diagonal left"
      move_diagonal(direction, num)
    end

  end

end

class Pawn < Piece

  include MoveVertical

  def move(direction, number=1)
    super

    num = number.to_i

    if direction == "forward" || direction == "backward"
      move_vertical(direction, num)
    end
  end

end

class Bishop < Piece

  include MoveDiagonal

  def move(direction, number=1)
    super

    num = number.to_i

    if direction == "diagonal right" || direction == "diagonal left"
      move_diagonal(direction, num)
    end

  end

end

class Knight < Piece

  include MoveJump

  def move(direction)

    if direction.match(/jump/)
      move_jump(direction)
    end

  end

end

