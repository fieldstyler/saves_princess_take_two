require 'rspec'
require './lib/save_princess_take_two'

RSpec.describe "Save Princess" do
  it "Checks that we can successfully create a grid" do
    game_board = GameBoard.new(n: 5, p_location: [0, 4], m_location: [2, 2], grid: [["----p"], ["-----"], ["--m--"], ["-----"], ["-----"]])
    expect(game_board.n).to eq(5)
    expect(game_board.p_location).to eq([0, 4])
    expect(game_board.p_location[0]).to eq(0)
    expect(game_board.p_location[1]).to eq(4)
    expect(game_board.m_location).to eq([2, 2])
    expect(game_board.m_location[0]).to eq(2)
    expect(game_board.m_location[1]).to eq(2)
    expect(game_board.grid).to eq([["----p"], ["-----"], ["--m--"], ["-----"], ["-----"]])
  end

  it "Prints directions to princess given a game board" do
    game_board1 = GameBoard.new(n: 5, p_location: [0, 4], m_location: [2, 2], grid: [["----p"], ["-----"], ["--m--"], ["-----"], ["-----"]])
    game_board2 = GameBoard.new(n: 3, p_location: [2, 0], m_location: [1, 1], grid: [["---"], ["-m-"], ["p--"]])
    game_board3 = GameBoard.new(n: 5, p_location: [4, 4], m_location: [2, 2], grid: [["-----"], ["-----"], ["--m--"], ["-----"], ["----p"]])
    expect(display_path_to_princess(game_board1)).to eq("UP\nUP\nRIGHT\nRIGHT")
    expect(display_path_to_princess(game_board2)).to eq("DOWN\nLEFT")
    expect(display_path_to_princess(game_board3)).to eq("DOWN\nDOWN\nRIGHT\nRIGHT")
  end

end
