require_relative 'chess_piece'

class Board

  attr_reader :cells, :all_pieces

  def initialize(all_pieces)
    @cells = Array.new(8) { Array.new(8) }
    @all_pieces = all_pieces
  end

  def populate_board
    @cells = Array.new(8) { Array.new(8) }
    @all_pieces.each do |p|
      @cells[p.position[0]][p.position[1]] = p
    end
  end

  def draw_board
    puts "   0       1       2       3       4       5       6       7"
    @cells.each_with_index do |v, i|
      print "#{i}  "
      @cells[i].size.times do |num|
        print @cells[i][num].color[0] + @cells[i][num].class.to_s[0..1] + "  |  " if @cells[i][num] != nil
        print "X    |  " if @cells[i][num] == nil
      end
      puts
    end
  end

  def cell_full?(x,y)
    !@cells[x][y].nil?
  end

end
