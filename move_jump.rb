module MoveJump

  def move_jump(direction)

    white = { "right forward jump" => [1, 2], "right backward jump" => [-1, 2], "left forward jump" => [1, -2], "left backward jump" => [-1, -2], "forward right jump" => [2, 1], "forward left jump" => [2, -1], "backward right jump" => [-2, 1], "backward left jump" => [-2, -1]}
    black = { "right forward jump" => [-1, 2], "right backward jump" => [-1, 2], "left forward jump" => [-1, -2], "left backward jump" => [-1, -2], "forward right jump" => [-2, 1], "forward left jump" => [-2, -1], "backward right jump" => [-2, 1], "backward left jump" => [-2, -1]}

    if self.color == "white"
      self.position[0] += white[direction].first
      self.position[1] += white[direction].last
    elsif self.color == "black"
      self.position[0] += black[direction].first
      self.position[1] += black[direction].last
    end

  end

end