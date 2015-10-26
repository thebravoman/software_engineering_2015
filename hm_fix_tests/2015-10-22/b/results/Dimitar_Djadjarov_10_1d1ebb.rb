require 'csv'

def get_names filename
	filename.split("/").last.split("_")
end

def valid_names? names
	names.size == 3
end
csv_array = []
Dir.glob(ARGV[0] + "*").each do | filename|
	name = get_names filename
	if valid_names? name 
		last_name = name[1]
		first_name = name[0]
		if first_name.size == 5
			csv_array << [first_name,last_name]
		end
	end
end
Dir.glob(ARGV[0] + "*").each do | filename|
	name = get_names filename
	if valid_names? name 
		last_name = name[1]
		first_name = name[0]
		if first_name.size == 5
			csv_array << [first_name,last_name]
		end
	end
end

csv_array.uniq!

csv_array.sort!{|a,b| a[1] <=> b[1]}
CSV.open('result.csv', 'wb') do |csv|
	csv_array.each { |line| csv << line }
end
