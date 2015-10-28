require 'csv'

checked_files = []
folder1 = ARGV[0] 
folder2 = ARGV[1]

CSV.open("result.csv", "w") do |csv_array|

	Dir.glob(folder1 + "*").each do |file_name|
	
    		name = file_name.split("/").last.split("_")
    		full_name = file_name.split("/").last
    		sum = full_name.length
    		
    		if name.size != 3
 			csv_array << [full_name, full_name.length]
			checked_files << full_name + sum.to_s
    		end
	end
  	Dir.glob(folder2 + "*").each do |file_name|
  	
   		name = file_name.split("/").last.split("_")
    		full_name = file_name.split("/").last
    		sum = full_name.length.to_s
    		if name.size != 3 && !checked_files.include?(full_name + sum)
        		csv_array << [full_name, full_name.length]
     		end
    	end
end

my_csv = CSV.read 'result.csv'
my_csv = my_csv.sort_by {|a, b| [b.to_i, a]}
CSV.open("result.csv", "w") do |csv_arr|
        my_csv.each {|element| csv_arr << element}
end
