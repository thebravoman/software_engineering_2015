=begin
Develop a program named FirstName_LastName_ClassNumber_642bd5.rb
1. you are given two arguments for a folders with files;
1.1 if there are other arguments they should be discarded;
2. file names in this folders are in the form First_Last_digits.rb;
3. find the students with 5 letters in the first name that are in both folders. A student is in both folders if it there is a file with the same First and Last Name. Digits might be different;
4. Sort the result by Last name ASC;
5. Produce a result in CSV format named result.csv: 
	LastName1,FirstName1
	LastName2,FirstName2 ... 
	LastNameN,FirstNameN 
=end

require 'csv'

names = []

CSV.open("result.csv", "w") do |csv|
	Dir.glob(ARGV[0] + "*").each do |file|
		filename = file.split('/').last.split('_')
			if filename[0].size == 5
				names << filename
			end
	end
	
	Dir.glob(ARGV[1] + "*").each do |file|
		filename = file.split('/').last.split('_')
			if filename[0].size == 5
				if names.include?(filename)
					csv << [filename[1], filename[0]]
				end
			end
	end
end

my_csv = CSV.read 'result.csv'
my_csv.sort! { |a,b| a[0] <=> b[0] }
CSV.open("result.csv", "w") do |csv|
  my_csv.each {|element| csv << element}
end
