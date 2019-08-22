require_relative 'game.rb'
require_relative 'util.rb'

def intro
  puts "Welcome to Midge's Tic-Tac-Toe game!"

  if ask 'Would you like to play?'
    main
  else
    goodbye
  end
end

def main
  loop do
    game
    break unless play_again?
  end

  goodbye
end

def game
  g = Game.new
  loop do
    puts 'Player ' + g.whose_turn.to_s + ', select a tile. [1-9]'
    puts g.to_s
    loop do
      break if g.play(choose_tile)
    end
    break if g.game_over
  end
  puts 'Player ' + g.whose_turn.to_s + ' won!'
end

def choose_tile
  tile = gets.chomp.to_i
  while (tile < 1) || (tile > 9)
    puts 'Please indicate a valid number from 1 - 9: '
    tile = gets.chomp.to_i
  end
  tile - 1 # Convert to an array's index value.
end

def play_again?
  ask 'Play another game?'
end

def goodbye
  puts 'Thanks for playing!'
end

intro if $PROGRAM_NAME == __FILE__
