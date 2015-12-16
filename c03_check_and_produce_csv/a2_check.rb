require 'csv'

def student_checked? checked_files, first_name, last_name
	checked_files.include? [first_name,last_name]
end

def solved? expected, result
	result.gsub(/\s+/, "") == expected ? 1: 0
end

def get_names filename
	filename.split("/").last.split("_")
end

def valid_names? names
	names.size == 4
end

def remove_file_ext value
	value.split(".").first
end

checked_files = []

script_input = ARGV[1]
script_output = ARGV[2]
include_folder = ARGV[3]

CSV.open("result.csv", "w") do |csv_array|
	previous_number = 0
	files = Dir.glob(ARGV[0] + '*.rb').select { |f| File.file? f }
	files.each do |filename|
		name = get_names filename
		if valid_names? name 
			last_name = remove_file_ext name[3]
			first_name = name[2]
			number = name[1]
			clazz = name[0]
			if !student_checked? checked_files,first_name,last_name
				p "#{clazz},#{number},#{first_name},#{last_name}"
				include_folder_string = "-I #{clazz}_#{number}_#{first_name}_#{last_name}/" if include_folder
				result= `ruby #{include_folder_string} #{filename} #{script_input}`
				solved = solved? script_output, result
				print_result result,solved
				csv_array << [clazz,number,first_name,last_name,solved]
				checked_files << [first_name, last_name]
			end
		end
	end
end

def print_result result, solved
	p "The result is"
	p result
	p "Solved is:"
	p solved
end

def sort_result
	my_csv = CSV.read 'result.csv'
	my_csv.sort! { |a,b| [a[0],a[1].to_i] <=> [b[0],b[1].to_i] }
	CSV.open("result.csv", "w") do |csv|
	  my_csv.each {|element| csv << element}
	end
end

sort_result








