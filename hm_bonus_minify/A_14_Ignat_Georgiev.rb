require 'csv'
def date_value csv , date , value
  csv.each do |line|
    if line[0]==date
      if value !=0
        if line[3].to_i.between?((value-10),(value+10))
          puts line.join(',')
        end
      else		
	puts line.join(',')
 	 end
	end
	end
end
def string_csv csv,string
sum = 0
csv.sort!
 csv.each do |line|
    if line[1]==string
          puts line.join(',')	
	  sum = line[3].to_i + sum
        end
	end
puts sum
end
csv = CSV.read(ARGV[0])
second = ARGV[1]
third = ARGV[2].to_i
check_if_date = second.scan(/[a-zA-z]/).count
if check_if_date>0 && second != "xml"
string_csv csv,second
else
date_value csv,second,third
end	
