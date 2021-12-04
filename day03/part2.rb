input_file = File.join(File.dirname(__FILE__), 'input.txt')

codes = File.open(input_file).map { |b| b.chomp.chars }

def most_common_bit(codes, index)
  code = codes.transpose[index]

  if code.count('0') > code.count('1')
    '0'
  elsif code.count('0') == code.count('1')
    '1'
  else
    '1'
  end
end

def least_common_bit(codes, index)
  code = codes.transpose[index]

  if code.count('0') < code.count('1')
    '0'
  elsif code.count('0') == code.count('1')
    '0'
  else
    '1'
  end
end

oxygen_codes = codes.dup
indices = (0..oxygen_codes.size - 1).to_a
indices.each do |index|
  bit = most_common_bit(oxygen_codes, index)
  oxygen_codes.select! { |c| c[index] == bit }
  break if oxygen_codes.size == 1
end

co2_codes = codes.dup
indices = (0..co2_codes.size - 1).to_a
indices.each do |index|
  bit = least_common_bit(co2_codes, index)
  co2_codes.select! { |c| c[index] == bit }
  break if co2_codes.size == 1
end

oxygen_generator_rating = oxygen_codes.first.join.to_i(2)
co2_scrubber_rating = co2_codes.first.join.to_i(2)

puts "The life support rating of the submarine is #{oxygen_generator_rating * co2_scrubber_rating}."
