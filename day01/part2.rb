input_file = File.join(File.dirname(__FILE__), 'input.txt')

measurements = []
File.open(input_file).each { |m| measurements << m.chomp.to_i }

measurement_windows = []
measurements.each_with_index do |m, i|
  number_two = measurements[i + 1]
  number_three = measurements[i + 2]

  window = m + number_two + number_three if number_two && number_three
  measurement_windows << window if window
end

increased_count = 0

measurement_windows.each_with_index do |m, i|
  next if i == 0

  increased_count += 1 if m > measurement_windows[i - 1]
end

puts "Number of increased measurement windows is #{increased_count}."
