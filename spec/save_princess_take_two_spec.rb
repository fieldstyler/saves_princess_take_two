require 'rspec'
require './lib/game_board'

RSpec.describe "Save Princess" do
  it "Checks that we can successfully create a grid" do
    game_board = GameBoard.new(5, ["----p", "-----", "--m--", "-----", "-----"])
    expect(game_board.n).to eq(5)
    expect(game_board.p_location).to eq([0, 4])
    expect(game_board.p_location[0]).to eq(0)
    expect(game_board.p_location[1]).to eq(4)
    expect(game_board.m_location).to eq([2, 2])
    expect(game_board.m_location[0]).to eq(2)
    expect(game_board.m_location[1]).to eq(2)
    expect(game_board.grid).to eq(["----p", "-----", "--m--", "-----", "-----"])
  end

  it "Prints directions to princess given a game board" do
    game_board1 = GameBoard.new(5, ["----p", "-----", "--m--", "-----", "-----"])
    game_board2 = GameBoard.new(3, ["---", "-m-", "p--"])
    game_board3 = GameBoard.new(5, ["-----", "-----", "--m--", "-----", "----p"])
    expect(game_board1.display_path_to_princess).to eq("UP\nUP\nRIGHT\nRIGHT\n")
    expect(game_board2.display_path_to_princess).to eq("DOWN\nLEFT\n")
    expect(game_board3.display_path_to_princess).to eq("DOWN\nDOWN\nRIGHT\nRIGHT\n")
  end
end
