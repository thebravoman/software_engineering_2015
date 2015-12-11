require 'csv'
def printing(csv_file, date)
 csv_file.each do |line|
   if line[0] == date
     puts line.join(',')
   end
 end
end
def printing_with_value(csv_file, date, value)
  csv_file.each do |line|
    if line[0] == date && line[3].to_i.between?((value - 10), (value + 10))
      puts line.join(',')
    end
  end
end
def printing_matched_string(csv_file, date_or_string)
sum_amount = 0
csv_file=csv_file.sort{|a,b|DateTime.parse(a[0]) <=> DateTime.parse(b[0])}

  csv_file.each do |line|
    if date_or_string == line[1]
      sum_amount += line[3].to_i 
      puts line.join(',') 
    end
  end
  
  if sum_amount != 0
    puts sum_amount.to_i
  end
end

file = CSV.read ARGV[0]
date_or_string = ARGV[1]
value = ARGV[2].to_i

not_a_date =  date_or_string.count("/")
valid_date = date_or_string.scan(/[a-z_\s]/).count

if not_a_date == 2 && valid_date == 0
  if ARGV[2]
    printing_with_value(file, date_or_string, value)
  else 
    printing(file, date_or_string) 
  end
end

if !(not_a_date == 2) && !(valid_date == 0) && !(date_or_string == 'xml')
  printing_matched_string(file, date_or_string)
end
