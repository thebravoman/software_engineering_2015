require 'csv'

CSV.open("result.csv", "w") do |csv|
	Dir.glob(ARGV[0] + "*") do |filename|
		splited = filename.split("/").last.split("_")

		if(splited.size == 3)
			if(splited.last.split(".").last == "rb")
				last = splited[1];

				if(last.length == 5)
					csv << [splited[0], splited[1]]
				end
			end
		end
	end
end

def sort_result
	my_csv = CSV.read 'result.csv'
	my_csv.sort! { |a,b| a[0].downcase <=> b[0].downcase }
	CSV.open("result.csv", "w") do |csv|
	  my_csv.each {|element| csv << element}
	end
end