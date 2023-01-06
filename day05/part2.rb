def horizontal_line?(point1, point2)
  (point1[0] != point2[0]) && (point1[1] == point2[1])
end

def vertical_line?(point1, point2)
  (point1[0] == point2[0]) && (point1[1] != point2[1])
end

def downward_diagonal?(point1, point2)
  (point1[0] - point2[0]) == (point1[1] - point2[1])
end

def upward_diagonal?(point1, point2)
  (point1[0] - point2[0]) == (point2[1] - point1[1])
end

input_file = File.join(File.dirname(__FILE__), 'input.txt')
field = Array.new(1000) { Array.new(1000, 0) }

File.open(input_file).each_line do |line|
  points = line.split(' -> ').map { |c| c.chomp.split(',').map(&:to_i) }

  if horizontal_line?(points[0], points[1])
    y = points[0][1]
    xs = points[0][0] > points[1][0] ? Range.new(points[1][0], points[0][0]).to_a : Range.new(points[0][0], points[1][0]).to_a
    xs.map { |x| field[y][x] = field[y][x] + 1 }
  elsif vertical_line?(points[0], points[1])
    ys = points[0][1] > points[1][1] ? Range.new(points[1][1], points[0][1]).to_a : Range.new(points[0][1], points[1][1]).to_a
    x = points[1][0]
    ys.map { |y| field[y][x] = field[y][x] + 1 }
  elsif downward_diagonal?(points[0], points[1])
    xs = points[0][0] > points[1][0] ? Range.new(points[1][0], points[0][0]).to_a : Range.new(points[0][0], points[1][0]).to_a
    y = points[0][1] > points[1][1] ? points[1][1] : points[0][1]

    xs.each do |x|
      field[y][x] = field[y][x] + 1
      y += 1
    end
  elsif upward_diagonal?(points[0], points[1])
    xs = points[0][0] > points[1][0] ? Range.new(points[1][0], points[0][0]).to_a : Range.new(points[0][0], points[1][0]).to_a
    y = points[0][1] > points[1][1] ? points[0][1] : points[1][1]

    xs.each do |x|
      field[y][x] = field[y][x] + 1
      y -= 1
    end
  end
end

number_of_points_with_overlap = field.flatten.count { |value| value > 1 }

puts "The number of points where at least two lines overlap is #{number_of_points_with_overlap}."
