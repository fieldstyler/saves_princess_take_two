input = ARGF.read
lines = input.strip.split("\n")
n = lines[0].to_i
grid = lines[1..-1]

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

  def display_path_to_princess
    directions(@m_location, @p_location)
  end
end

def directions(m, p, steps="")
  diff = (m[0] - p[0]).abs
  if m[0] > p[0]
    diff.times do steps += "UP\n" end
  else
    diff.times do steps += "DOWN\n" end
  end
  steps += horizontal_directions(m, p)
end

def horizontal_directions(m, p, steps="")
  diff = (m[1] - p[1]).abs
  if m[1] > p[1]
    diff.times do steps += "LEFT\n" end
  else
    diff.times do steps += "RIGHT\n" end
  end
  steps
end

bot_saves_princess = GameBoard.new(n, grid)
puts bot_saves_princess.display_path_to_princess()
