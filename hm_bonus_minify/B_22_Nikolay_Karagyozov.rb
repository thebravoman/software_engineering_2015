file_path = ARGV[0]
date = ARGV[1]

output = []
File.readlines(file_path).each do |line|
   line_date = line.split(',')[0]
   output.push(line) if line_date == date
end
output.sort!
puts output
