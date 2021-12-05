class Line
  attr_reader :all_points

  def initialize(point1, point2)
    @point1 = point1
    @point2 = point2
    @all_points = all_non_diagonal_line_points
  end

  private

  def all_non_diagonal_line_points
    return [] if diagonal_line?

    if horizontal_line?
      points_on_x_line
    else
      points_on_y_line
    end
  end

  def points_on_x_line
    start_range = @point1[0] < @point2[0] ? @point1[0] : @point2[0]
    end_range = start_range == @point1[0] ? @point2[0] : @point1[0]

    (start_range..end_range).to_a.map { |r| [r, @point1[1]] }
  end

  def points_on_y_line
    start_range = @point1[1] < @point2[1] ? @point1[1] : @point2[1]
    end_range = start_range == @point1[1] ? @point2[1] : @point1[1]

    (start_range..end_range).to_a.map { |r| [@point1[0], r] }
  end

  def diagonal_line?
    @point1[0] != @point2[0] && @point1[1] != @point2[1]
  end

  def horizontal_line?
    @point1[0] != @point2[0] && @point1[1] == @point2[1]
  end
end

input_file = File.join(File.dirname(__FILE__), 'input.txt')

lines = []
File.open(input_file).each_line do |line|
  points = line.split(' -> ').map { |c| c.chomp.split(',').map(&:to_i) }
  lines << Line.new(points[0], points[1])
end

all_points = lines.map(&:all_points).flatten(1)
points_with_overlap = all_points.select { |c| all_points.count(c) > 1 }
number_of_points_with_overlap = points_with_overlap.uniq.count

puts "The number of points where at least two lines overlap is #{number_of_points_with_overlap}."
