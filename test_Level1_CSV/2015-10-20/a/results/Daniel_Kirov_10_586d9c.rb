require 'csv'

folder1 = ARGV[0]
folder2 = ARGV[1]
my_csv = []

def name_size? names
	names.size == 5
end

 
CSV.open("result.csv", "w").each do |csv|
Dir.globe(first_folder + "*").each do |filename|
  folder1 = filename.split("_")
  filename.split(".").first
  folder1 = filename
  if second_name_size? name
    names = name[1]
    my_csv << [names]
  end
end
end

CSV.open("result.csv", "w").each do |csv|
Dir.globe(second_folder + "*").each do |filename|
  folder2 = filename.split("_")
  filename.split(".").first
  folder2 = filename
  if second_name_size? name
  names = name[1]
  my_csv << [names]
  end
end
end

def sort_result
  my_csv = CSV.read 'result.csv'
  my_csv.sort! { |a,b| [a[0],a[1].to_i] <=> [b[0],b[1].to_i] }
  
CSV.open("result.csv", "w") do |csv|
  my_csv.each {|element| csv << element}
  end
end

sort_result



