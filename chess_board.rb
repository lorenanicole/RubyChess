require_relative 'chess_piece'

class Board

  attr_reader :cells

  def initialize
    @cells = Array.new(8) { Array.new(8) }
    @pieces = [ Rook.new("white", [0,0]), Knight.new("white", [0,1] ), Bishop.new("white", [0,2]), King.new("white", [0,3]), Queen.new("white", [0,4]), Bishop.new("white", [0,5]), Knight.new("white", [0,6]), Rook.new("white", [0,7]) ,
                Pawn.new("white", [1,0]), Pawn.new("white", [1,1] ), Pawn.new("white", [1,2]), Pawn.new("white", [1,3]), Pawn.new("white", [1,4]), Pawn.new("white", [1,5]), Pawn.new("white", [1,6]), Pawn.new("white", [1,7]) ,
                Pawn.new("black", [6,0]), Pawn.new("black", [6,1] ), Pawn.new("black", [6,2]), Pawn.new("black", [6,3]), Pawn.new("black", [6,4]), Pawn.new("black", [6,5]), Pawn.new("black", [6,6]), Pawn.new("black", [6,7]) ,
                Rook.new("black", [7,0]), Knight.new("black", [7,1] ), Bishop.new("black", [7,2]), King.new("black", [7,3]), Queen.new("black", [7,4]), Bishop.new("black", [7,5]), Knight.new("black", [7,6]), Rook.new("black", [7,7]) ]
  end

  def populate_board
    @cells = Array.new(8) { Array.new(8) }
    @pieces.each do |p|
      @cells[p.position[0]][p.position[1]] = p
    end
  end

  def draw_board
    puts "   0      1      2      3      4      5      6      7"
    @cells.each_with_index do |v, i|
      print "#{i}  "
      @cells[i].size.times do |num|
        print @cells[i][num].color[0] + @cells[i][num].class.to_s[0] + "  |  " if @cells[i][num] != nil
        print "X   |  " if @cells[i][num] == nil
      end
      puts
    end
  end
end
