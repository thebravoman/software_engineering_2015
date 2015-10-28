require 'csv'

def valid_names? names
	(names[0].include?('a'...'z') and names[1].include?('a'...'z')) or (names[0].include?('A'...'Z') and names[1].include?('A'...'Z'))
end

arr1 = []
#name[0],name[1],
Dir.glob(ARGV[0]+"*").each do |filename|
	name = filename.split("/").last.split("_")
	#puts name
	#if valid_names? name
		len = name[0].length.to_i + name[1].length.to_i
		len = len.to_i/2
		arr1 << [name[0],name[1],len.to_s]
	#end
end

Dir.glob(ARGV[1]+"*").each do |filename|
	name = filename.split("/").last.split("_")
	#puts name
	#if valid_names? name
		len = name[0].length.to_i + name[1].length.to_i
		len = len/2
		arr1 << [name[0],name[1],len.to_s]
	#end
end

arr1.sort! { |a,b| [a[2].to_i] <=> [b[2].to_i] }
arr1.reverse!
arr1.uniq!

CSV.open("result.csv", "w") do |csv|
	arr1.each {|element| csv << element}
end
