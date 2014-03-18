module MoveHorizontal

  def move_horizontal(direction, number=1)
    horizontal = { "left" => - number, "right" => number }

    self.position[1] += horizontal[direction]
  end

end