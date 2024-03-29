# frozen_string_literal: true

class Player
  def initialize(id = 0)
    @id = id
    @moves = []
    @valid_moves = []
  end
  attr_accessor :id, :moves, :valid_moves

  def player_play
    location = nil
    until location
      location = check_location(player_input)
      break if location

      puts "error please enter a valid location for your move!"
    end
    location
  end

  def player_input
    print "#{@id} Choose a digit between 1 and 9: \n"
    gets.chomp.to_i
  end

  def check_location(location)
    return location if valid_input(location) && valid_move(location)
  end

  def valid_input(input)
    return input if (1..9).include?(input)
  end

  def valid_move(move)
    return true unless @moves.include?(move)

    false
  end
end
