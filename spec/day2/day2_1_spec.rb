require_relative '../../days/day2/day2_1.rb'
require 'rspec'

describe "day2_1" do
  describe "#split_index_draw" do
    it "splits the line on the : character" do
      expect(split_index_draw(line)).to eq(["1", ["3 blue, 4 red", "1 red, 2 green, 6 blue", "2 green"]])
    end
  end

  describe "#index" do
    it "returns the index" do
      expect(index("Game 1")).to eq("1")
    end
  end

  describe "#all_game_draws" do
    it "returns all game draws" do
      expect(all_game_draws("3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green")).to eq(["3 blue, 4 red", "1 red, 2 green, 6 blue", "2 green"])
    end
  end 

  describe "#color_counts" do
    it "returns all color counts" do
      expect(color_counts("3 blue, 4 red")).to eq(["3 blue", "4 red"])
    end
  end

  describe "#is_valid_round?" do
    it "returns true if the round is valid" do
      expect(is_valid_round?(["3 blue", "4 red"])).to eq(true)
    end

    it "returns false if the round is invalid" do
      expect(is_valid_round?(["3 blue", "15 red"])).to eq(false)
    end
  end

  describe "#total_colors" do
    it "returns the total colors" do
      expect(total_colors).to eq({"red" => 12, "green" => 13, "blue" => 14})
    end
  end 

  describe "#is_color_valid?" do
    it "returns true if the color is valid" do
      expect(is_color_valid?("red", 4)).to eq(true)
      expect(is_color_valid?("red", 12)).to eq(true)
    end

    it "returns false if the color is invalid" do
      expect(is_color_valid?("red", 13)).to eq(false)
    end
  end

  describe "#is_valid_game?" do
    it "returns true if the game is valid" do
      expect(is_valid_game?(["3 blue, 4 red", "1 red, 2 green, 6 blue", "2 green"])).to eq(true)
    end

    it "returns false if the game is invalid" do
      expect(is_valid_game?(["3 blue, 14 red", "1 red, 2 green, 6 blue", "3 green"])).to eq(false)
    end
  end
end