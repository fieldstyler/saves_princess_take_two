require 'rspec'
require './lib/game_board'

RSpec.describe "Save Princess" do
  it "Checks that we can successfully create a grid" do
    game_board = GameBoard.new(n: 3, p_location: [2, 2], m_location: [0, 1], grid: [["-m-"], ["---"], ["--p"]])
    expect(game_board.n).to eq(3)
    expect(game_board.p_location).to eq([2, 2])
    expect(game_board.p_location[0]).to eq(2)
    expect(game_board.p_location[1]).to eq(2)
    expect(game_board.m_location).to eq([0, 1])
    expect(game_board.m_location[0]).to eq(0)
    expect(game_board.m_location[1]).to eq(1)
    expect(game_board.grid).to eq([["-m-"], ["---"], ["--p"]])
  end

  it "Prints directions to princess given a game board" do
    game_board1 = GameBoard.new(n: 5, p_location: [4, 1], m_location: [3, 4], grid: [["-----"], ["-----"], ["-----"], ["----m"], ["-p---"]])
    game_board2 = GameBoard.new(n: 3, p_location: [0, 0], m_location: [2, 0], grid: [["p--"], ["---"], ["m--"]])
    expect(game_board1.next_move).to eq("DOWN")
    expect(game_board2.next_move).to eq("UP")
  end

end
