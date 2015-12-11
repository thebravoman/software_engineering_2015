require 'date'

class String
  def is_number?
    true if Float(self) rescue false
  end
end

def is_date(string)
  begin
   Date.parse(string)
  rescue ArgumentError
     return false
  end
  true
end

file_path = ARGV[0]
first_argument = ARGV[1]
has_value = ARGV[2] != nil
value = ARGV[2].to_f if has_value
is_version3 = false
sum = 0

if (!is_date(first_argument) && !first_argument.is_number?)
  is_version3 = true
end

output = []

File.readlines(file_path).each do |line|
   line_details = line.split(',')
   line_date = line_details.first
   line_account = line_details[1]
   line_amount = line_details[3].to_f

   if (is_version3)
     if (line_account == first_argument)
       output.push(line)
       sum += line_amount.to_f
     end
   else
     if (has_value)
       output.push(line) if line_date == first_argument && line_amount.between?(value - 10, value + 10)
     else
       output.push(line) if line_date == first_argument
     end
   end

end

puts output
puts sum.to_i if is_version3
