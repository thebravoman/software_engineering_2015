require 'csv'

def get_names filename
	filename.split("/").last.split("_")
end

def valid_names? names
	names.size == 3
end

def remove_file_ext value
	value.split(".").first
end

checked_files = []
folder = ARGV[0]
folder1 = ARGV[1]

CSV.open("result.csv", "w") do |my_csv|
	Dir.glob(folder+"*").each do |filename|
			name = get_names filename
			if valid_names? name 
				number = remove_file_ext name[2]
				last_name = name[1]
				first_name = name[0]
					p "#{first_name},#{last_name},#{number}"
					Dir.glob(folder1+"*").each do |filename1|
						name1 = get_names filename1
						if valid_names? name1
							number1 = remove_file_ext name1[2]
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
