require 'csv'
require 'date'

filename = ARGV[0]
string = ARGV[1]
input_val = ARGV[2].to_i
DATE_ELEMENT = 0
ACC_ELEMENT = 1
d = string.split("/")
sum = 0

def numeric? string
    Float(string) != nil rescue false
end

def date? d
  (numeric? d[0]) && (numeric? d[1]) && (numeric? d[2])   
end

arr = []
if (date? d) || (string == 'xml') || (numeric? string)
    date = string
    if ARGV[2]
	    CSV.open(filename, 'r').each do |row|
		    val = row[3]
		    val = val.to_i
		    if row[DATE_ELEMENT] == date && (val-10)<input_val && input_val<(val+10)
			    puts row.join(",")
		    end
	    end
    else
	    CSV.open(filename, 'r').each do |row|
		    if row[DATE_ELEMENT] == date
		      puts row.join(",")
		    end  
	    end
    end
else
  CSV.open(filename, 'r').each do |row|
    if row[ACC_ELEMENT] == string
      sum = sum + row[3].to_i
      arr << row.to_a
    end
  end
  arr.sort{|a, b| a[0] <=> b[0]}
  puts arr.join(",")
  puts sum
end
