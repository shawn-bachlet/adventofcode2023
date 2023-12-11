require_relative '../../days/day3/day3_1.rb'
require 'rspec'

describe "day3_1" do
  it "returns 4361 for the example input" do
    file_path = "spec/day3/example.txt"
    expect(part1(file_path).sum).to eq(4361)
  end

  describe "#is_symbol_left?" do
    it "returns true if the symbol is left of the number" do
      schematic = [".#123.".chars, "......".chars]
      start_index = 2
      end_index = 4
      row = 0
      expect(is_symbol_left?(schematic, start_index, row)).to eq(true)
    end

    it "returns false if a symbol is not left of the number" do
      schematic = ["#.123.".chars, "......".chars]
      start_index = 2
      end_index = 4
      row = 0
      expect(is_symbol_left?(schematic, start_index, row)).to eq(false)
    end
  end

  describe "#is_symbol_right?" do
    it "returns true if the symbol is right of the number" do
      schematic = ["..123$.".chars, "......".chars]
      start_index = 2
      end_index = 4
      row = 0
      expect(is_symbol_right?(schematic, end_index, row)).to eq(true)
    end

    it "returns false if a symbol is not right of the number" do
      schematic = ["..123.@".chars, "......".chars]
      start_index = 2
      end_index = 4
      row = 0
      expect(is_symbol_right?(schematic, end_index, row)).to eq(false)
    end
  end

  describe "#is_symbol_above?" do
    it "returns true if the symbol is above the number" do
      start_index = 2
      end_index = 4
      row = 1
      schematic = [".$.....".chars, "..123..".chars]
      expect(is_symbol_above?(schematic, start_index, end_index, row)).to eq(true)
      schematic = ["..$....".chars, "..123..".chars]
      expect(is_symbol_above?(schematic, start_index, end_index, row)).to eq(true)
      schematic = ["...$...".chars, "..123..".chars]
      expect(is_symbol_above?(schematic, start_index, end_index, row)).to eq(true)
      schematic = ["....$..".chars, "..123..".chars]
      expect(is_symbol_above?(schematic, start_index, end_index, row)).to eq(true)
      schematic = [".....$.".chars, "..123..".chars]
      expect(is_symbol_above?(schematic, start_index, end_index, row)).to eq(true)
    end

    it "returns false if a symbol is not above the number" do
      start_index = 2
      end_index = 4
      row = 1
      schematic = ["@......".chars, "..123..".chars]
      expect(is_symbol_above?(schematic, start_index, end_index, row)).to eq(false)
      schematic = ["......@".chars, "..123..".chars]
      expect(is_symbol_above?(schematic, start_index, end_index, row)).to eq(false)
    end

    it "returns false if the row is 0" do
      start_index = 2
      end_index = 4
      row = 0
      schematic = [".$.....".chars, "..123..".chars]
      expect(is_symbol_above?(schematic, start_index, end_index, row)).to eq(false)
    end
  end

  describe "#is_symbol_below?" do
    it "returns true if the symbol is below the number" do
      start_index = 2
      end_index = 4
      row = 0
      schematic = ["..123..".chars, ".$.....".chars]
      expect(is_symbol_below?(schematic, start_index, end_index, row)).to eq(true)
      schematic = ["..123..".chars, "..$....".chars]
      expect(is_symbol_below?(schematic, start_index, end_index, row)).to eq(true)
      schematic = ["..123..".chars, "...$...".chars]
      expect(is_symbol_below?(schematic, start_index, end_index, row)).to eq(true)
      schematic = ["..123..".chars, "....$..".chars]
      expect(is_symbol_below?(schematic, start_index, end_index, row)).to eq(true)
      schematic = ["..123..".chars, ".....$.".chars]
      expect(is_symbol_below?(schematic, start_index, end_index, row)).to eq(true)
    end

    it "returns false if a symbol is not below the number" do
      start_index = 2
      end_index = 4
      row = 0
      schematic = ["..123..".chars, "@......".chars]
      expect(is_symbol_below?(schematic, start_index, end_index, row)).to eq(false)
      schematic = ["..123..".chars, "......@".chars]
      expect(is_symbol_below?(schematic, start_index, end_index, row)).to eq(false)
    end

    it "returns false if the row is the last row" do
      start_index = 2
      end_index = 4
      row = 1
      schematic = ["..123..".chars, ".$.....".chars]
      expect(is_symbol_below?(schematic, start_index, end_index, row)).to eq(false)
    end
  end
end