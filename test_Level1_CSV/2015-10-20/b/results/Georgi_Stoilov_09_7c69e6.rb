require 'csv'
def student_checked? checked_files, first_name, last_name
  checked_files.include? [first_name,last_name]
end
def solved? expected, result
  result.gsub(/\s+/, "") == expected ? 1: 0
end

def valid_names? names
  names.size == 3
end
def remove_file_ext value
  value.split(".").first
end
checked_files = []
CSV.open("result.csv", "w") do |csv_array|
  Dir.glob(ARGV[0]+"*").each do |filename|
    name =  filename.split("/").last.split(".")
    csv_array << name
  end

  Dir.glob(ARGV[1]+"*").each do |filename|
    name =  filename.split("/").last.split(".")
    csv_array << name
  end
end

def sort_result
  my_csv = CSV.read 'result.csv'
  my_csv.sort! { |a,b| [a[1].to_s] <=> [b[1].to_s] }
  CSV.open("result.csv", "w") do |csv|
    my_csv.each {|element| csv << element}
  end
end

my_csv = sort_result
my_csv.reverse

