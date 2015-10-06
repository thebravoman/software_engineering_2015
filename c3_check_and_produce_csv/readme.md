# Time zones
What is UTC and +0300. What are time zone in programming.

## Get the log in local time
git log --date=local


# Check homeworks for quadratic equation
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

## Sort the file in ascending order by class

my_csv = CSV.read 'result.csv'
my_csv.sort! { |a,b| a[0] <=> b[0] }
CSV.open("result.csv", "w") do |csv|
	my_csv.each {|element| csv << element}
end

## Strip the result when comparing

require 'csv'

	solved = 0
	if result.strip=="-2.0,-1.0"
		solved = 1
	end
	
## Sort the file in ascending order by class and number

my_csv.sort! do |a, b| 
	(a[0] == b[0]) ? (a[1].to_i <=> b[1].to_i): (a[0] <=> b[0])
end


# Homework

 - How to checkout to a version before the dealine push.
