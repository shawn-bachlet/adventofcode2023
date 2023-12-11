
def part1(file_path)
  numbers = []
  # Read file into 2D array
  schematic = File.open(file_path).map(&:chars)
  schematic.each_with_index do |line, row| 
    number = ""
    start_index = nil 
    end_index = nil
    # Find the index of each number in the line
    line.each_with_index do |val, column|
      if val.match(/\d/)
        number += val
        start_index = column if start_index.nil?
        end_index = column
      else
        numbers << number.to_i if number != "" && is_symbol_adjacent?(schematic, start_index, end_index, row) 
        number = ""
        start_index = nil
        end_index = nil
      end
    end
  end
  numbers
end

def is_symbol_left?(schematic, start_index, row)
  is_symbol?(schematic[row][start_index-1])
end

def is_symbol_right?(schematic, end_index, row)
  is_symbol?(schematic[row][end_index+1])
end

def is_symbol_above?(schematic, start_index, end_index, row)
  return false if row <= 0
  ((start_index-1)..(end_index+1)).each do |column|
    return true if is_symbol?(schematic[row-1][column])
  end
  return false
end

def is_symbol_below?(schematic, start_index, end_index, row)
  return false if row >= schematic.length-1
  ((start_index-1)..(end_index+1)).each do |column|
    return true if is_symbol?(schematic[row+1][column])
  end
  return false
end

def is_symbol_adjacent?(schematic, start_index, end_index, row)
  return false if start_index.nil? || end_index.nil?

  return true if is_symbol_left?(schematic, start_index, row)
  return true if is_symbol_right?(schematic, end_index, row)
  return true if is_symbol_above?(schematic, start_index, end_index, row)
  return true if is_symbol_below?(schematic, start_index, end_index, row)
end


def is_symbol?(char)
  return false if char.nil?
  # check if char is not a number or a period
  !char.match(/\d/) && char != "." && char != "\n"
end
