class BingoBoard
  attr_reader :rows, :columns

  def initialize(rows)
    @rows = rows
    @columns = rows.transpose
  end

  def mark_number(number)
    @rows = @rows.each { |row| row.reject! { |item| item == number } }
    @columns = @columns.each { |col| col.reject! { |item| item == number } }
  end

  def bingo?
    @rows.select(&:empty?).any? || @columns.select(&:empty?).any?
  end

  def sum_of_unmarked_numbers
    @rows.flatten.sum
  end
end

input_file = File.join(File.dirname(__FILE__), 'input.txt')

bingo_numbers = File.open(input_file).first.split(',').map(&:chomp).map(&:to_i)

all_bingo_boards = []
board_start = false

File.open(input_file).each_with_index do |line, index|
  next if index == 0

  if line == "\n"
    board_start = false
  elsif line.size != 0 && board_start == false
    board_start = true
    all_bingo_boards << line.split.map(&:chomp).map(&:to_i)
  else
    all_bingo_boards << line.split.map(&:chomp).map(&:to_i)
  end
end

matrix_bingo_boards = []
number_of_boards = all_bingo_boards.size / 5

number_of_boards.times { |_b| matrix_bingo_boards << BingoBoard.new(all_bingo_boards.shift(5)) }

bingo_making_number = nil
bingo_board_with_bingo = nil

bingo_numbers.each do |bingo_number|
  matrix_bingo_boards.map { |board| board.mark_number(bingo_number) }
  bingo_making_number = bingo_number
  bingo_board_with_bingo = matrix_bingo_boards.map(&:bingo?).find_index(true)
  break if bingo_board_with_bingo
end

sum_of_unmarked_numbers = matrix_bingo_boards[bingo_board_with_bingo].sum_of_unmarked_numbers

puts "The score of the winning board is #{sum_of_unmarked_numbers * bingo_making_number}."
