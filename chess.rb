require_relative 'chess_piece'
require_relative 'chess_player'
require_relative 'chess_board'
require 'pp'
require 'debugger'

class ChessGame

  attr_reader :players, :board

  def initialize
    @pieces = [ Rook.new("white", [0,0], 1), Knight.new("white", [0,1], 1), Bishop.new("white", [0,2] , 1), King.new("white", [0,3], 1), Queen.new("white", [0,4], 1), Bishop.new("white", [0,5], 1), Knight.new("white", [0,6], 1), Rook.new("white", [0,7],1) ,
                Pawn.new("white", [1,0], 1), Pawn.new("white", [1,1], 1), Pawn.new("white", [1,2], 1), Pawn.new("white", [1,3], 1), Pawn.new("white", [1,4], 1), Pawn.new("white", [1,5], 1), Pawn.new("white", [1,6], 1), Pawn.new("white", [1,7], 1) ,
                Pawn.new("black", [6,0], 2), Pawn.new("black", [6,1], 2), Pawn.new("black", [6,2], 2), Pawn.new("black", [6,3], 2), Pawn.new("black", [6,4], 2), Pawn.new("black", [6,5], 2), Pawn.new("black", [6,6],2), Pawn.new("black", [6,7], 2) ,
                Rook.new("black", [7,0], 2), Knight.new("black", [7,1], 2), Bishop.new("black", [7,2], 2), King.new("black", [7,3], 2), Queen.new("black", [7,4], 2), Bishop.new("black", [7,5], 2), Knight.new("black", [7,6], 2), Rook.new("black", [7,7], 2) ]
    @board = Board.new(@pieces)
    @players = [ Player.new(number: 1, name: PlayerView.create_name, color: "black", pieces: assign_pieces(1), board: @board), Player.new(number: 2, name: PlayerView.create_name, color: "white", pieces: assign_pieces(2), board: @board)]
    @winner = false
  end

  def assign_pieces(i)
    @pieces.select{ |p| p.player == (i) }
  end

  def winner
  end

end

a = ChessGame.new
a.board.populate_board
a.board.draw_board
puts a.players[0].pieces.size
puts a.players[1].pieces.size

until a.winner
  puts "#{a.players[0].name} what piece would you like to move? \n Please provide the name and coordinate of the piece: "
  choice = gets.chomp
  ind = choice =~ /[0-9]/
  place = choice[ind,choice.size].split(",").map!(&:to_i)
  piece = a.board.cells[place.first][place.last]
  puts piece
  puts piece.instance_of?(Object.const_get(choice[0,ind-1]))
  puts "Which direction shall the #{piece.class} move? "
  direction = gets.chomp
  unless piece.is_a?(Pawn) || piece.is_a?(King) || piece.is_a?(Knight)
    puts "How many spaces shall the piece move?"
    number = gets.chomp
  end
  piece.is_a?(Pawn) || piece.is_a?(King) || piece.is_a?(Knight) ? piece.move(direction) : piece.move(direction, number)
  puts piece.position
  full = a.board.cell_full?(piece.position.first, piece.position.last)
  if full
    debugger
    a.players[0].remove_piece(piece.position)
  end
  a.board.populate_board
  a.board.draw_board
end






