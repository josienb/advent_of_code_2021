input_file = File.join(File.dirname(__FILE__), 'input')

measurements = []
File.open(input_file).each { |m| measurements << m.chomp.to_i }

increased_count = 0

measurements.each_with_index do |m, i|
  next if i == 0

  increased_count += 1 if m > measurements[i - 1]
end

puts "Number of increased measurements is #{increased_count}."
