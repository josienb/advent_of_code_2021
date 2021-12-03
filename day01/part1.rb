measurements = []
File.open('part1_input').each { |m| measurements << m.chomp.to_i }

increased_count = 0

measurements.each_with_index do |m, i|
  next if i == 0

  increased_count += 1 if m > measurements[i - 1]
end

puts "Number of increased measurements is #{increased_count}."
