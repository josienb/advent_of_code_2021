input_file = File.join(File.dirname(__FILE__), 'part1_input')

codes = File.open(input_file).map { |b| b.chomp.chars }.transpose

gamma_rate = codes.map { |code| code.count('0') > code.count('1') ? '0' : '1' }.join
epsilon_rate = gamma_rate.chars.map { |c| c == '1' ? '0' : '1' }.join

puts "Gamma rate multiplied by epsilon rate is #{gamma_rate.to_i(2) * epsilon_rate.to_i(2)}."
