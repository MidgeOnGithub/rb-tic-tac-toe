module Player
  X = 1
  O = 2
  NONE = 0
end

class Game
  include Player

  attr_reader :board, :game_over, :whose_turn

  def initialize
    @whose_turn = Player::X
    @game_over = false
    @board = [Array.new(3, Player::NONE),
              Array.new(3, Player::NONE),
              Array.new(3, Player::NONE)]
  end

  def play(tile)
    return if @game_over
    return unless valid? tile

    row, column = tile.divmod 3
    @board[row][column] = @whose_turn
    handle_result

    true
  end

  def to_s
    rows = []
    (0..2).each do |i|
      rows[i] = @board[i].join(' | ')
    end
    display = rows.join("\n--+---+--\n")
    puts display
  end

  private

  def handle_result
    if winner?
      @game_over = true
    else
      switch_turns
    end
  end

  def winner?
    [row_win?, column_win?, diagonal_win?].any?
  end

  def valid? tile
    tile >= 0 && tile <= 8 && tile_empty?(tile)
  end

  def tile_empty?(tile)
    row, column = tile.divmod 3
    unless @board[row][column] == Player::NONE
      puts 'Tile has already been played!'
      return false
    end
    true
  end

  def row_win?
    @board.reject { |row| row.include? Player::NONE }
          .any? { |row| row.uniq.size == 1 }
  end

  def column_win?
    (0..2).each do |i|
      column = @board.map { |row| row[i] }
      next if column.include? Player::NONE
      return true if column.uniq.size == 1
    end
    false
  end

  def diagonal_win?
    top_left_diag = [@board[0][0], @board[1][1], @board[2][2]]
    opposing_diag = [@board[0][2], @board[1][1], @board[2][0]]
    [top_left_diag, opposing_diag].reject { |diag| diag.include? Player::NONE }
                                  .any? { |diag| diag.uniq.size == 1 }
  end

  def switch_turns
    @whose_turn = if @whose_turn == Player::X
                    Player::O
                  else
                    Player::X
                  end
  end
end
