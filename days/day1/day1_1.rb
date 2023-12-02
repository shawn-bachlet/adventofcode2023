

def grab_first_number(line)
  line.each_char do |c|
    if c.match(/\d/)
      return c
    end
  end
end

def grab_last_number(line)
  line.reverse.each_char do |c|
    if c.match(/\d/)
      return c
    end
  end
end

count = 0

File.open("day1.txt").each do |line| 
  count += "#{grab_first_number(line)}#{grab_last_number(line)}".to_i
end

puts count
