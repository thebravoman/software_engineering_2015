require 'csv'

CSV.open("result.csv", "w") do |csv|
	Dir.glob(ARGV[0] + "*") do |filename|
	splitted = filename.split("/").last.split("_")

	if splitted.size == 3
	  if splitted.last.split(".").last == "rb"
	  last = splitted[1];
	    if(last.length == 5)
            csv << [splitted[0], splitted[1]]
            end
	  end
	end
    end
end

def sort_result
 my_csv = CSV.read 'result.csv'
 my_csv.sort! { |a,b| a[0] <=> b[0] }
 CSV.open("result.csv", "w") do |csv|
 	my_csv.each do |element|
 	csv << element
	    	 end
	end
end
