require_relative 'game.rb'
require_relative 'util.rb'

def row_victory_test
  g = Game.new
  puts 'Nobody should be winning at first' if g.winner?
  play_many(g, [1, 9, 2, 8, 3])
  puts 'Row victory failure!' unless g.winner?
end

def diag_victory_test
  g = Game.new
  play_many(g, [1, 2, 5, 8, 9])
  puts 'Diagonal victory failure!' unless g.winner?
end

def col_victory_test
  g = Game.new
  play_many(g, [1, 2, 4, 8, 7])
  puts 'Column victory failure!' unless g.winner?
end

def player2_victory_test
  g = Game.new
  play_many(g, [1, 2, 9, 8, 7, 5])
  puts 'Player 2 victory failure!' unless g.winner?
end

def play_many(game, tiles)
  tiles.each { |tile| game.play tile }
end

row_victory_test
col_victory_test
diag_victory_test
player2_victory_test

puts 'Tests complete.'
