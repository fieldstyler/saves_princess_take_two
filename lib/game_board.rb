class GameBoard
  attr_reader :n, :p_location, :m_location, :grid
  def initialize(game_hash)
    @n = game_hash[:n]
    @p_location = game_hash[:p_location]
    @m_location = game_hash[:m_location]
    @grid = game_hash[:grid]
  end

  def display_path_to_princess
    p_row = @p_location[0]
    m_row = @m_location[0]
    p_column = @p_location[1]
    m_column = @m_location[1]
    print_directions_to_princess(p_row, m_row, p_column, m_column)
  end
end

def print_directions_to_princess(p_row, m_row, p_column, m_column)
  directions = ""
  if p_row > m_row
    until p_row == m_row
      m_row += 1
      directions += "DOWN\n"
    end
  elsif p_row < m_row
    until p_row == m_row
      m_row -= 1
      directions += "UP\n"
    end
  end
  if p_column > m_column
    until p_column - m_column == 1
      m_column += 1
      directions += "RIGHT\n"
    end
    directions += "RIGHT"
  elsif p_column < m_column
    until m_column - p_column == 1
      m_column -= 1
      directions += "LEFT\n"
    end
    directions += "LEFT"
  end
  directions
end
