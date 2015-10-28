require 'csv'

def 
	student_checked? checked_files, first_name, last_name,digits
	checked_files.include? [first_name,last_name,digits]
end

def remove_file_ext value
	value.split(".").first
end

CSV.open("result.csv", "w") do |csv_array|
	checked_files = []
	
Dir.glob(ARGV[0]+"*").each do |file|

	name = filename.split("/").last.split("_")
	if last_name.size == 5
	p "#{first_name},#{last_name},#{digits}"
	
	if !student_checked? 
		checked_files,first_name,last_name,digits
		
	p "#{first_name},#{last_name},#{digits}"
	result= `ruby #{filename} #{script_input}`
	#result = file.split('/').last.split('_')


def sort_result
	my_csv = CSV.read 'result.csv'
	my_csv.sort! { |a,b| [a[0],a[1].to_i] <=> [b[0],b[1].to_i] }

	CSV.open("result.csv","w") do |csv|
		my_csv.each {|element| csv << element}
	end

end
