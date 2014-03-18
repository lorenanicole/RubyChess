module MoveVertical

  def move_vertical(direction, number=1)
    white = { "forward" => number, "backward" => - number }
    black = { "forward" => - number, "backward" => number }
    self.color == "white" ? self.position[0] += white[direction] : self.position[0] += black[direction]
  end

end
