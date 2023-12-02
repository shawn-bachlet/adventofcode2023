def digit_codex
  {
    "one" => "1",
    "two" => "2",
    "three" => "3",
    "four" => "4",
    "five" => "5",
    "six" => "6",
    "seven" => "7",
    "eight" => "8",
    "nine" => "9",
    "zero" => "0"
  }
end


def grab_first_number(line)
  digit_with_index = grab_first_digit_number(line)
  text_digit_with_index = grab_first_text_number(line)

  return digit_with_index[0] if text_digit_with_index[1].nil?
  return text_digit_with_index[0] if digit_with_index[1].nil?

  if digit_with_index[1] < text_digit_with_index[1]
    digit_with_index[0]
  else
    text_digit_with_index[0]
  end
end

def grab_first_digit_number(line)
  line.each_char.with_index do |c, index|
    if c.match(/\d/)
      return [c.to_i, index]
    end
  end
  nil
end

def grab_first_text_number(line)
  matches = digit_codex.keys.map { |key| [line.index(key), key] }.compact
  first_match = matches.min_by { |match| match[0] || Float::INFINITY }
  first_match ? [digit_codex[first_match[1]].to_i, first_match[0]] : nil
end

def grab_last_digit_number(line)
  line.reverse.each_char.with_index do |c, index|
    if c.match(/\d/)
      return [c.to_i, index]
    end
  end
  nil
end

def grab_last_text_number(line)
  matches = digit_codex.keys.map { |key| [line.reverse.index(key.reverse), key] }.compact
  first_match = matches.min_by { |match| match[0] || Float::INFINITY }
  first_match ? [digit_codex[first_match[1]].to_i, first_match[0]] : nil
end

def grab_last_number(line)
  digit_with_index = grab_last_digit_number(line)
  text_digit_with_index = grab_last_text_number(line)

  return digit_with_index[0] if text_digit_with_index[1].nil?
  return text_digit_with_index[0] if digit_with_index[1].nil?

  if digit_with_index[1] < text_digit_with_index[1]
    digit_with_index[0]
  else
    text_digit_with_index[0]
  end
end

count = 0

File.open("./days/day1/day1.txt").each do |line| 
  begin
    
    count += "#{grab_first_number(line)}#{grab_last_number(line)}".to_i
  rescue StandardError => e
      puts e.backtrace.inspect
      puts "Error: #{e.message}"
      puts "Line: #{line}"
  end
end

puts count
