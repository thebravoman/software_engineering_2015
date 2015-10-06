# Time zones
What is UTC and +0300

## Get the log in local time
git log --date=local

## Check homeworks and write in csv

require 'csv'

Dir.glob(ARGV[0]+"*").each do |filename|
	name = filename.split("/").last.split("_")
	p "#{name[0]},#{name[1]},#{name[2]},#{name[3].split(".").first}"
	result= `ruby #{filename} 1 3 2`
	CSV.open("result.csv","w") do |csv|
		solved = 0
		if result=="-2.0,-1.0\n"
			solved = 1
		end
		csv << [name[0],name[1],name[2],name[3].split(".").first,solved]
	end
	
end

## Open the file in append mode
CSV.open("result.csv","a")

## Sort the file in acsending order by class

require 'csv'

CSV.open("result.csv","w") do |csv|
	Dir.glob(ARGV[0]+"*").each do |filename|
		name = filename.split("/").last.split("_")
		p "#{name[0]},#{name[1]},#{name[2]},#{name[3].split(".").first}"
		result= `ruby #{filename} 1 3 2`
		solved = 0
		if result=="-2.0,-1.0\n"
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

# Homework

 - How to checkout to a version before the dealine push.
