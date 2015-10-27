require 'csv'

arr1 = []

Dir.glob(ARGV[0]+"*").each do |filename|
	name = filename.split("/").last
	if /\b([a-zA-Z]+?)(\..+)/.match(name)
		len = name.size / 2
		arr1 << [name,len]
	end
end

Dir.glob(ARGV[1]+"*").each do |filename|
	name = filename.split("/").last
	if /\b([a-zA-Z]+?)(\..+)/.match(name)
		len = name.size / 2
		arr1 << [name,len]
	end
end

arr1.uniq!
arr1.sort! { |a,b| [a[1].to_i] <=> [b[1].to_i] }
arr1.reverse!

CSV.open("result.csv", "w") do |csv|
	arr1.each {|element| csv << element}
end
