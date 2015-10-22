require 'csv'

def valid_names? names
	names.size == 3
end

arr1 = []
arr2 = []
arr3 = []

Dir.glob(ARGV[0]+"*").each do |filename|
	name = filename.split("/").last.split("_")
	if valid_names? name
		arr1 << [name[0],name[1],name[2],name.legth]
	end
end

Dir.glob(ARGV[1]+"*").each do |filename|
	name = filename.split("/").last.split("_")
	if valid_names? name
		arr2 << [name[0],name[1],name[2],name.length]
	end
end

arr3 = arr1 | arr2

CSV.open("result.csv", "w") do |csv|
	csv << arr3
end

my_csv = CSV.read 'result.csv'
my_csv.sort! { |a,b| [a[3]] <=> [b[3]] }
CSV.open("result.csv", "w") do |csv|
  my_csv.each {|element| csv << element}
end



