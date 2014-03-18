module MoveDiagonal

  def move_diagonal(direction, number=1)

    black = { "diagonal right" => [-number, number], "diagonal left" => [-number, -number] }
    white = { "diagonal right" => [number, number], "diagonal left" => [number, -number] }

    if self.color == "white"
      self.position[0] += white[direction].first
      self.position[1] += white[direction].last
    elsif self.color == "black"
      self.position[0] += black[direction].first
      self.position[1] += black[direction].last
    end

  end

end