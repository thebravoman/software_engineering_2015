require 'csv'
def student_checked? checked_files, first_name, last_name
checked_files.include? [first_name,last_name]
end
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
CSV.open("result.csv", "w") do |csv_array|
previous_number = 0
Dir.glob(ARGV[0]+"*").each do |filename|
name = get_names filename
if valid_names? name
number = remove_file_ext name[2]
last_name = name[1]
first_name = name[0]
if !student_checked? checked_files,first_name,last_name
p "#{first_name},#{last_name},#{number}"
if last_name.size == 5
csv_array << [first_name,last_name]
checked_files << [first_name, last_name]
end
end
end
end
end
def sort_result
my_csv = CSV.read 'result.csv'
my_csv.sort! { |a,b| b[0] <=> a[0] }
CSV.open("result.csv", "w") do |csv|
my_csv.each {|element| csv << element}
end
end
sort_result
