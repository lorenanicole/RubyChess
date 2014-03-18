class Player

  attr_reader :name

  def initialize(options = {})
    @number = options.fetch(:number)
    @name = options.fetch(:name)
    @color = options.fetch(:color)
  end

end

class PlayerView

  def self.create_name
    puts "What is your name? "
    gets.chomp
  end

end