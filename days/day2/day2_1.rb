# split the line on the : character
def split_index_draw(line)
  game_index, game_draws = line.split(":")
  [index(game_index), all_game_draws(game_draws).map(&:strip)]
end

def index(game_index)
  game_index.split(" ")[1]
end

def all_game_draws(game_draws)
  game_draws.split(';').map(&:strip)
end

def color_counts(game_draws)
  game_draws.split(',').map(&:strip)
end

def is_valid_round?(counts)
  counts.map do |count|
    color_count, color_color = count.split(' ')
    is_color_valid?(color_color, color_count.to_i)
  end.all?
end

def total_colors
  {
    "red" => 12,
    "green" => 13,
    "blue" => 14,
  }
end


def is_color_valid?(color, color_count)
  total_colors[color] - color_count >= 0
end

def is_valid_game?(game_draws)
  game_draws.map {|x| is_valid_round? color_counts(x)}.all?
end

def part1 
  count = 0
  File.open("days/day2/day2.txt").each do |line| 
    game_index = split_index_draw(line)[0]
  
    count += game_index.to_i if is_valid_game?(split_index_draw(line)[1])
  end
  count
end