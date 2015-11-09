require 'csv'

RESULT_FOLDER = "result.csv"

folder = ARGV[0]
ARGV.clear

CSV.open(RESULT_FOLDER, "w") do |csv|
	Dir.glob(folder + "/*").each do |filename|
		name = filename.split("/").last.split("_")
		if name.size == 3
			first_name = name[0]
			last_name = name[1]
			if name[1].size == 10
				csv << [first_name, last_name]
			end
		end
	end
end

csv_array = CSV.read RESULT_FOLDER
csv_array = csv_array.sort_by {|item| item[1]}
CSV.open(RESULT_FOLDER, "w") do |csv|
  csv_array.each {|element| csv << element}
end