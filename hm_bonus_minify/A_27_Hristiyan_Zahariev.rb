require 'csv'

csv_file = CSV.read ARGV[0]
date = ARGV[1]
value = ARGV[2].to_i
#csv_file.sort!{|a,b| a[2] <=> b[2]} #I couldn't understand the requirement. This is sorted by category
csv_file.each do |element|
  if element[0] == date && element[3].to_i.between?((value-10),(value+10))
    puts element * ","
  elsif value == 0 && element[0] == date
    puts element * ","
  end
end
