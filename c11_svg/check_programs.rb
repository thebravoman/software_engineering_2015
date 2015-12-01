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

files = Dir.glob(ARGV[0] + '*').select { |f| File.file? f }
files.each do |filename|
	name = get_names filename
	if valid_names? name 
		last_name = remove_file_ext name[3]
		first_name = name[2]
		number = name[1]
		clazz = name[0]
		p "#{clazz},#{number},#{first_name},#{last_name}"
		`ruby #{filename} `
		`mv result.svg #{filename}.svg `
	end
end







