input = ARGF.read
lines = input.strip.split("\n")
n = lines[0].to_i
r,c = lines[1].strip.split.map {|n| n.to_i}
grid = lines[2..-1]

class GameBoard
  attr_reader :n, :grid, :m_location, :p_location
  def initialize(n, grid)
    @n = n
    @grid = grid
    @m_location = find_location('m')
    @p_location = find_location('p')
  end

  def find_location(letter, coords=[], row_number=0)
    @grid.each_with_index do |row, index|
      if row.include?(letter)
        coords << row_number
        coords << row.index(letter)
      end
      row_number += 1
    end
    coords
  end

  def next_move(m=@m_location, p=@p_location)
    case
    when m[0] > p[0]; move = "UP"
    when m[0] < p[0]; move = "DOWN"
    when m[0] == p[0] && m[1] > p[1]; move = "LEFT"
    when m[0] == p[0] && m[1] < p[1]; move = "RIGHT"
    end
  end
end

save_princess_2 = GameBoard.new(n, grid)
puts save_princess_2.next_move
