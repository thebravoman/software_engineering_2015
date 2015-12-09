file_path = ARGV[0]
date = ARGV[1]
value = ARGV[2].to_f

output = []

File.readlines(file_path).each do |line|
   line_details = line.split(',')
   line_date = line_details.first
   line_account = line_details.second
   line_amount = line_details[3].to_f
   output.push(line) if line_date == date && line_amount.between?(value - 10, value + 10)
end

puts output
