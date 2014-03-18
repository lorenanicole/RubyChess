require_relative 'chess_board'

class Player

  attr_reader :name, :pieces, :board, :number

  def initialize(options = {})
    @number = options.fetch(:number)
    @name = options.fetch(:name)
    @color = options.fetch(:color)
    @pieces = options.fetch(:pieces)
    @board = options.fetch(:board)
  end

  def remove_piece(location)
    board.all_pieces.delete_if { |p| p.position == location && p.player != number }
  end

end

class PlayerView

  def self.create_name
    puts "What is your name? "
    gets.chomp
  end

end