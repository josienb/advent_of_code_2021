require 'benchmark'
require 'open3'

days = Dir.children(Dir.pwd).select { |d| d.start_with?('day') }.sort

days.each do |day|
  puts "*** Advent of Code 2021 - #{day} ***"

  ['1', '2'].each do |part|
    file = "#{day}/part#{part}.rb"
    next unless File.exist?(file)

    puts "=> Part #{part}"

    stdout_str = ''
    stderr_str = ''
    status = nil

    realtime = Benchmark.realtime do
      stdout_str, stderr_str, status = Open3.capture3("ruby #{file}")
    end

    if status.success?
      puts stdout_str
    else
      puts stderr_str
    end

    puts "Realtime: #{realtime} seconds"
  end
end
