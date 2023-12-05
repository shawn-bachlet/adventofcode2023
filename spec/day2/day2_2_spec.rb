require_relative '../../days/day2/day2_2.rb'
require 'rspec'

describe "day2_2" do
  describe "#game_power" do
    it "returns the game power" do
      expect(game_power(["3 blue, 4 red", "1 red, 2 green, 6 blue", "2 green"])).to eq(48)
    end
  end
end
 