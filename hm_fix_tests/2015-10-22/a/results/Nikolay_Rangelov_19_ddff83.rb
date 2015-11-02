require 'csv'


def write_csv arr
	CSV.open("result.csv","w") do |csv_array|
		arr.each do |line|
			csv_array << line
		end
	end
end

path_one = ARGV[0].to_s
path_two = ARGV[1].to_s
data_to_csv = []
filenames_in_csv = [];
number_of_digits = 0

Dir.glob(path_one+"*").each do |filename|
	splited = filename.split("/").last
	without_extension = splited.split(".").first

	number_of_digits = without_extension.scan(/[0123456789]/).count

	if number_of_digits == 7
		calced = (splited.size / 2).floor
		data_to_csv << [splited, calced]
		filenames_in_csv << splited
	end

	number_of_digits = 0
end

number_of_digits = 0

Dir.glob(path_two + "*").each do |filename|
	splited = filename.split("/").last
	without_extension = splited.split(".").first

	number_of_digits = without_extension.scan(/[0123456789]/).count
	
	if number_of_digits == 7
		calced = (splited.size / 2).floor
		if !filenames_in_csv.include?(splited)  # to be done
			data_to_csv << [splited, calced]
		end
	end

	number_of_digits = 0
end

data_to_csv.sort! { |a,b| a[0].downcase <=> b[0].downcase }
data_to_csv.reverse! 

write_csv data_to_csv
