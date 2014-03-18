require_relative 'chess_piece'
require_relative 'chess_player'
require_relative 'chess_board'
require 'pp'
require 'debugger'

class ChessGame

  attr_reader :players, :board

  def initialize
    @players = []
    @board = Board.new
    @winner = false
  end

  def run!
    @players.push(Player.new(number: 1, name: PlayerView.create_name, color: "black"), Player.new(number: 2, name: PlayerView.create_name, color: "white"))
  end

  def winner
  end

end

a = ChessGame.new
a.run!
a.board.populate_board
a.board.draw_board

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
  a.board.populate_board
  a.board.draw_board
end






