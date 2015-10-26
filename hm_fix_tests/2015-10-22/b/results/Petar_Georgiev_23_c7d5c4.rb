require 'csv'

def get_names filename
	filename.split("/").last.split("_")
end

def valid_names? names
	names.size == 3
end

folder = ARGV[0]
folder1 = ARGV[1]

CSV.open("result.csv", "w") do |csv_array|
	Dir.glob(folder+"*").each do |filename|
			name = get_names filename
			if valid_names? name 
				last_name = name[1]
				first_name = name[0]
					Dir.glob(folder1+"*").each do |filename1|
						name1 = get_names filename1
						if valid_names? name1
							last_name1 = name1[1]
							first_name1 = name1[0]
							if first_name.size == 5 && first_name == first_name1 && last_name == last_name1
								csv_array << [first_name,last_name]
							end
						end
					end
			end
	end
end

csvfile = CSV.read "result.csv"
	csvfile.sort! do |a,b|
		a[1] <=> b[1]
	end
CSV.open('result.csv', 'w') do |csv|
  csvfile.each { |line| csv << line } 
end
