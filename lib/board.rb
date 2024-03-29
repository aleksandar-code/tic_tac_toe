# frozen_string_literal: true

require_relative './players'

class Board
  def initialize(players = [Player.new(0), Player.new(1)])
    @board = [
        [1, 2, 3],
        [4, 5, 6],
        [7, 8, 9]
      ]
    @players = players
  end
  attr_accessor :board, :players

  def place_at(loc, sym) 
    @board = @board.each do |x|
      x.each_with_index do |y, idx|
        x[idx] = sym if y == loc
      end
    end
  end

  def add_moves(id, loc) 
    @players[0].moves << loc
    @players[1].moves << loc
    @players[id].valid_moves << loc
  end

  def print_board 
    @board.each { |x| print "#{x}\n" }
    print "To play the game you have to enter the coordinates of the move, example for the top left corner: 1\n\n"
  end
end
