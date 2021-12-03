input_file = File.join(File.dirname(__FILE__), 'part1_input')

aim = 0
depth = 0
horizontal_position = 0

File.open(input_file).each do |m|
  move = m.chomp.split
  case move[0]
  when 'forward'
    horizontal_position += move[1].to_i
    depth += aim * move[1].to_i
  when 'up'
    aim -= move[1].to_i
  when 'down'
    aim += move[1].to_i
  end
end

puts "Final horizontal position multiplied by final depth is #{horizontal_position * depth}."
