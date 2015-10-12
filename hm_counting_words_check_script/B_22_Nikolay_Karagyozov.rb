require 'csv'

CSV.open("result.csv","w") do |csv|
	dummyfile = "text.txt"
	Dir.glob((ARGV[0]+"*")).each do |filename|
		next if filename == "#{ARGV[0]}#{dummyfile}"

		name = filename.split("/").last.split("_")
		result= `echo "dog dog cat woman man man dog cat" > #{dummyfile} && ruby #{filename} #{dummyfile}`
    p result
		solved = 0
		if result=="dog,3\ncat,2\nman,2\nwoman,1\n"
			solved = 1
		end
		csv << [name[0],name[1],name[2],name[3].split(".").first,solved]
	end
end

my_csv = CSV.read 'result.csv'
my_csv.sort! { |a,b| a[0] <=> b[0] }
CSV.open("result.csv", "w") do |csv|
	my_csv.each {|element| csv << element}
end
