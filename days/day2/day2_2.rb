require_relative '../day2/day2_1.rb'

count = 0

def min_set
end

def game_power(game_draws)
  min_set = 
    {
      "red" => -1,
      "green" => -1,
      "blue" => -1
    }
  game_draws.map do |draw|
    color_counts(draw).map do |count|
      color_count, color_color = count.split(' ')
      # min_set[color_color] = color_count.to_i if min_set[color_color] == -1
      min_set[color_color] = color_count.to_i if color_count.to_i > min_set[color_color]
    end
  end
  min_set["red"] * min_set["green"] * min_set["blue"]
end

def part2 
  count = 0
  File.open("days/day2/day2.txt").each do |line| 
    count += game_power(split_index_draw(line)[1])
  end
  count
end