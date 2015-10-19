require 'csv'
OUT_FILE="result.csv"
input = ARGV[0]
command = ARGV[1]
first_option = ARGV[2]
second_option = ARGV[3]
def sort_option my_csv, first_option, second_option
     if first_option == "0" 
        my_csv.sort!{|a,b| [a[0]] <=> [b[0]]}
    end
    if first_option == "1"
        my_csv.sort!{|a,b| [a[1]] <=> [b[1]]}
    end
    if first_option == "2"
        my_csv.sort!{|a,b| [a[2]] <=> [b[2]]}
    end
     if second_option.to_s.downcase == "desc"  
     	my_csv.reverse
     end
     out_csv my_csv 	
end

def out_csv my_csv
	CSV.open(OUT_FILE, "w") do |csv|
      my_csv.each {|element| csv << element}
    end
end
def filter_cost my_csv, first_option, second_option
  CSV.open(OUT_FILE, "w") do |csv|
    my_csv.each do |element|          
	if element[2].to_i >= first_option && element[2].to_i <= second_option
	  csv << element                      
	end
    end
  end  
end

my_csv = CSV.read(input)
	case command.downcase
	    when "sort"
	    	first_option.to_i
	    	second_option.to_s   
	    	sort_option my_csv, first_option, second_option
	    when "filter_costs"
	    	first_option.to_i
	    	second_option.to_i
	    	filter_cost my_csv, first_option, second_option
	end
