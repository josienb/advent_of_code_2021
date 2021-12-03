input_file = File.join(File.dirname(__FILE__), 'input')

moves = {}
moves['forward'] = []
moves['up'] = []
moves['down'] = []

File.open(input_file).each do |m|
  move = m.chomp.split
  moves[move[0]] << move[1].to_i
end

final_horizontal_position = moves['forward'].sum
final_depth = moves['down'].sum - moves['up'].sum

puts "Final horizontal position multiplied by final depth is #{final_horizontal_position * final_depth}."
