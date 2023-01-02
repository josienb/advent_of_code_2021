require 'open3'

days = Dir.children(Dir.pwd).select { |d| d.start_with?('day') }.sort

days.each do |day|
  ['1', '2'].each do |part|
    file = "#{day}/part#{part}.rb"
    next unless File.exist?(file)

    puts "Advent of Code 2021 - #{day} - part #{part}"

    stdout_str, stderr_str, status = Open3.capture3("ruby #{file}")
    if status.success?
      puts stdout_str
    else
      puts stderr_str
    end
  end
end
